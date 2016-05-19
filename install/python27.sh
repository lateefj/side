#!/bin/bash

mkdir $HOME/local
cd $HOME/local

wget https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz 
cd Python-2.7.11/
./configure --prefix=$HOME/local
make
make install

