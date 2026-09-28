package kube

toplevel: namespace: "cert-manager": _
toplevel: helmRepository: "cert-manager": {
	metadata: {
		namespace: "cert-manager"
	}
	spec: {
		type: "oci"
		url:  "oci://quay.io/jetstack/charts"
	}
}
toplevel: helmRelease: "cert-manager": {
	metadata: {
		namespace: "cert-manager"
	}
	spec: {
		chart: spec: {
			chart:   "cert-manager"
			version: "v1.21.1"
			sourceRef: {
				name: "cert-manager"
			}
		}
		values: installCRDs: true
	}
}
