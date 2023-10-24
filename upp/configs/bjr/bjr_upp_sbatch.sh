#!/bin/bash
 
# Job name
#SBATCH --job-name=upp-bjr
 
# choose the GPU queue
#SBATCH -p usatlas
 
# requesting one node
#SBATCH --nodes=1
#SBATCH --exclusive
 
# keep environment variables
#SBATCH --export=ALL

# No GPUs needed
#SBATCH --gpus=0
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=8G
#SBATCH --output=/sdf/home/b/bbullard/bjes/umami-preprocessing/upp/configs/sbatch_out/slurm-%j.%x.out
#SBATCH --error=/sdf/home/b/bbullard/bjes/umami-preprocessing/upp/configs/sbatch_out/slurm-%j.%x.err
 
# move to workdir
cd /sdf/home/b/bbullard/bjes/umami-preprocessing/upp
echo "Moved dir, now in: ${PWD}"
 
# activate environment
source /sdf/group/atlas/sw/conda/etc/profile.d/conda.sh
#setup_conda
conda activate upp
echo "Activated environment ${CONDA_DEFAULT_ENV}"

# run the training
echo "Running training script..."
srun preprocess --config configs/bjr/bjr_PHYSVAL_ttbar.yaml --split all