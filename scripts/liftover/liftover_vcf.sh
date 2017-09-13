#!/bin/bash -l

#SBATCH -J liftover
#SBATCH -o liftover-%j.output
#SBATCH -e liftover-%j.output
#SBATCH -t 04:00:00
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=60000

module load java

#programs and files
my_picard='java -jar /home/eoziolor/program/picard.jar'
my_vcf=/home/eoziolor/fgran/data/varcall/filtered_fgfh.vcf.bgz
jeff_chain=/home/jmiller1/bin/code/ALLMAPS_OUT/unsplit_merge.chain
jeff_dict=/home/jmiller1/bin/code/ALLMAPS_OUT/unsplit_merge.dict
out_vcf=/home/eoziolor/fgran/data/varcall/chrom_fgfh.vcf
jeff_ref=/home/jmiller1/bin/code/ALLMAPS_OUT/unsplit_merge.fasta
my_reject=/home/eoziolor/fgran/data/varcall/chrom_reject.vcf

echo about to run srun $my_picard LiftoverVcf \
R=$jeff_ref \
I=$my_vcf \
C=$jeff_chain \
REJECT=$my_reject \
O=$out_vcf

$my_picard LiftoverVcf \
R=$jeff_ref \
I=$my_vcf \
C=$jeff_chain \
REJECT=$my_reject \
O=$out_vcf

