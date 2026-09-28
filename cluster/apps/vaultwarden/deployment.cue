package kube

toplevel: deployment: vaultwarden: {
	spec: {
		template: {
			spec: {
				containers: [{
					env: [{
						name:  "ADMIN_TOKEN"
						value: "" // we intentionally disable the admin page
					}, {
						name:  "SIGNUPS_ALLOWED"
						value: "false"
					}, {
						name:  "DOMAIN"
						value: "https://vaultwarden.ocf.berkeley.edu"
					}, {
						name:  "ORG_CREATION_USERS"
						value: "none"
					}, {
						name:  "SSO_ENABLED"
						value: "true"
					}, {
						name:  "SSO_ONLY"
						value: "true"
					}, {
						name:  "SSO_AUTHORITY"
						value: "https://idm.ocf.berkeley.edu/realms/ocf"
					}, {
						name:  "SSO_CLIENT_ID"
						value: "vaultwarden"
					}, {
						name:  "SSO_AUTH_ONLY_NOT_SESSION"
						value: "true"
					}]
					envFrom: [{
						secretRef: name: "vaultwarden"
					}]
					volumeMounts: [{
						mountPath: "/data"
						name:      "vaultwarden-data"
					}]
					image: "vaultwarden/server:1.37.3"
					livenessProbe: {
						failureThreshold: 6
						httpGet: {
							path: "/alive"
							port: 80
						}
						initialDelaySeconds: 10
						timeoutSeconds:      3
					}
					readinessProbe: {
						httpGet: {
							path: "/alive"
							port: 80
						}
						initialDelaySeconds: 5
						periodSeconds:       5
					}
					ports: [{containerPort: 80}]
				}]
				volumes: [{
					name: "vaultwarden-data"
					persistentVolumeClaim: claimName: "vaultwarden-data"
				}]
			}
		}
	}
}
