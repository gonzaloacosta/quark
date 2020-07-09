# Namespace
NAMESPACE=quark

# Build and Deploy App
oc new-app python:latest~https://github.com/gonzaloacosta/quark.git --name=quark \
	-e APP_NAME=quark \
	-e APP_VERSION=v1 \
	-e QUARK_TYPE=edge -n $NAMESPACE
