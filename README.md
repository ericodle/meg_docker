# meg_docker

```sh
docker build -t ubuntu_image .
```

```sh
docker run -it --name ubuntu_container ubuntu_image bash
```

Don't forget to update entrypoint.sh with a current action runner token.