
```yaml
apiVersion: monitoring.coreos.com/v1
kind: PodMonitor
metadata:
  name: gateway-core
  namespace: istio-monitoring
  labels:
    istio: core
spec:
  jobLabel: gateway-core
  namespaceSelector:
    matchNames:
    - istio-system
  selector:
    matchExpressions:
    - key: istio.io/rev
      operator: Exists
    - key: app
      operator: In
      values:
      - istio-ingressgateway-core

apiVersion: monitoring.coreos.com/v1
kind: Prometheus
metadata:
  name: gateway-core
  namespace: istio-monitoring
spec:
  replcias: 2
  podMonitorSelector:
    matchLabels:
      istio: core
```
