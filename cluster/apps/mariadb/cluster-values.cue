package kube

import "encoding/yaml"

toplevel: configMap: "mariadb-cluster-values": {
	apiVersion: "v1"
	kind:       "ConfigMap"
	metadata: {
		name:      "mariadb-cluster-values"
		namespace: "mariadb"
		labels: "reconcile.fluxcd.io/watch": "Enabled"
	}
	data: {
		"values.yaml": yaml.Marshal(_cue_values_yaml)
		let _cue_values_yaml = {
			mariadb: {
				rootPasswordSecretKeyRef: {
					name:     "initial-secret"
					key:      "root-password"
					generate: false
				}
				storage: size: "1Gi"
				replicas: 3
				galera: enabled: true
			}
			databases: [{
				name:            "ocf"
				characterSet:    "utf8"
				collate:         "utf8_general_ci"
				cleanupPolicy:   "Skip"
				requeueInterval: "10h"
				retryInterval:   "30s"
			}]
		}, }
}
