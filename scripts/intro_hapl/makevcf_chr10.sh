#!/bin/bash -l

#SBATCH -J c10vcf
#SBATCH -o c10vcf-%j.output
#SBATCH -e c10vcf-%j.output
#SBATCH -N 1
#SBATCH --cpus-per-task=8
#SBATCH -t 1:00:00
#SBATCH --mem=60000

