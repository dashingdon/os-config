#!/bin/bash

PROJECTPATH=$HOME/projects/os-config

#------------------------------------------------------------------------------------
#add supporting function file
. $HOME/projects/os-config/addon-scripts/helper.sh
. $HOME/projects/os-config/addon-scripts/initial-setup.sh

#define colorset to use for screen output.
colorset
#------------------------------------------------------------------------------------

echo
echo
strcolor y "Select the operation ************"
strcolor y "  1) first time setup"
strcolor y "  2) configure github for private repos"
strcolor y "  3) operation 3"
strcolor y "  4) operation 4" 
echo

read n
echo
case $n in
  1) strcolor g "You chose first time setup"
	initial-setup 
	echo
	;;
  2) echo "You chose Option 2";;
  3) echo "You chose Option 3";;
  4) echo "You chose Option 4";;
  *) echo "invalid option";;
esac

#------------------------------------------------------------------------------------

# create required directories
#echo "Creating directories"
#echo $(CREATE-DIR)



#clone git repos

