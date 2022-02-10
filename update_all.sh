#!/bin/bash

git pull --recurse-submodules
git submodule update --init --recursive
conda env update -f environment.yml
conda activate metu-bb
bash ./install
