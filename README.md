# Initial setup

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
... then configure the runner:

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

... then configure the runner:

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

... then configure the runner:

```sh
./config.sh # Configure with specific runner token
./run.sh # Start the runner
```

## Build the Ubuntu container
```sh
docker pull ubuntu:latest
docker build -t ubuntu_image -f Dockerfile.ubuntu .
docker compose up -d
```
## Build the Debian container
```sh
docker pull debian:latest
docker build -t debian_image -f Dockerfile.debian .
docker compose up -d
```
## Build the Arch container
```sh
docker build -t arch_image -f Dockerfile.arch .
docker compose up -d
```

# Ensure containers are up (after poweroff,etc)
```sh
make all-up
```

# If you want to rebuild the containers:
```sh
make rebuild
```

# Check docker processes running in background
```sh
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
```

# Monitoring tools:
- Open Grafana in your browser: http://localhost:3000
- Default login: admin / admin
- Check that prmetheus is working: http://localhost:9090
