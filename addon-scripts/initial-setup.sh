#!/bin/sh

PROJECTPATH=$HOME/projects/os-config
ALIASFUNCTION="if [ -f ~/.alias ]; then . ~/.alias; fi"

#------------------------------------------------------------------------------------
#add supporting function file
. $HOME/projects/os-config/addon-scripts/helper.sh

#define colorset to use for screen output.
colorset
#------------------------------------------------------------------------------------

initial-setup()
{

#export DEBIAN_FRONTEND=noninteractive

strcolor g "running system update"
echo

runupdate

echo
echo "following packages are necessary for minimal openbox installation. Packages are listed in " \
"the" $PROJECTPATH/setup-files/packages.txt \
"please review before proceeding further"

echo
displaylist $PROJECTPATH/setup-files/packages.txt
echo

if [[ "no" == $(ask_yes_or_no "Are you sure?") ]]
then
    echo "Skipped."
    exit 0
fi

pkgcheck $PROJECTPATH/setup-files/packages.txt

#------------------------------------------------------------------------------------
# alias check and setup

echo
if cat $HOME/.bashrc | grep -Fxq "$ALIASFUNCTION"
then
	strcolor g  "alias setup already available. existing.."
else
	strcolor y  "alias setup not found. setting up.."
cat >>  $HOME/.bashrc << EOL
if [ -f ~/.alias ]; then . ~/.alias; fi
EOL
	cp $PROJECTPATH/setup-files/.alias $HOME
	source $HOME/.bashrc
        strcolor g  "alias setup complete."
fi


}

#------------------------------------------------------------------------------------

#export PATH="$PATH:~/projects/scripts"
