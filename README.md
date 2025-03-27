# meg_docker

## Create folds for the runners

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
### Configure the runner
```sh
./config.sh # Configure with specific runner token
./run.sh # Start the runner
```

### Install the Debian actions runner directory
```sh
mkdir -p ./debian_ar
sudo chmod -R 777 ./debian_ar 
cd ./debian_ar
curl -O -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz
tar xzf actions-runner-linux-x64-2.323.0.tar.gz
```

### Configure the runner
```sh
./config.sh # Configure with specific runner token
./run.sh # Start the runner
```

## Set up runners

```sh
docker pull ubuntu:latest
docker build -t ubuntu_image -f Dockerfile.ubuntu .
docker compose up
```

### Don't forget to update entrypoint.sh with a current action runner token before you build the image!
### Be sure to label the runner "debian-runner"

```sh
docker build -t debian_image -f Dockerfile.debian .
docker run -it --name debian_container debian_image bash
```
