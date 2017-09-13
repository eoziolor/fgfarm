#!/bin/bam -l

#SBATCH -J cleanbin
#SBATCH -o cleanbin-%j.output
#SBATCH -e cleanbin-%j.output
#SBATCH -t 02:00:00
#SBATCH -N 1
#SBATCH -n 1

#files

start_bim=/home/eoziolor/fgran/data/admixture/allscaf/all_scaf.bim
end_bim=/home/eoziolor/fgran/data/admixture/allscaf/all_scaf2.bim

srun cat $start_bim | awk '{gsub("NW_","");print}' > $end_bim
