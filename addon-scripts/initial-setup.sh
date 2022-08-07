#!/bin/sh

PROJECTPATH=$HOME/projects/os-config

#------------------------------------------------------------------------------------
#add supporting function file
. $HOME/projects/os-config/addon-scripts/helper.sh

#define colorset to use for screen output.
colorset
#------------------------------------------------------------------------------------

initial-setup()
{
echo
echo "following packages are necessary for minimal openbox installation. Packages are listed in " \
"the" $PROJECTPATH/setup-files/packages.txt \
"please review before proceeding further"

echo
displaylist "$PROJECTPATH"/setup-files/packages.txt
echo

#if [[ "no" == $(ask_yes_or_no "Are you sure?") || \
#      "no" == $(ask_yes_or_no "Are you *really* sure?") ]]

if [[ "no" == $(ask_yes_or_no "Are you sure?") ]]
then
    echo "Skipped."
    exit 0
fi

pkgcheck "$PROJECTPATH"/setup-files/packages.txt


}

#------------------------------------------------------------------------------------
