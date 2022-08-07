#!/bin/sh

#echo "functions.sh"

# check user input
function ask_yes_or_no() 
{
    read -p "$1 ([y]es or [N]o): "
    case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
        y|yes) echo "yes" ;;
        *)     echo "no" ;;
    esac
}



# Set color variables
colorset ()
{
txtrst=$(tput sgr0) # Text reset
txtgrn=$(tput setaf 2) # Green
txtred=$(tput setaf 1) # Red
txtylw=$(tput setaf 3) # Yellow
txtblu=$(tput setaf 4) # Blue
txtpur=$(tput setaf 5) # Purple
txtcyn=$(tput setaf 6) # Cyan
txtwht=$(tput setaf 7) # White
}

#set color template
strcolor ()
{
case $1 in 
        g) echo $3 "${txtgrn}$2 ${txtrst}";;
        r) echo $3 "${txtred}$2 ${txtrst}";;
        y) echo $3 "${txtylw}$2 ${txtrst}";;
        b) echo $3 "${txtblu}$2 ${txtrst}";;
        p) echo $3 "${txtpur}$2 ${txtrst}";;
        c) echo $3 "${txtcyn}$2 ${txtrst}";;
        w) echo $3 "${txtwht}$2 ${txtrst}";;
esac
}

#check if package is installed
pkgcheck()
{
	FILE=$1

	grep -v '^#' < $FILE | while read line
	do
		if dpkg-query -Wf'${db:Status-abbrev}' $line 2>/dev/null | grep -q '^i' ; then
	        	strcolor g ""$line" is installed "
		else
	        	strcolor y ""$line" not found. Installing ..."
#		        sudo apt install -y $line
		fi
	done

}

displaylist()
{
	FILE=$1
	grep -v '^#' < $FILE | while read line
	do
           strcolor c ""$line" "
	done
}
