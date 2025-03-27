# meg_docker

## set up the actions-runner folders to be attached as volume to the containers

### Install the required dependencies locally
```sh
sudo apt install libssl-dev libicu-dev libcurl4-openssl-dev libkrb5-dev zlib1g-dev
```

### Install the Ubuntu actions runner directory
```sh
mkdir -p ./ubuntu_ar
sudo chmod -R 777 ./ubuntu_ar 
cd ./ubuntu_ar
curl -O -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz
tar xzf actions-runner-linux-x64-2.323.0.tar.gz
```

### Install the Debian actions runner directory
```sh
mkdir -p ./debian_ar
sudo chmod -R 777 ./debian_ar 
cd ./debian_ar
curl -O -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz
tar xzf actions-runner-linux-x64-2.323.0.tar.gz
```

## setting up the ubuntu container:

### Don't forget to update entrypoint.sh with a current action runner token before you build the image!
### Be sure to label the runner "ubuntu-runner"

```sh
docker pull ubuntu:latest
docker build -t ubuntu_image -f Dockerfile.ubuntu .
docker compose up
```

## setting up the debian container:

### Don't forget to update entrypoint.sh with a current action runner token before you build the image!
### Be sure to label the runner "debian-runner"

```sh
docker build -t debian_image -f Dockerfile.debian .
docker run -it --name debian_container debian_image bash
```
