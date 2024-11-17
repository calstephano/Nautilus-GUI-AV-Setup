#!/bin/bash
BASE_PATH=~/persistent

# Install Miniconda
sudo mkdir -p $BASE_PATH/miniconda3
sudo wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $BASE_PATH/miniconda3/miniconda.sh
sudo bash $BASE_PATH/miniconda3/miniconda.sh -b -u -p $BASE_PATH/miniconda3
sudo rm -rf $BASE_PATH/miniconda3/miniconda.sh

$BASE_PATH/miniconda3/bin/conda init bash
$BASE_PATH/miniconda3/bin/conda init zsh

# Activate conda
source ~/.bashrc
source ~/.zshrc

# Create conda environment for VISTA
$BASE_PATH/miniconda3/bin/conda create -n vista python=3.8 -y

# Activate the vista conda environment
source $BASE_PATH/miniconda3/bin/activate vista

# Install Python dependencies
pip install opencv-python 
pip install ffio 
pip install shapely==1.8.5
pip install descartes
pip install pyrender 
pip install matplotlib 
pip install torch torchvision torchaudio 
pip install pickle5 
pip install h5py

# Install Vista
pip install vista
python -c "import vista"

# Finished!
echo "------------------------------------------------------------"
echo "Installation complete! Please close and re-open your console"
echo "Remember to activate your conda vista environment using 'conda activate vista' every time you reopen a new console tab"
