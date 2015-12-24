#!/bin/bash

git stash
git pull
./scripts/feeds update -a
./scripts/feeds install -a
#read -n1 -p "Press any key to update custom packages..."

#update custom packages
cd ./package
for x in aachinadns aashadowsocks aaopenwrtluci
  do
  cd ./$x
  git pull
  cd ..     
done
cd .. 
#read -n1 -p "Press any key to continue..."

git stash pop

./scripts/feeds update -a
./scripts/feeds install -a

make defconfig

echo "Make clean? Please answer yes or no."
read YES_OR_NO
case "$YES_OR_NO" in
	yes|y|Yes|YES)
		make clean
		make V=99 -j 5
	;;
	
	[nN]*)
		echo "DO NOT make clean!"
		make V=99 -j 5
	;;

	*)
		echo "Sorry, $YES_OR_NO not recognized. Enter yes or no."
		exit 1
	;;
esac




