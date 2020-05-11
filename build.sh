#!/bin/bash

ssh-keygen -t ecdsa -N '' -f context/id_webbox
buildah bud -t webbox context/
cp context/id_webbox* ~/.ssh/
