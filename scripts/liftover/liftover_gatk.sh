#!/bin/bash -l

#SBATCH -J liftover-gatk
#SBATCH -o liftover-gatk-%j.output
#SBATCH -e liftover-gatk-%j.output
#SBATCH -t 04:00:00
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=60000

module load java

#programs and files
my_gatk='java -Xmx50g -jar /home/eoziolor/program/GenomeAnalysisTK.jar'
my_vcf=/home/eoziolor/fgran/data/varcall/filtered_fgfh.vcf.bgz
jeff_chain=/home/jmiller1/bin/code/ALLMAPS_OUT/unsplit_merge.chain
jeff_dict=/home/jmiller1/bin/code/ALLMAPS_OUT/unsplit_merge.dict
out_vcf=/home/eoziolor/fgran/data/varcall/chrom_fgfh.vcf
jeff_ref=/home/jmiller1/bin/code/ALLMAPS_OUT/unsplit_merge.fasta
my_out=/home/eoziolor/fgran/data/varcall/chrom_reject.vcf

$my_gatk -T LiftoverVariants \
-V $my_vcf \
-o $out_vcf \
-chain $jeff_chain \
-dict $jeff_dict \
-R $jeff_ref
