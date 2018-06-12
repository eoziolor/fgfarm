#!/bin/bash -l

#SBATCH -J chr1sub
#SBATCH -o chr1sub-%A-%a.output
#SBATCH -e chr1sub-%A-%a.output
#SBATCH -N 1
#SBATCH --cpus-per-task=8
#SBATCH -t 24:00:00
#SBATCH --mem=60000
list=/home/eoziolor/fgran/data/varcall/chr1_list
joint_vcf=/home/eoziolor/fgran/data/varcall/hetgrand.hap.vcf.gz
my_out=/home/eoziolor/fgran/data/varcall/chr1.vcf.gz

xargs -a $list -I {} tabix -fh $joint_vcf {} | bgzip > $my_out
