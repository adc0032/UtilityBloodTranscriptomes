#!/bin/sh

##Change to working directory if on Hopper##
cd /scratch/adc0032/UtilityBloodTranscriptomes

FIRST=$(qsub getseq.sh)
echo $FIRST
SECOND=$(qsub -W depend=afterany:$FIRST trimseq.sh)
echo $SECOND
THIRD=$(qsub -W depend=afterany:$SECOND mitozseq.sh)
echo $THIRD
