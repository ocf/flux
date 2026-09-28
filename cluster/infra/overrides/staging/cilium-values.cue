package kube

import "encoding/yaml"

toplevel: configMap: values: {
	apiVersion: "v1"
	kind:       "ConfigMap"
	metadata: {
		name:      "values"
		namespace: "cilium"
		labels: "reconcile.fluxcd.io/watch": "Enabled"
	}
	data: {
		"values.yaml": yaml.Marshal(_cue_values_yaml)
		let _cue_values_yaml = {
			k8sServiceHost: "gravitywell.ocf.berkeley.edu"
			ingressController: service: annotations: "lbipam.cilium.io/ips": "169.229.226.105,2607:f140:8801::1:105"
		}, }
}
