package kube

toplevel: cephFilesystem: "cephfs-hybrid": {
	apiVersion: "ceph.rook.io/v1"
	kind:       "CephFilesystem"
	metadata: {
		name:      "cephfs-hybrid"
		namespace: "rook"
	}
	spec: {
		dataPools: [{
			deviceClass:   "nvme"
			failureDomain: "host"
			name:          "nvme"
			replicated: size: 3
		}, {
			deviceClass:   "hdd"
			failureDomain: "host"
			name:          "hdd"
			replicated: size: 3
		}]
		metadataPool: {
			deviceClass:   "nvme"
			failureDomain: "host"
			replicated: size: 3
		}
		metadataServer: {
			activeCount:   1
			activeStandby: true
		}
		preserveFilesystemOnDelete: true
	}
}
