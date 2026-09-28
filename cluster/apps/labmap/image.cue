package kube

toplevel: imageRepository: "labmap-backend": {
	apiVersion: "image.toolkit.fluxcd.io/v1"
	kind:       "ImageRepository"
	metadata: {
		name:      "labmap-backend"
		namespace: "flux-system"
	}
	spec: {
		image:    "ghcr.io/ocf/labmap2-backend"
		interval: "5m0s"
	}
}
toplevel: imagePolicy: "labmap-backend": {
	apiVersion: "image.toolkit.fluxcd.io/v1"
	kind:       "ImagePolicy"
	metadata: {
		name:      "labmap-backend"
		namespace: "flux-system"
	}
	spec: {
		imageRepositoryRef: name: "labmap-backend"
		filterTags: pattern:      "^latest$"
		policy: alphabetical: {}
		digestReflectionPolicy: "Always"
		interval:               "10m"
	}
}
toplevel: imageRepository: "labmap-frontend": {
	apiVersion: "image.toolkit.fluxcd.io/v1"
	kind:       "ImageRepository"
	metadata: {
		name:      "labmap-frontend"
		namespace: "flux-system"
	}
	spec: {
		image:    "ghcr.io/ocf/labmap2-frontend"
		interval: "5m0s"
	}
}
toplevel: imagePolicy: "labmap-frontend": {
	apiVersion: "image.toolkit.fluxcd.io/v1"
	kind:       "ImagePolicy"
	metadata: {
		name:      "labmap-frontend"
		namespace: "flux-system"
	}
	spec: {
		imageRepositoryRef: name: "labmap-frontend"
		filterTags: pattern:      "^latest$"
		policy: alphabetical: {}
		digestReflectionPolicy: "Always"
		interval:               "10m"
	}
}
