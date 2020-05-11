#!/bin/bash

function daemonize_dbus() {
	echo -n starting  dbus-daemon...
	dbus-daemon --system --fork --print-address && echo success || echo failed
	# dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address
}

function daemonize_sshd() {
	/sbin/sshd
}

function debug_sshd() {
	/sbin/sshd -d
}

function foreground_sshd() {
	/sbin/sshd -D
}


#daemonize_dbus
foreground_sshd
