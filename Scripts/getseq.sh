#! /bin/bash

# ----------------QSUB Parameters----------------- #
##choose queue
####PBS -q
##list - node are nodes: ppn are cpus per node: walltime=walltime
#PBS -l nodes=1:ppn=10,mem=50gb,walltime=05:00:00:00
##email
#PBS -M adc0032@auburn.edu
##send email abort; begin; end
#PBS -m ae
##job name
#PBS -N GetSeq
##combine standard out and standard error
#PBS -j oe
# ----------------Load Modules-------------------- #
module load sratoolkit/2.9.6
#-----------------Define variables------------#
#Where you want to carry out the work
WD="/scratch/adc0032/UtilityBloodTranscriptomes"
#File with list of desired SRR numbers
zSRRs="$WD/SRA_Sample.txt"
#Path to SRA folder, prefetching from NCBI usually creates this folder for you at /home/user/ncbi/public/sra; fill user
SRAs="/home/adc0032/ncbi/public/sra"
#-----------------Set Environment------------#
#  Set the stack size to unlimited
ulimit -s unlimited

# Turn echo on so all commands are echoed in the output log
set -x
# ----------------Commands------------------- #

cd $WD

for line in $(cat $zSRRs| awk '{print $2}')
do

if [[ -s $SRAs/$line.sra ]]; then
    echo "$line has been prefetched"
else
	prefetch -X 200G $line
	sleep 5
fi
done

mkdir SRRs

for line in $(cat $zSRRs| awk '{print $2}')
do

if [[ -s $SRAs/$line.sra ]]; then
    fastq-dump -I --split-files --gzip -O $WD/SRRs $SRAs/$line.sra
else
    echo "$SRAs/$line.sra is not here. Iterating..."
    prefetch -X 200G $line
    sleep 5
    fastq-dump -I --split-files --gzip -O $WD/SRRs $SRAs/$line.sra
fi
done
