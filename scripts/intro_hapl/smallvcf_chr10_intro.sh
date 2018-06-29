#!/bin/bash -l

#SBATCH -J freqfilter
#SBATCH -o freqfilter-%j.output
#SBATCH -e freqfilter-%j.output
#SBATCH -N 1
#SBATCH --cpus-per-task=8
#SBATCH -t 24:00:00
#SBATCH --mem=30000

#files and programs
my_vcftools=/home/eoziolor/program/vcftools/bin/vcftools
my_varcall=/home/eoziolor/fgran/data/introgression/chr10_intr.vcf.bgz
outdir=/home/eoziolor/fgran/data/introgression
list=/home/eoziolor/fgran/data/varcall/pops/R1-3.S2.txt

outfile=chr10_small.vcf.bgz

$my_vcftools --gzvcf $my_varcall \
--keep $list \
--recode \
--stdout |\
bgzip >  $outdir/$outfile
