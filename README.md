# meg_docker

## Install the required dependencies locally
```sh
sudo apt install libssl-dev libicu-dev libcurl4-openssl-dev libkrb5-dev zlib1g-dev
```

## Install the Ubuntu actions runner directory
```sh
mkdir -p ./ubuntu_ar
sudo chmod -R 777 ./ubuntu_ar 
cd ./ubuntu_ar
curl -O -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz
tar xzf actions-runner-linux-x64-2.323.0.tar.gz
```
... then configure the runner

```sh
./config.sh # Configure with specific runner token
./run.sh # Start the runner
```

## Install the Debian actions runner directory
```sh
mkdir -p ./debian_ar
sudo chmod -R 777 ./debian_ar 
cd ./debian_ar
curl -O -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz
tar xzf actions-runner-linux-x64-2.323.0.tar.gz
```

... then configure the runner

```sh
./config.sh # Configure with specific runner token
./run.sh # Start the runner
```

## Install the Arch actions runner directory
```sh
mkdir -p ./arch_ar
sudo chmod -R 777 ./arch_ar 
cd ./arch_ar
curl -O -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz
tar xzf actions-runner-linux-x64-2.323.0.tar.gz
```

... then configure the runner

```sh
./config.sh # Configure with specific runner token
./run.sh # Start the runner
```

# Set up Docker containers

## Ubuntu container setup
```sh
docker pull ubuntu:latest
docker build -t ubuntu_image -f Dockerfile.ubuntu .
docker compose up -d
```
## Debian container setup
```sh
docker pull debian:latest
docker build -t debian_image -f Dockerfile.debian .
docker compose up -d
```
## Arch container setup
```sh
docker build -t arch_image -f Dockerfile.arch .
docker compose up -d
```

# Re-starting actions runner

You have to reset the permission with 

```
sudo chmod -R 777 ./ubuntu_ar 
```
