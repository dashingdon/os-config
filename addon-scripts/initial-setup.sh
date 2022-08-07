#!/bin/sh

PROJECTPATH=$HOME/projects/os-config
ALIASFUNCTION="
	# for custom alias setup
	if [ -f ~/.alias ]; then
	   . ~/.alias
	fi
"

#------------------------------------------------------------------------------------
#add supporting function file
. $HOME/projects/os-config/addon-scripts/helper.sh

#define colorset to use for screen output.
colorset
#------------------------------------------------------------------------------------

initial-setup()
{

echo running system update

runupdate()

echo
echo "following packages are necessary for minimal openbox installation. Packages are listed in " \
"the" $PROJECTPATH/setup-files/packages.txt \
"please review before proceeding further"

echo
displaylist "$PROJECTPATH"/setup-files/packages.txt
echo

if [[ "no" == $(ask_yes_or_no "Are you sure?") ]]
then
    echo "Skipped."
    exit 0
fi

pkgcheck "$PROJECTPATH"/setup-files/packages.txt

#------------------------------------------------------------------------------------
# alias check and setup

echo
if grep -Fxq "$ALIASFUNCTION" "$PROJECTPATH"/setup-files/test.txt
then
	strcolor g  "alias setup already available. existing.."
else
	strcolor y  "alias setup not found. setting up.."
# Done	strcolor p "//TODO with replace test.txt with $HOME/.bashrc TODO//"
cat >> "$HOME"/.bashrc << EOL
	# for custom alias setup
	if [ -f ~/.alias ]; then
	   . ~/.alias
	fi
EOL
# Done	strcolor p  "// TODO replace test.txt with $PROJECTPATH/setup-files/.alias to $HOME/.alias TODO//"
	cp "$PROJECTPATH"/setup-files/.alias "$HOME"
# Done  strcolor p "//TODO source and replace test.txt with $HOME/.bashrc TODO//"
	source "$HOME/.bashrc"
        strcolor g  "alias setup complete."
fi


}

#------------------------------------------------------------------------------------

#export PATH="$PATH:~/projects/scripts"
