## Workflow:

## 1. update everything: sudo apt update...
## 2. install mamba: non interactively, and get conda init working
## 3. activate base mamba, create km (numba(main), matplotlib, scikit, networkx, matplotlib, pandas, ...), activate km automatically next time
## 4. improve script later

## Implementation:

echo "## 1. update everything: sudo apt update..."

sudo apt update
sudo apt upgrade -y

echo "## 2. install mamba: non interactively, and get conda init working"

## Next time, check for curl/wget and use the one thats available

## This will download the appropriate installer for the present architecture with the filename Miniforge3.sh. Run the shell script with the command in batch mode with the -b flash:
wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"

## -p is prefix option. A directory wil be createrd on "${HOME}/conda".
bash Miniforge3.sh -b -p "${HOME}/conda"

## Then you should create the path to conda and activate conda. Run this command:
source "${HOME}/conda/etc/profile.d/conda.sh"

## For mamba support also run the following command
source "${HOME}/conda/etc/profile.d/mamba.sh"

## Finally, you can run the command to activate the base environment
conda activate

## Setting mamba env to activate on start
mamba init
conda config --set auto_activate_base true

## Resourcing the .bashrc to apply the changes
source ~/.bashrc

echo "## 3. activate base mamba, create km (numba(main), matplotlib, scikit, networkx, matplotlib, pandas, ...), activate km automatically next time"

## Activating mamba in case it wasnt done previously
mamba activate

## Creating km with defaulting to numba
mamba create -y -n km numba

## Activating km and installing more packages. 
mamba activate km
mamba install -y numpy scipy matplotlib jupyterlab networkx igraph pandas ## This should cover most of my use cases, will update if needed
pip install nolds --quiet ## https://nolds.readthedocs.io/en/latest/index.html

## Activate km automatically next time logging in
echo "## Activating mamba on login shell automatically" >> ~/.bashrc
echo "mamba activate km" >> ~/.bashrc

## Resourcing the .bashrc to apply the changes
source ~/.bashrc


