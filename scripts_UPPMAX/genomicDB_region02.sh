#!/bin/bash
#SBATCH -A naiss2023-5-278
#SBATCH -p core -n 8
#SBATCH -t 06:00:00
#SBATCH --mail-user=daria.shipilina@gmail.com --mail-type=all
#SBATCH -J region02db
#SBATCH -e region02db_%j.err
#SBATCH -o region02db_%j.out

module load bioinfo-tools
module load GATK/4.3.0.0
export OMP_NUM_THREADS=8

gatk --java-options "-Xmx80g" GenomicsDBImport \
-V /crex/proj/uppstore2019097/popgen/gvcf/PijimaeNa-U5147_TD-2518-S52_L002.g.vcf.gz \
-V /crex/proj/uppstore2019097/popgen/gvcf/PijimaeNa-U5148_TD-2518-S53_L002.g.vcf.gz \
-V /crex/proj/uppstore2019097/popgen/gvcf/PijimaeNa-U5149_TD-2518-S54_L002.g.vcf.gz \
-V /crex/proj/uppstore2019097/popgen/gvcf2/PijimaeNa-U5150_TD-2518-S55_L002.g.vcf.gz \
-V /crex/proj/uppstore2019097/popgen/gvcf2/PijimaeNa-U5151_TD-2518-S56_L002.g.vcf.gz \
-V /crex/proj/uppstore2019097/popgen/gvcf/PijimaeNa-U5152_TD-2518-S57_L002.g.vcf.gz \
-V /crex/proj/uppstore2019097/popgen/gvcf/PijimaeNa-U5153_TD-2518-S58_L002.g.vcf.gz \
-V /crex/proj/uppstore2019097/popgen/gvcf/PijimaeNa-U5154_TD-2518-S59_L002.g.vcf.gz \
--variant /crex/proj/uppstore2019097/popgen/gvcf/PijimaeMi-U5645_TD-2518-S50_L002.g.vcf.gz \
--variant /crex/proj/uppstore2019097/popgen/gvcf2/PijimaeMi-U5649_TD-2518-S51_L002.g.vcf.gz \
--variant /crex/proj/uppstore2019097/popgen/gvcf/PijimaeMi-U5708_TK-2766-S130_L004.g.vcf.gz \
--variant /crex/proj/uppstore2019097/popgen/gvcf/PijimaeMi-U5709_TK-2766-S50_L002.g.vcf.gz \
--variant /crex/proj/uppstore2019097/popgen/gvcf/PijimaeMi-U5710_TK-2766-S62_L002.g.vcf.gz \
--variant /crex/proj/uppstore2019097/popgen/gvcf/PijimaeMi-U5711_TK-2766-S63_L002.g.vcf.gz \
--genomicsdb-workspace-path region02db \
-L VHQE01000425.1 
