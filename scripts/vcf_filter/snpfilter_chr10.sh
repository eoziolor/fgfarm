#!/bin/bash -l

#SBATCH -J filter
#SBATCH -o filter-%j.output
#SBATCH -e filter-%j.output
#SBATCH -N 1
#SBATCH --cpus-per-task=8
#SBATCH -t 48:00:00
#SBATCH --mem=60000

#files and programs
my_vcftools=/home/eoziolor/program/vcftools/bin/vcftools


my_varcall=/home/eoziolor/fgran/data/varcall/chr10_biallelic.vcf.bgz
outdir=/home/eoziolor/fgran/data/varcall
outfile=chr10_filtered.vcf.bgz

$my_vcftools --gzvcf $my_varcall \
--minQ 100 \
--min-alleles 2 \
--max-alleles 2 \
--remove-filtered-all \
--recode \
--stdout |\
bgzip > $outdir/$outfile
