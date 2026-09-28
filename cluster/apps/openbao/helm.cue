package kube

toplevel: namespace: openbao: _
toplevel: helmRepository: openbao: {
	metadata: {
		namespace: "openbao"
	}
	spec: {
		url: "https://openbao.github.io/openbao-helm"
	}
}
toplevel: helmRelease: openbao: {
	metadata: {
		namespace: "openbao"
	}
	spec: {
		chart: spec: {
			chart:   "openbao"
			version: "0.29.4"
			sourceRef: {
				name: "openbao"
			}
		}
		valuesFrom: [{
			kind: "ConfigMap"
			name: "openbao-values"
		}]
	}
}
