package kube

toplevel: ciliumLoadBalancerIPPool: "pool-1": {
	apiVersion: "cilium.io/v2"
	kind:       "CiliumLoadBalancerIPPool"
	metadata: name: "pool-1"
	spec: blocks: [{
		start: "169.229.226.105"
		stop:  "169.229.226.107"
	}, {
		start: "2607:f140:8801::1:105"
		stop:  "2607:f140:8801::1:107"
	}]
}
toplevel: ciliumL2AnnouncementPolicy: "policy-1": {
	apiVersion: "cilium.io/v2alpha1"
	kind:       "CiliumL2AnnouncementPolicy"
	metadata: name:        "policy-1"
	spec: loadBalancerIPs: true
}
