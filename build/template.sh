#!/bin/bash
VERSION="ncdu-version"
bs_workspace="folder"

cd $bs_workspace
wget https://dev.yorhel.nl/download/ncdu-${VERSION}.tar.gz
tar xvf ncdu-${VERSION}.tar.gz

cd ncdu-${VERSION}

./configure
make

strip *.exe
./ncdu --version
cat ncdu.1 | groff -mandoc -Thtml >ncdu.html

tar cvzf ../${bs_workspace}.tar.gz ncdu.exe ncdu.html