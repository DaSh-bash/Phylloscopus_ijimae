#!/bin/bash
#SBATCH -A naiss2023-5-278
#SBATCH -p core
#SBATCH -n 16  # Number of cores
#SBATCH -t 24:00:00  # Job run time
#SBATCH --mem=80G
#SBATCH --mail-user=daria.shipilina@gmail.com --mail-type=all
#SBATCH -J regionArray
#SBATCH -e regionArray_%A_%a.err
#SBATCH -o regionArray_%A_%a.out
#SBATCH --array=2-4

module load bioinfo-tools
module load GATK/4.3.0.0
export OMP_NUM_THREADS=14

# Read line number ${SLURM_ARRAY_TASK_ID} from array_iterate_region.list
CONTIG=$(sed -n "${SLURM_ARRAY_TASK_ID}p" array_iterate_region.list | cut -d' ' -f2)

# GATK command for variant calling
gatk --java-options "-Xmx72g" GenotypeGVCFs \
     --variant gendb:///crex/proj/uppstore2019097/popgen/gvcf/DBI_by_regionsD/region0${SLURM_ARRAY_TASK_ID}db \
     -all-sites \
     --output ../Pijimae.region{SLURM_ARRAY_TASK_ID}.allsitesNew.vcf.gz \
     --reference /crex/proj/uppstore2019097/popgen/PhylloscopusRefGenome_copyD/GCA_025389015.1_LUNI_Pthr_2_genomic.fna.gz \
      --tmp-dir /proj/uppstore2017185/b2014034/nobackup/Dasha/\
