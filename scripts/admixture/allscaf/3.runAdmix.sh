#!/bin/bash

#SBATCH -J runAdmix
#SBATCH -o runAdmix-%j.output
#SBATCH -e runAdmix-%j.output
#SBATCH -t 48:00:00
#SBATCH -N 1
#SBATCH -c 16
#SBATCH -D /home/eoziolor/fgran/data/admixture/allscaf/

#programs
admix=/home/eoziolor/program/admixture/admixture
all_scaf=/home/eoziolor/fgran/data/admixture/allscaf/all_scaf.bed
out=/home/eoziolor/fgran/data/admixture/allscaf

for k in {1..7};
	do $admix --cv -j16 $all_scaf $k | tee $out/log${k}.out; done
