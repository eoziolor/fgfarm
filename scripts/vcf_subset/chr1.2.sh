#!/bin/bash -l

#SBATCH -J chr1sub
#SBATCH -o chr1sub-%A-%a.output
#SBATCH -e chr1sub-%A-%a.output
#SBATCH -N 1
#SBATCH --cpus-per-task=8
#SBATCH -t 24:00:00
#SBATCH --mem=60000

/home/eoziolor/program/vcflib/bin/vcfallelicprimitives \
/home/eoziolor/fgran/data/varcall/chr1.vcf.bgz |\
bgzip > /home/eoziolor/fgran/data/varcall/chr1_biallelic.vcf.bgz

