# webbox
An OCI container that serves firefox over ssh-X11 and pulseaudio

# Description
This project builds an OCI (Docker, podman, or other container tech) image that contains Firefox.  Firefox is accessed over SSH, so no volumes are shared between host and container.  Audio is streamed via pulseaudio.

# Installation
## Host Prerequisites
  * `docker` or `podman`
  * SSH client that supports X11 forwarding
  * `pulseaudio` server with TCP support
  * TCP port `2022` must be available and unused
  
  Most of this comes standard on any desktop/workstation linux installation.
  
### Installing podman or docker
  RHEL/CentOS 8: `sudo dnf -y install podman`
  
  RHEL/CentOS 7: `sudo yum -y install docker`
  
  Debian derivatives `sudo apt -y install docker`

## Build process
  With podman: `make`
  
  With docker:
  ```
  export DOCKER=docker
  export DOCKER_BUILD=docker build
  make
  ```

# Execution
1. open two windows in this repo's top-level directory (TLD)
2. Type `make launch` in window 1
3. type ./ffox.sh in window 2
4. when done, hit `ctrl-c` in window 1

# Uninstall
`make uninstall`
