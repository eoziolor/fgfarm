#!/bin/bash -l

#SBATCH -J admix_full
#SBATCH -o admix_full-%j.output
#SBATCH -e admix_full-%j.output
#SBATCH -t 24:00:00
#SBATCH -N 1
#SBATCH -n 1

#programs and files
my_plink=/home/eoziolor/program/plink/plink
my_vcf=/home/eoziolor/fgran/data/varcall/filtered_fgfh.vcf.bgz
my_tabix=/home/eoziolor/program/htslib/tabix
my_out=/home/eoziolor/fgran/data/admixture/allscaf/all_scaf
my_remove=/home/eoziolor/fgran/admixture/plink_remove.txt

srun $my_plink \
-vcf $my_vcf \
--allow-extra-chr \
--make-bed \
-out $my_out
