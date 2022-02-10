#!/bin/bash

git pull --recurse-submodules
git submodule update --init --recursive
conda activate metu-bb
bash ./install
