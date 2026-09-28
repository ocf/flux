package kube

toplevel: cephObjectStore: "rgw-hdd": {
	apiVersion: "ceph.rook.io/v1"
	kind:       "CephObjectStore"
	metadata: {
		name:      "rgw-hdd"
		namespace: "rook"
	}
	spec: {
		dataPool: {
			deviceClass:   "hdd"
			failureDomain: "host"
			replicated: size: 3
		}
		gateway: {
			instances: 1
			port:      80
		}
		metadataPool: {
			deviceClass:   "nvme"
			failureDomain: "host"
			replicated: size: 3
		}
		preservePoolsOnDelete: true
	}
}
