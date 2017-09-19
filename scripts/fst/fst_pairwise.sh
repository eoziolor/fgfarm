#!/bin/bash -l

#SBATCH -J pfst
#SBATCH --array=1-21
#SBATCH -o pfst-%A-%a.output
#SBATCH -e pfst-%A-%a.output
#SBATCH -N 1
#SBATCH --cpus-per-task=8
#SBATCH -t 48:00:00
#SBATCH --mem=60000


pops=BB\ VB\ PB\ SJ\ BNP\ GB\ SP
outdir=/home/eoziolor/fgran/data/fst
popfile=/home/eoziolor/fgran/data/list/pop_samples
my_wcfst=/home/eoziolor/program/vcflib/bin/wcFst
my_pfst=/home/eoziolor/program/vcflib/bin/pFst
my_vcf=/home/eoziolor/fgran/data/varcall/filtered_fgfh.vcf.bgz
my_bgzip=/home/eoziolor/program/htslib/bgzip


pair=$(for i in {1..6}
do
	ii=$(expr $i + 1)
	for j in $(seq $ii 7)
	do echo $pops | cut -f $i,$j -d ' '
done
done | \
sed -n "$(echo $SLURM_ARRAY_TASK_ID)p")

echo $SLURM_ARRAY_TASK_ID

pop1=$(echo $pair | cut -f 1 -d ' ')
pop2=$(echo $pair | cut -f 2 -d ' ')

echo $pop1 $pop2

target=$(grep -n $pop1 $popfile | cut -f 1 -d ":" | awk '{s=$1-1}{print s}' | tr '\n' ',' | \
sed 's/,$//')

background=$(grep -n $pop2 $popfile | cut -f 1 -d ":" | awk '{s=$1-1}{print s}' | tr '\n' ',' | \
sed 's/,$//')

outfile1=$pop1.$pop2.wcfst.bgz
outfile2=$pop1.$pop2.pfst.bgz

out1=$outdir/$outfile1
out2=$outdir/$outfile2

echo $out1
echo $out2

echo $target
echo $background
echo $outfile1
echo $outfile2

$my_wcfst \
--target $target \
--background $background \
--file $my_vcf \
--type GL | \
$my_bgzip>$out1

$my_pfst \
--target $target \
--background $background \
--file $my_vcf \
--type GL | \
$my_bgzip>$out2
