#!/bin/bash
 
# Job name
#SBATCH --job-name=upp-bjr
 
# choose the GPU queue
#SBATCH --partition=roma
#SBATCH --account=atlas:usatlas 

# requesting one node
#SBATCH --nodes=1
#SBATCH --exclusive
 
# keep environment variables
#SBATCH --export=ALL

# No GPUs needed
#SBATCH --gpus=0
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=bbullard@slac.stanford.edu
#SBATCH --output=/sdf/home/b/bbullard/bjer/datasets/umami-preprocessing/upp/sbatch_out/slurm-%j.%x.out
#SBATCH --error=/sdf/home/b/bbullard/bjer/datasets/umami-preprocessing/upp/sbatch_out/slurm-%j.%x.err
 
# move to workdir
cd /sdf/home/b/bbullard/bjer/datasets/umami-preprocessing/upp
echo "Moved dir, now in: ${PWD}"
 
# activate environment
source /sdf/group/atlas/sw/conda/etc/profile.d/conda.sh
#setup_conda
conda activate upp
echo "Activated environment ${CONDA_DEFAULT_ENV}"

# run the training
echo "Running training script..."
srun preprocess --config configs/bjr/bjr_PHYSVAL_ttbar.yaml --split all
#srun preprocess --config configs/bjr/bjr_PHYSVAL_ttbar_resampled.yaml --split val
#srun preprocess --config configs/bjr/bjr_PHYSVAL_ttbar_resampled.yaml --split test
