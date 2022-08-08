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
	ssh-keygen -t rsa -b 4096 -C "$email"
	mv id_rsa id_rsa_github
	mv id_rsa.pub id_rsa_github.pub 
	echo "copy public key id_rsa_github.pub to github keys --> https://github.com/settings/keys"
	echo "displaying id_rsa_github.pub"
	echo "--------------------------------------------------------------------------------------"
	echo
	cat id_rsa_github.pub
	echo
        echo "--------------------------------------------------------------------------------------"
	echo
	ssh-add $HOME/.ssh/id_rsa_github
	echo
	if [[ "no" == $(ask_yes_or_no "Please enter yes after copying key to github") ]]
	then
    		echo "Skipped."
   		exit 0
	fi
	echo
	echo "testing setup"
	echo
	ssh -T git@github.com
	echo
	cp $PROJECTPATH/setup-files/.gitconfig $HOME
}
