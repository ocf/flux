package kube

toplevel: imageRepository: cilium: {
	apiVersion: "image.toolkit.fluxcd.io/v1"
	kind:       "ImageRepository"
	metadata: {
		name:      "cilium"
		namespace: "flux-system"
	}
	spec: {
		image:    "quay.io/cilium/charts/cilium"
		interval: "5m0s"
	}
}
toplevel: imagePolicy: cilium: {
	apiVersion: "image.toolkit.fluxcd.io/v1"
	kind:       "ImagePolicy"
	metadata: {
		name:      "cilium"
		namespace: "flux-system"
	}
	spec: {
		imageRepositoryRef: name: "cilium"
		policy: semver: range: ">=1.0.0"
	}
}
