#!/bin/bash

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
source $HOME/miniconda/bin/activate
conda create -y -n default python=3.13
conda activate default
conda install -y -c conda-forge fire ipykernel matplotlib numpy pandas
