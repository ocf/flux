package kube

toplevel: deployment: "labmap-backend": {
	metadata: {
		namespace: "labmap"
	}
	spec: {
		template: {
			spec: {
				containers: [{
					envFrom: [{
						secretRef: name: "prometheus-secret"
					}]
					image: "ghcr.io/ocf/labmap2-backend:latest@sha256:366ca63403d93de78f8306b075ffc2498351159a08d9b8df2f18b0109a4d8faf" // {"$imagepolicy": "flux-system:labmap-backend"}
					livenessProbe: {
						failureThreshold: 6
						httpGet: {
							path: "/health"
							port: 8080
						}
						initialDelaySeconds: 10
						timeoutSeconds:      3
					}
					ports: [{containerPort: 8080}]
					readinessProbe: {
						httpGet: {
							path: "/health"
							port: 8080
						}
						initialDelaySeconds: 5
						periodSeconds:       5
					}
				}]
			}
		}
	}
}
toplevel: deployment: "labmap-frontend": {
	metadata: {
		namespace: "labmap"
	}
	spec: {
		template: {
			spec: {
				containers: [{
					image: "ghcr.io/ocf/labmap2-frontend:latest@sha256:393e541f19153e2ef9bd5c1529d32454a9d782ae9640f4b31cab17fe84c560c2" // {"$imagepolicy": "flux-system:labmap-frontend"}
					ports: [{containerPort: 8080}]
				}]
			}
		}
	}
}
