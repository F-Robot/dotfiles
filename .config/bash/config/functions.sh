#!/bin/bash
# System Volume
function vol() {
	pactl -- set-sink-volume "$1" "$2"%
}
function op() {
	echo $(("$1"))
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
# Convert ps files to pdf files
function pdf() {
	enscript "$1" -p "$2.ps"
	ps2pdf "$2.ps" "$2.pdf"
	rm "$2.ps"
}
# Firebase Deploy
function firebase-deploy() {
	# Menu
	echo "Select a deploy:"
	echo "1. Deploy to Master"
	echo "2. Deploy to Prueba"
	echo "3. List deploys"
	echo "4. Exit"
	echo -n "Enter a option [1-4]:"

	# Infinite Loop while select a correct choice
	while :; do
		read -r choice
		# Case statement options
		case $choice in
		1)
			echo "Deploying to master"
			firebase deploy
			;;
		2)
			echo "Deploying to prueba"
			firebase hosting:channel:deploy prueba
			;;
		3)
			echo "List deploys"
			firebase hosting:channel:list
			;;
		4)
			echo "Quitting ..."
			exit
			;;
		*) echo "Invalid Option, try again ..." ;;
		esac
		echo -n "Enter a option [1-4]:"
	done
}
