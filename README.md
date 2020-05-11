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
  
  On CentOS 8 or Fedora, you can install podman via: `sudo dnf -y install podman`

## Build process
`make`


# Execution
1. open two windows in this repo's top-level directory (TLD)
2. Type `make launch` in window 1
3. type ./ffox.sh in window 2
4. when done, hit `ctrl-c` in window 1

# Uninstall
`make uninstall`
