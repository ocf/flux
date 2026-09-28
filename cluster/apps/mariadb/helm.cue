package kube

toplevel: namespace: mariadb: _
toplevel: helmRepository: mariadb: {
	metadata: {
		namespace: "mariadb"
	}
	spec: {
		type: "oci"
		url:  "oci://ghcr.io/mariadb-operator/charts"
	}
}
toplevel: helmRelease: "mariadb-operator-crds": {
	metadata: {
		namespace: "mariadb"
	}
	spec: {
		chart: spec: {
			chart:   "mariadb-operator-crds"
			version: "26.6.0"
			sourceRef: {
				name: "mariadb"
			}
			interval: "5m0s"
		}
	}
}
toplevel: helmRelease: "mariadb-operator": {
	metadata: {
		namespace: "mariadb"
	}
	spec: {
		chart: spec: {
			chart:   "mariadb-operator"
			version: "26.6.0"
			sourceRef: {
				name: "mariadb"
			}
			interval: "5m0s"
		}
		valuesFrom: [{
			kind: "ConfigMap"
			name: "mariadb-operator-values"
		}]
	}
}
toplevel: helmRelease: "mariadb-cluster": {
	metadata: {
		namespace: "mariadb"
	}
	spec: {
		chart: spec: {
			chart:   "mariadb-cluster"
			version: "26.6.0"
			sourceRef: {
				name: "mariadb"
			}
			interval: "5m0s"
		}
		valuesFrom: [{
			kind: "ConfigMap"
			name: "mariadb-cluster-values"
		}]
	}
}
