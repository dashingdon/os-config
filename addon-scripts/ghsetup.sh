#!/bin/sh
PROJECTPATH=$HOME/projects/os-config
DIR=$HOME/.ssh

#------------------------------------------------------------------------------------
#add supporting function file
. $HOME/projects/os-config/addon-scripts/helper.sh

#define colorset to use for screen output.
colorset
#------------------------------------------------------------------------------------

ghsetup()
{
	checkIfDirectory $DIR
	read -p "Enter your email address associated with github for ssh keygen: " email
	cd $DIR
	pwd
	ssh-keygen -t rsa -b 4096 -c $email
}
