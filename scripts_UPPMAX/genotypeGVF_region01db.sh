#!/bin/bash
# SLURM script to run GATK GenotypeGVCFs for genomic variant calling
#SBATCH -A naiss2023-5-278  
#SBATCH -p core -n 12  
#SBATCH -t 24:00:00  # Set runtime to 4 hours
#SBATCH --mail-user=daria.shipilina@gmail.com # Email notifications
#SBATCH -J GenotypeGVCF_reg01  # Job name
#SBATCH --mail-type=ALL
#SBATCH -J GenotypeGVCF_reg01_%A_%a.err  # Standard error file
#SBATCH -o GenotypeGVCF_reg01_%A_%a.out  # Standard output file

module load bioinfo-tools GATK/4.3.0.0

# GATK command for variant calling
gatk --java-options "-Xmx72g" GenotypeGVCFs \
--variant gendb:///crex/proj/uppstore2019097/popgen/gvcf/DBI_by_regionsD/region01db \
-all-sites \
--output ../Pijimae.region01.allsites.vcf.gz \
--reference /crex/proj/uppstore2019097/popgen/PhylloscopusRefGenome_copyD/GCA_025389015.1_LUNI_Pthr_2_genomic.fna.gz \
--intervals VHQE01000408.1:1-66951093
