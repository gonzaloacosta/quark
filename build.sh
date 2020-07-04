sudo podman build -t quark .
sudo podman tag localhost/quark quay.io/gonzaloacosta/quark
sudo podman push quay.io/gonzaloacosta/quark
