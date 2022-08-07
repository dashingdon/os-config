#!/bin/sh
. $HOME/projects/os-config/addon-scripts/functions.sh

cd $HOME

CREATE-DIR="downloads scripts"

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
echo "Creating directories"
mkdir $(CREATE-DIR)



#clone git repos

