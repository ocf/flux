templates=./templates/*

if [ -d "./generated" ]; then
  if [ "$1" == "-f" ]; then
    rm -rf ./generated
  else
    echo "please delete the ./generated directory before continuing or run with -f"
    exit
  fi
fi

files=$(find ./cluster -path "templates" -prune -o -type f -name "*.cue") 
echo "running cue trim + cue vet pass"
for f in $files
do
  out="./generated${f#./cluster}"
  out="${out%.cue}.yaml"
  cue trim -f $templates "$f"
  cue vet -iE $templates "$f"
  if [ $? -ne 0 ]; then
    echo "$f FAILED vetting, aborting"
    exit
  fi
done
echo "generating manifests"
for f in $files
do
  out="./generated${f#./cluster}"
  out="${out%.cue}.yaml"
  echo "generating $out"

  num=$(cue export --out yaml -e "len(objects)" $templates "${f}")


  if [ $num -le 0 ]; then
    continue
  fi

  mkdir -p "$(dirname $out)"

  for ((i=0;i<num;i++)); do
    if [ $i -ne 0 ]; then
      echo "---" >> $out
    fi
    cue export --out yaml -e "objects[$i]" $templates "${f}" >> $out
  done
done
