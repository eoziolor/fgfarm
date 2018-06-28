#!/bin/bash -l

#SBATCH -J c10vcf
#SBATCH -o c10vcf-%j.output
#SBATCH -e c10vcf-%j.output
#SBATCH -N 1
#SBATCH --cpus-per-task=8
#SBATCH -t 2:00:00
#SBATCH --mem=30000

#files
dir=/home/eoziolor/fgran/data/varcall


cat \
<(zcat $dir/head.vcf.gz) \
<(zcat $dir/chr10_filtered.vcf.bgz | grep -v "^#" | sort -k 2,2n) |\
bgzip > $dir/chr10_ordered_filtered.vcf.bgz
