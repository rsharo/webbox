#!/bin/bash

cd webbox-ssh-config
exec ssh -X -p 2022 -i ./id_webbox guest@localhost firefox --no-remote

#exec ssh -F config webbox firefox
