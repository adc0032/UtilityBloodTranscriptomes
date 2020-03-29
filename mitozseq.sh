#! /bin/bash

# ----------------QSUB Parameters----------------- #
##choose queue
####PBS -q
##list - node are nodes: ppn are cpus per node: walltime=walltime
#PBS -l nodes=1:ppn=20,mem=100gb,walltime=08:00:00:00
##email
#PBS -M adc0032@auburn.edu
##send email abort; begin; end
#PBS -m ae
##job name
#PBS -N MitoZSeq
##combine standard out and standard error
#PBS -j oe
# ----------------Load Modules-------------------- #
source activate mitozEnv
module load python/3.5.2
#-----------------Define variables------------#
WD="/scratch/adc0032/UtilityBloodTranscriptomes"
Datdir="/scratch/adc0032/UtilityBloodTranscriptomes/trimmed"
SD="/scratch/adc0032/UtilityBloodTranscriptomes/MitoZ"
#-----------------Set Environment------------#
#  Set the stack size to unlimited
ulimit -s unlimited

# Turn echo on so all commands are echoed in the output log
set -x
# ----------------Commands------------------- #

cd $WD
mkdir $SD

##Running MitoZ
#will need to update MitoZ path if not adc0032; Runs MitoZ in full for Chordates; will need to update seq info

while read SRR; do
org=`grep "${SRR}" SRA_Sample.txt | awk '{print $1}'`
left="$Datdir/${org}_trim_1P.fq.gz"
right="$Datdir/${org}_trim_2P.fq.gz"

python3 /home/adc0032/MitoZ/version_2.4-alpha/release_MitoZ_v2.4-alpha/MitoZ.py all --genetic_code 2 --clade Chordata --outprefix ${org}  \
    --thread_number 20 \
    --fastq1 ${left} \
    --fastq2 ${right} \
    --fastq_read_length 100 \
    --insert_size 350  \
    --run_mode 2 \
    --filter_taxa_method 1 \
    --requiring_taxa 'Chordata'

mv ${org}.*/ $SD

sleep 15

done < zlist

rm zlist

