package kube

toplevel: namespace: cilium: _
toplevel: helmRepository: cilium: {
	metadata: {
		namespace: "cilium"
	}
	spec: {
		type: "oci"
		url:  "oci://quay.io/cilium/charts"
	}
}
toplevel: helmRelease: cilium: {
	metadata: {
		namespace: "cilium"
	}
	spec: {
		chart: spec: {
			chart:   "cilium"
			version: "1.20.1" // {"$imagepolicy": "flux-system:cilium:tag"}
			sourceRef: {
				name: "cilium"
			}
		}
		valuesFrom: // you must override these on a per-cluster basis
		[{
			kind: "ConfigMap"
			name: "values"
		}]
		values: {
			autoDirectNodeRoutes: true
			bpf: masquerade:         true
			endpointRoutes: enabled: true
			hubble: {
				listenAddress: ":4244"
				relay: enabled: true
				tls: auto: method: "cronJob"
				ui: enabled: true
			}
			ingressController: {
				enabled:          true
				default:          true
				enforceHttps:     true
				loadbalancerMode: "shared"
			}
			l2announcements: enabled: true
			ipam: {
				mode:               "kubernetes"
				requireIPv4PodCIDR: true
				requireIPv6PodCIDR: true
			}
			ipv4: enabled: true
			ipv4NativeRoutingCIDR: "10.244.0.0/16"
			ipv6: enabled: true
			ipv6NativeRoutingCIDR: "2607:f140:8801:1::/112"
			k8s: {
				requireIPv4PodCIDR: true
				requireIPv6PodCIDR: true
			}
			k8sServicePort:       "6443"
			kubeProxyReplacement: "true"
			loadBalancer: {
				acceleration: "native"
				mode:         "hybrid"
			}
			routingMode: "native"
		}
	}
}
