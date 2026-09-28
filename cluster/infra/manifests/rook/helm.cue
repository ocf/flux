package kube

toplevel: namespace: rook: _
toplevel: helmRepository: rook: {
	metadata: namespace: "rook"
	spec: url:           "https://charts.rook.io/release"
}
toplevel: helmRelease: rook: {
	metadata: namespace: "rook"
	spec: {
		chart: spec: {
			chart: "rook-ceph"
			sourceRef: name: "rook"
			version: "v1.19.5"
		}
		values: {
			csi: {
				csiCephFSPluginVolume: [{
					hostPath: path: "/run/booted-system/kernel-modules/lib/modules/"
					name: "lib-modules"
				}, {
					hostPath: path: "/nix"
					name: "host-nix"
				}]
				csiCephFSPluginVolumeMount: [{
					mountPath: "/nix"
					name:      "host-nix"
					readOnly:  true
				}]
				csiRBDPluginVolume: [{
					hostPath: path: "/run/booted-system/kernel-modules/lib/modules/"
					name: "lib-modules"
				}, {
					hostPath: path: "/nix"
					name: "host-nix"
				}]
				csiRBDPluginVolumeMount: [{
					mountPath: "/nix"
					name:      "host-nix"
					readOnly:  true
				}]
			}
			dashboard: enabled: true
			enableDiscoveryDaemon: true
			network: dualStack: true
		}
	}
}
