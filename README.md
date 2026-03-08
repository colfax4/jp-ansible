# Ansible repository for Jordan Park Network endpoints

## Ensure make is installed
```
sudo apt update
sudo apt install build-essential
```

## Install uv
```
curl -LsSf https://astral.sh/uv/install.sh | sh`
```

## Create venv
```
uv venv --python 3.12 .venv
```

## Enter Virtual Environment
```
source .venv/bin/activate
```

## Install Packages
```
uv sync
```

## Bootstrap
```
make bootstrap
```
This command will leverage an existing user you have on the remote (with sudo privileges) to install the ansible user.
You must separately configure ssh public key authentication with your existing user prior to executing `make bootstrap`.

## Configuration
```
make config
```
This command will reconfigure settings on the remote to make things easier for users.
NOTE:  The remote MUST have X11 configured for graphical environment and NOT Wayland.

## Install Software
```
make software
```
This command will install maintenance, monitoring, and user software on the remote. 

