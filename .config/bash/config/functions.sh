#!/bin/bash

# System Volume
function vol() {
	pactl -- set-sink-volume "$1" "$2"%
}
function pyc() {
	python3.9 -c "print($1)"
}
# Daemonize
function dae() {
	daemonize "$(which "$1")"
}
# Generate authentication keys for SSH.
function gen-ssh-keygen-ed25519() {
	ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/keys/"$1" -C "$2"
}
function gen-ssh-keygen-rsa() {
	ssh-keygen -t rsa -o -a 100 -b 4096 -f ~/.ssh/keys/"$1" -C "$2"
}
