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



#echo
#echo "following packages are necessary for minimal openbox installation. Packages are listed in " \
#"the" $PROJECTPATH/setup-files/packages.txt \
#"please review before proceeding further"

#echo
#displaylist "$PROJECTPATH"/setup-files/packages.txt
#echo

##if [[ "no" == $(ask_yes_or_no "Are you sure?") || \
##      "no" == $(ask_yes_or_no "Are you *really* sure?") ]]

#if [[ "no" == $(ask_yes_or_no "Are you sure?") ]]
#then
#    echo "Skipped."
#    exit 0
#fi

#pkgcheck "$PROJECTPATH"/setup-files/packages.txt

#------------------------------------------------------------------------------------


: ' comment block of code
echo "select the operation ************"
echo "  1)operation 1"
echo "  2)operation 2"
echo "  3)operation 3"
echo "  4)operation 4" 

read n
case $n in
  1) echo "You chose Option 1";;
  2) echo "You chose Option 2";;
  3) echo "You chose Option 3";;
  4) echo "You chose Option 4";;
  *) echo "invalid option";;
esac
'

# create required directories
#echo "Creating directories"
#echo $(CREATE-DIR)



#clone git repos

: '
strcolor g "Installing additional packages ..."
echo
pkgcheck ~/scripts/packs.txt
echo
'

