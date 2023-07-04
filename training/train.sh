#!/bin/bash
#SBATCH -p gpu
#SBATCH --mem=32g
#SBATCH --gres=gpu:rtx2080:1
#SBATCH -c 3
#SBATCH --output=example_3_model_w_test.out

/zhouyuyang/env/miniconda3/bin/conda init
/zhouyuyang/env/miniconda3/bin/conda activate mlfold

output_dir="../outputs/training"
if [ ! -d $output_dir ]
then
    mkdir -p $output_dir
fi

chains_to_design="A"

cd /zhouyuyang/project/ProteinMPNN/training
python training.py \
        --path_for_training_data "/zhouyuyang/data/pdb_2021aug02" \
        --path_for_outputs "/zhouyuyang/project/ProteinMPNN/outputs/experiment" \
        --previous_checkpoint "/zhouyuyang/project/ProteinMPNN/training/exp_020/model_weights/epoch_last.pt"
