#!/bin/bash -l

#SBATCH -J c10vcf
#SBATCH -o c10vcf-%j.output
#SBATCH -e c10vcf-%j.output
#SBATCH -N 1
#SBATCH --cpus-per-task=8
#SBATCH -t 1:00:00
#SBATCH --mem=60000

my_tabix=/home/eoziolor/program/htslib/tabix

my_vcf=/home/eoziolor/fgran/data/varcall/chr10_ordered_filtered.vcf.bgz
my_out=/home/eoziolor/fgran/data/introgression/chr10_intr.vcf.bgz

$my_tabix -fh $my_vcf chr10:0-1 | bgzip > $my_out
$my_tabix -f $my_vcf chr10:21507785-29010051 | bgzip >> $my_out
