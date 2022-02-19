#!/bin/bash
# System Volume
function vol() {
  pactl -- set-sink-volume 0 "$1"%
}
# Daemonize
function dae() {
    daemonize $(which $1)
}
# Generate authentication keys for SSH.
function gen-ssh-keygen-ed25519() {
  ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/keys/$1 -C "$2"
}
function gen-ssh-keygen-rsa() {
  ssh-keygen -t rsa -o -a 100 -b 4096 -f ~/.ssh/keys/$1 -C "$2"
}
# Convert ps files to pdf files
function pdf() {
  enscript "$1" -p "$2.ps"
  ps2pdf "$2.ps" "$2.pdf"
  rm "$2.ps"
}
#Add Aliases
# function add-alias() {
#   if()
# }
