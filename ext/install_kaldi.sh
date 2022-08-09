#!/bin/bash

# bdw: it looks like upstream has a particular checkout for the kaldi tree, so let's
# try to use it.  Dan's repo used 7ffc9ddeb3c8436e16aece88364462c89672a183 and the
# upstream switched to 498b25db122ec68a96aee154b9d829030adfae4c sometime in early
# 2022.
cd kaldi
git checkout 498b25db122ec68a96aee154b9d829030adfae4c
cd ..

# Prepare Kaldi
cd kaldi/tools
#make clean
make
./extras/install_openblas.sh
cd ../src
# make clean (sometimes helpful after upgrading upstream?)
./configure --static --static-math=yes --static-fst=yes --use-cuda=no --openblas-root=../tools/OpenBLAS/install
make depend
cd ../../
