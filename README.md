# Quark

A simple python application for test

## Deploy on Openshift

```bash
# Create namespaces
NAMESPACE=quark
oc create namespace $NAMESPACE

# Deploy SWIM
oc process -f template.yaml -n $NAMESPACE \
    -p APP_NAME=swim \
    -p APP_VERSION=v1 \
    -p APP_TYPE=passthrough \
    -p APP_DESTINATION=http://bike:5000/bike | oc apply -f - -n $NAMESPACE

# Deploy BIKE
oc process -f template.yaml -n $NAMESPACE \
    -p APP_NAME=bike \
    -p APP_VERSION=v1 \
    -p APP_TYPE=passthrough \
    -p APP_DESTINATION=http://run:5000/run | oc apply -f - -n $NAMESPACE

# Deploy RUN 
oc process -f template.yaml -n $NAMESPACE \
    -p APP_NAME=run \
    -p APP_VERSION=v1 \
    -p APP_TYPE=edge | oc apply -f - -n $NAMESPACE

# Expose SERVICE
oc expose svc swim --name=start

# Test ROUTE
sleep 10 
curl $(oc get routes start -o jsonpath='{ .spec.host }')/swim
```

## Deploy on Openshift s2i

```bash
# Namespace
NAMESPACE=quark

# Build and Deploy App
oc new-app python:latest~https://gitlab.com/gonzaloacosta/quark.git --name=quark \
    -e APP_NAME=quark \
    -e APP_VERSION=v1 \
    -e QUARK_TYPE=edge -n $NAMESPACE
```

