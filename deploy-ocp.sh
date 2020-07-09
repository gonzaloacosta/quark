# Create namespaces
NAMESPACE=quark
oc create namespace $NAMESPACE

# Deploy swim
oc process -f template.yaml -n $NAMESPACE \
    -p APP_NAME=swim \
    -p APP_VERSION=v1 \
    -p QUARK_TYPE=passthrough \
    -p QUARK_DESTINATION=http://bike:5000/bike | oc apply -f - -n $NAMESPACE

# Deploy bike
oc process -f template.yaml -n $NAMESPACE \
    -p APP_NAME=bike \
    -p APP_VERSION=v1 \
    -p QUARK_TYPE=passthrough \
    -p QUARK_DESTINATION=http://run:5000/run | oc apply -f - -n $NAMESPACE

# Deploy run
oc process -f template.yaml -n $NAMESPACE \
    -p APP_NAME=run \
    -p APP_VERSION=v1 \
    -p QUARK_TYPE=passthrough \
    -p QUARK_DESTINATION=http://finisher:5000/finisher | oc apply -f - -n $NAMESPACE

# Deploy finisher
oc process -f template.yaml -n $NAMESPACE \
    -p APP_NAME=finisher \
    -p APP_VERSION=v1 \
    -p QUARK_TYPE=edge | oc apply -f - -n $NAMESPACE
