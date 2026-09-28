module: "ocf.berkeley.edu/flux"
language: {
	version: "v0.16.1"
}
deps: {
	"cue.dev/x/crd/fluxcd.io@v0": {
		v:       "v0.7.0"
		default: true
	}
	"cue.dev/x/k8s.io@v0": {
		v:       "v0.12.0"
		default: true
	}
}
