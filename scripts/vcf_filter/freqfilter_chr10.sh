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
my_varcall=/home/eoziolor/fgran/data/varcall/chr10_filtered_060218.vcf.bgz
outdir=/home/eoziolor/fgran/data/varcall
pops=VB\ SP\ ER\ KC\ F\ BP
listdir=/home/eoziolor/fgran/data/varcall/pops

for i in {1..6}

do theone=$(echo $pops | cut -f $i -d ' ')

theonefile=$listdir/$theone.txt

outfile=chr10_freqs_060218.$theone

$my_vcftools --gzvcf $my_varcall \
--keep $theonefile \
--freq \
--out $outdir/$outfile

done
