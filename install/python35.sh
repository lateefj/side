#!/bin/bash

mkdir $HOME/local
cd $HOME/local

wget https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tgz 
cd Python-3.5.1/
./configure --prefix=$HOME/local
make
make install

