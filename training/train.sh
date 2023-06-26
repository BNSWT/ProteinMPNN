#!/bin/bash
#SBATCH -p gpu
#SBATCH --mem=32g
#SBATCH --gres=gpu:rtx2080:1
#SBATCH -c 3
#SBATCH --output=example_3_model_w_test.out

# source activate mlfold

output_dir="../outputs/training"
if [ ! -d $output_dir ]
then
    mkdir -p $output_dir
fi

chains_to_design="A"


python training.py \
        --path_for_training_data "/zhouyuyang/data/pdb_2021aug02_sample" \
        --path_for_outputs "/zhouyuyang/project/ProteinMPNN/outputs/training" \
        --previous_checkpoint "/zhouyuyang/project/ProteinMPNN/training/exp_020/model_weights/epoch_last.pt"
