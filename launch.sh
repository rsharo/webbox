#!/bin/bash


function load_pa_tcp() {
		echo loading pulseaudio native tcp module
		pacmd load-module module-native-protocol-tcp
}

function unload_pa_tcp() {
		echo unloading pulseaudio native tcp module
		pacmd unload-module module-native-protocol-tcp
}


pacmd list-modules | grep -q module-native-protocol-tcp
pulse_preconfig=$?

if [[ "$pulse_preconfig" -ne 0 ]] ; then
	load_pa_tcp
	trap unload_pa_tcp EXIT
fi

podman run -ti --rm --shm-size=2g -p 2022:22 --name webbox webbox

