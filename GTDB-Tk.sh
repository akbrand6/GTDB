#!/bin/bash
#SBATCH --job-name=GTDBTk
#SBATCH --mail-type=END,FAIL
#SBATCH --nodes=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=120G
#SBATCH --time=80:00:00
#SBATCH --error ./GTDBTk.e%j
#SBATCH --output ./GTDBTk.o%j

module load anaconda3/2023.03-1
source activate /mount/britton/kyle/conda_envs/GTDB-TK_env

### Define absolute path to batch file
batch_path="/mount/britton/kyle/test/2024-04-01-GTDB-Tk/batch-file.tsv"
### Define output file location.
output_dir="/mount/britton/kyle/test/2024-04-01-GTDB-Tk/results2"


gtdbtk classify_wf --batchfile $batch_path --out_dir $output_dir --cpus 4 --pplacer_cpus 4

