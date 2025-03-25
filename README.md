# meg_docker


## setting up the ubuntu container:

### Don't forget to update entrypoint.sh with a current action runner token before you build the image!
### be sure to label the runner correctly

```sh
docker build -t ubuntu_image -f Dockerfile.ubuntu .
docker run -it --name ubuntu_container ubuntu_image bash
```

## setting up the debian container:

### Don't forget to update entrypoint.sh with a current action runner token before you build the image!
### be sure to label the runner correctly

```sh
docker build -t debian_image -f Dockerfile.debian .
docker run -it --name debian_container debian_image bash
```
