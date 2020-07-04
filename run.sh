sudo podman stop quark

sudo podman rm quark

sudo podman run -d -p 5000:5000 -e APP_NAME=quark \
        -e APP_VERSION=v1 \
        -e APP_TYPE=edge \
        -e POD_NAME=quark \
        -e POD_NAMESPACE=myns \
	--name quark quark:latest

sleep 5

curl http://localhost:5000/quark	
