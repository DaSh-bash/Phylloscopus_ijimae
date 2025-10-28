#!/bin/bash
#SBATCH -A naiss2023-5-278
#SBATCH -p core
#SBATCH -n 16  # Number of cores
#SBATCH -t 48:00:00  # Job run time
#SBATCH --mem=80G  # Allocate memory
#SBATCH --mail-user=daria.shipilina@gmail.com
#SBATCH --mail-type=ALL  # Email notifications for all events
#SBATCH -J GenotypeGVCF_reg02  # Job name
#SBATCH -e GenotypeGVCF_reg02_%j.err  # Standard error file, %j will be replaced with job ID
#SBATCH -o GenotypeGVCF_reg02_%j.out  # Standard output file, %j will be replaced with job ID

module load bioinfo-tools GATK/4.3.0.0

# GATK command for variant calling
gatk --java-options "-Xmx72g" GenotypeGVCFs \
     --variant gendb:///crex/proj/uppstore2019097/popgen/gvcf/DBI_by_regionsD/region02db \
     -all-sites \
     --output ../Pijimae.region02.allsitesNew.vcf.gz \
     --reference /crex/proj/uppstore2019097/popgen/PhylloscopusRefGenome_copyD/GCA_025389015.1_LUNI_Pthr_2_genomic.fna.gz \
     --intervals VHQE01000001.1:1-55738393
