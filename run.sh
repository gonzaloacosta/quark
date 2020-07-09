sudo podman run -d -p 5000:5000 -e APP_NAME=quark \
        -e APP_VERSION=v1 \
        -e QUARK_TYPE=edge \
        -e QUARK_POD_NAME=quark \
        -e QUARK_POD_NAMESPACE=quark \
	--name quark quark:latest
	
