package kube

import (
	core "cue.dev/x/k8s.io/api/core/v1"
	source "cue.dev/x/crd/fluxcd.io/source/v1"
	helm "cue.dev/x/crd/fluxcd.io/helm/v2"
)

toplevel: namespace: [Name=_]: core.#Namespace & {
	metadata: name: Name
}
toplevel: helmRepository: [Name=_]: source.#HelmRepository & {
	metadata: {
		name:      Name
		namespace: string | *Name
	}
	spec: {
		interval: "15m0s"
	}
}
toplevel: helmRelease: [Name=_]: helm.#HelmRelease & {
	metadata: {
		name:      Name
		namespace: string | *Name
	}
	spec: {
		interval: "15m0s"
		timeout:  "5m0s"
		chart: spec: {
			chart:             string
			reconcileStrategy: "ChartVersion"
			sourceRef: {
				kind: "HelmRepository"
				name: string
			}
		}
		releaseName: Name
		install: remediation: retries: 3
		upgrade: remediation: retries: 3
		test: enable: true
	}
}
