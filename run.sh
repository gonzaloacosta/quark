sudo podman stop front back

sudo podman rm front back

sudo podman run -d -p 5000:5000 -e APP_NAME=front \
        -e APP_VERSION=v1 \
        -e APP_TYPE=passthrough \
        -e APP_DESTINATION=http://localhost:5001/back \
        -e POD_NAME=front \
        -e POD_NAMESPACE=myfront \
	--name front quark:latest

sudo podman run -d -p 5001:5001 -e APP_NAME=back \
        -e APP_VERSION=v1 \
        -e APP_TYPE=edge \
        -e POD_NAME=back \
        -e POD_NAMESPACE=myback \
	--name back quark:latest

sleep 5

curl http://localhost:5000/front
