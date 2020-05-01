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
#PBS -N MitoZSeq-Recover
##combine standard out and standard error
#PBS -j oe
# ----------------Load Modules-------------------- #
source activate mitozEnv
module load python/3.5.2
#-----------------Define variables------------#
WD="/scratch/adc0032/UtilityBloodTranscriptomes"
Datdir="/scratch/adc0032/UtilityBloodTranscriptomes/MitoZ/"
SD="/scratch/adc0032/UtilityBloodTranscriptomes/MitoZ"
#-----------------Set Environment------------#
#  Set the stack size to unlimited
ulimit -s unlimited

# Turn echo on so all commands are echoed in the output log
set -x
# ----------------Commands------------------- #

cd $WD

if [[ -d $SD ]]; then
echo "Saving Directory exisits $SD"
else
mkdir $SD
fi

##Running MitoZ
##will need to update MitoZ path if not adc0032; Runs MitoZ in full for Chordates; will need to update seq info
#This version of the script was specifically used to try and recover PCGs that were not found in quick mode. requires extra files, created during quick mode run.
#Have not worked out how to loop this, since each one needs different information as far as genes on contigs and missing PCGs

org="Emul"
left="$Datdir/${org}.tmp/${org}.cleandata/clean.1.fq.gz"
right="$Datdir/${org}.tmp/${org}.cleandata/clean.2.fq.gz"

python3 /home/adc0032/MitoZ/version_2.4-alpha/release_MitoZ_v2.4-alpha/MitoZ.py all2 --genetic_code 2 --clade Chordata --outprefix ${org}  \
--thread_number 20 --fastq1 ${left} --fastq2 ${right} \
--fastq_read_length 100 --insert_size 350 --filter_taxa_method 1 --requiring_taxa 'Chordata' \
--run_mode 3 \
--quick_mode_seq_file ${WD}/Results/${org}.result/work71.mitogenome.fa \
--quick_mode_fa_genes_file ${WD}/Results/${org}.result/quick_mode_fa_genes.txt  \
--missing_PCGs ND4 ND4L ND1 ND2 \
--quick_mode_score_file ${WD}/Results/${org}.result/work71.hmmtblout.besthit.sim.filtered.high_abundance_10.0X.reformat.sorted.Not-picked \
--quick_mode_prior_seq_file ${WD}/Results/${org}.result/work71.hmmtblout.besthit.sim.filtered.low_abundance.fasta



