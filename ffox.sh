#!/bin/bash

#
# Resolve script location to the DIR variable, following symlinks
SOURCE="${BASH_SOURCE[0]}"
while [[ -h "$SOURCE" ]]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"


cd "${DIR}/webbox-ssh-config"
exec ssh -F config webbox firefox
#exec ssh -X -p 2022 -i ../id_webbox guest@localhost firefox --no-remote
