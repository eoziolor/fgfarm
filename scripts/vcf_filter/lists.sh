#!/bin/bash -l

#SBATCH -J poplist
#SBATCH -o poplist-%j.output
#SBATCH -e poplist-%j.output
#SBATCH -N 1
#SBATCH --cpus-per-task=8
#SBATCH -t 48:00:00
#SBATCH --mem=60000

#files and programs
my_vcf=/home/eoziolor/fgran/data/varcall/chr10_filtered.vcf.bgz
dir=/home/eoziolor/fgran/data/varcall/pops/

pops=VB\ SP\ ER\ KC\ BP\ F\ BB\ PB

for i in {1..8}
	do theone=$(echo $pops | cut -f $i -d ' ')
	zcat $my_vcf | grep -v "##" | head -n 1 | tr '\t' '\n' | grep $theone > $dir/$theone.txt
done
