# Quark

Aplicación en python para test de deployments en Kubernetes

## Commands


## Test with JMeter

+ Replicas 1

```bash
for i in $(oc get deploy | awk '/v1/ { print $1 }') ; do oc scale deployment $i --replicas=1 ; done
```

- Result


+ Replicas 2

```bash
for i in $(oc get deploy | awk '/v1/ { print $1 }') ; do oc scale deployment $i --replicas=2 ; done
```
