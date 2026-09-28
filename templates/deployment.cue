package kube

import (
	apps "cue.dev/x/k8s.io/api/apps/v1"
)

toplevel: deployment: [Name=_]: apps.#Deployment & {
	metadata: {
		name:      Name
		namespace: string | *Name
	}
	spec: {
		replicas: int | *1
		selector: matchLabels: "ocf.berkeley.edu/flux": Name
		template: {
			metadata: labels: "ocf.berkeley.edu/flux": Name
			spec: {
				containers: [{
					imagePullPolicy: "IfNotPresent"
					name:            string | *"main"
				}]
				dnsConfig: searches: ["ocf.berkeley.edu"]
				dnsPolicy: "ClusterFirst"
			}
		}
	}
}
