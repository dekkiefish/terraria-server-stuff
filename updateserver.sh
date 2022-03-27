#!/bin/bash

# i do not condone the use of this for anyone except myself

echo "welcome to my jank ass update tool made entirely for my own use"
echo "you are now updating to version $1"

temp_dir=$(mktemp -d) # goes into temp directory and gets source
cd $temp_dir

wget https://terraria.org/api/download/pc-dedicated-server/terraria-server-$1.zip 
unzip terraria-server-$1.zip
cd ./$1/Linux

rm System* ; rm Mono* ; rm monoconfig ; rm mscorlib.dll ; rm Terraria.png
mkdir ~/terrariaserver
mv ./* ~/terrariaserver/ # picks out the cool bits and moves them to /home/user/terrariaserver
cd ~/terrariaserver
touch version.txt
echo "this has been update via declan script to version $1" > version.txt

chmod +rwx * -R
chown pi:pi * -R # you will have to change this to the name of your user if you want to use this

rm -R ${temp_dir} # end
echo "update done!!!!!!!!!"


# if you are getting errors you probably didn't put in the paramters right
# you need to add the version number (make sure it's a valid one on the relogic website)
# and it has to be without any dots (i.e. ver 1436 for 1.4.3.6)
# note, apparently downloads after 1.4.3.6 do not have the lib folder, will phase out later (or never)

