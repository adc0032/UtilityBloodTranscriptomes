
# README 
### Amanda D. Clark
### Auburn University
### Tonia Schwartz Lab
##Created: 3/29/20##
##Updated: 	      ##


# Utility of Blood Transcriptomes Directory

### Background
Waits (2019) 'The utility of reptile blood transcriptomes in molecular ecology' demonstrating the usefulness of transcriptomic data. 
I am assembling mitochondrial genomes from the data submitted on NCBI project SRP135786. I am using MitoZ as a preliminary mode of mitogenome assembly. 

### Scripts
usage `sh runall.sh`

This ran 3 scripts `getseq.sh` `trimseq.sh` `mitozseq.sh` to produce mitogenome sequences info 
`Species.result/summary.txt` and visualization `Species.result/Species.circos.png`. 
The three individual scripts need to be edited for new users where indicated, so please review the scripts.

*User needs one tab-delimited list with species name and the corresponding SRR number (e.g. Pcat    SRR#####) in a file named `SRA_Sample.txt`*

This line downloaded the SRR data associated with Pituophis catenifer in the project referenced above, putting fastq files into directory `SRR`. 

*User will need to update paths to data and to sra folder.*

The second script took the fastq files and trims them based on 100bp read sizes. Files were renamed with species identifier and placed into directory `trimmed` 

*User will need to update paths to reflect user environment*
 
The third script used the trimmed fastq sequences and runs them through the fast mode of MitoZ.
[MitoZ](https://github.com/linzhi2013/MitoZ/tree/master/version_2.4-alpha) will need to be downloaded and set up. (I ran a conda installation)

*User will need to update information on reads and MitoZ run preferences*


