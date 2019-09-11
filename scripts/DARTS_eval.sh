#!/bin/bash
#
# submit to the right queue
#SBATCH -p 1080Ti
#SBATCH --gres gpu:1
#SBATCH -a 1-3
#SBATCH -J DARTS_grid_eval
#
# the execution will use the current directory for execution (important for relative paths)
#SBATCH -D .
#
# redirect the output/error to some files
#SBATCH -o ./logs_eval/%A_%a.o
#SBATCH -e ./logs_eval/%A_%a.e
#

source activate pytorch-0.3.1-cu8-py36
python src/evaluation/train.py --cutout --auxiliary --job_id $SLURM_ARRAY_JOB_ID --task_id 1 --seed 1 --space $1 --dataset $2 --search_dp $3 --search_wd $4 --search_task_id $SLURM_ARRAY_TASK_ID

