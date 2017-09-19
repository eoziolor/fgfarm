#!/bin/bash

#SBATCH -J runAdmix7
#SBATCH -o runAdmix7-%j.output
#SBATCH -e runAdmix7-%j.output
#SBATCH -t 48:00:00
#SBATCH -N 1
#SBATCH -c 16
#SBATCH -D /home/eoziolor/fgran/data/admixture/allscaf/

#programs
admix=/home/eoziolor/program/admixture/admixture
all_scaf=/home/eoziolor/fgran/data/admixture/allscaf/all_scaf.bed
out=/home/eoziolor/fgran/data/admixture/allscaf

$admix --cv -j16 $all_scaf 7 | tee $out/log7.out
