#!/bin/bash -l

#SBATCH -J chr10sub
#SBATCH -o chr10sub-%A-%a.output
#SBATCH -e chr10sub-%A-%a.output
#SBATCH -N 1
#SBATCH --cpus-per-task=8
#SBATCH -t 24:00:00
#SBATCH --mem=60000

/home/eoziolor/program/vcflib/bin/vcfallelicprimitives \
/home/eoziolor/fgran/data/varcall/chr10.vcf.bgz |\
bgzip > /home/eoziolor/fgran/data/varcall/chr10_biallelic.vcf.bgz

