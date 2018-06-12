#!/bin/bash -l

#SBATCH -J chr1sub
#SBATCH -o chr1sub-%A-%a.output
#SBATCH -e chr1sub-%A-%a.output
#SBATCH -N 1
#SBATCH --cpus-per-task=8
#SBATCH -t 24:00:00
#SBATCH --mem=60000

list=/home/eoziolor/fgran/data/varcall/chr1scaf
my_out=/home/eoziolor/fgran/data/varcall/lengths
joint_vcf=/home/eoziolor/fgran/data/varcall/hetgrand.hap.vcf.gz
head=/home/eoziolor/fgran/data/varcall/head.vcf

zcat $joint_vcf | head -n 100000 | grep "#" > $head

for i in {1..73}
  do scaf=$(sed -n "$(echo $i)p" $list)
  cat $head | grep $scaf | perl -lne 'print $1 if /length=\s*(.*)>/' >> $my_out
done

