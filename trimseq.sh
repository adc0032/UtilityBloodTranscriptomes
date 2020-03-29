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
#PBS -N TrimSeq
##combine standard out and standard error
#PBS -j oe
# ----------------Load Modules-------------------- #
module load trimmomatic/0.37
#-----------------Define variables------------#
WD="/scratch/adc0032/UtilityBloodTranscriptomes"
SD="/scratch/adc0032/UtilityBloodTranscriptomes/trimmed"
Datdir="/scratch/adc0032/UtilityBloodTranscriptomes/SRRs"
#-----------------Set Environment------------#
#  Set the stack size to unlimited
ulimit -s unlimited

# Turn echo on so all commands are echoed in the output log
set -x
# ----------------Commands------------------- #

##File Wrangle and loop to trim.
cd $WD
mkdir $SD

for file in $(ls $Datdir/*_1.fastq.gz);do
basename $file|cut -d "_" -f 1 >> zlist
done


while read SRR;do
org=`grep "${SRR}" SRA_Sample.txt | awk '{print $1}'`
left="$Datdir/${SRR}_1.fastq.gz"
right="$Datdir/${SRR}_2.fastq.gz"

java -jar /tools/trimmomatic-0.36/trimmomatic-0.36.jar PE -threads 10 -phred33 $left $right \
       -baseout ${org}_trim.fq.gz  ILLUMINACLIP:/tools/trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:25:33 MINLEN:90

mv ${org}_trim* $SD
done < zlist

