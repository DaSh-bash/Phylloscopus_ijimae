#!/bin/bash
#SBATCH -A naiss2023-5-278
#SBATCH -p core -n 1
#SBATCH -t 04:00:00
#SBATCH --mail-user=daria.shipilina@gmail.com --mail-type=all
#SBATCH -J coverageArray
#SBATCH -e coverageArray_%A_%a.err
#SBATCH -o coverageArray_%A_%a.out
#SBATCH --array=1-12

module load bioinfo-tools
module load mosdepth

# Read line number ${SLURM_ARRAY_TASK_ID} from bam.list
CONTIG=$(sed -n "${SLURM_ARRAY_TASK_ID}p" bam.list | cut -d' ' -f2)

mosdepth --threads 1 --fasta /crex/proj/uppstore2019097/popgen/PhylloscopusRefGenomeNew_copyD/GCA_025389015.1_LUNI_Pthr_2_genomic.fna\
        -n --fast-mode --by 500 $CONTIG $CONTIG
