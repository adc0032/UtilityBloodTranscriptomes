
# README 
### Amanda D. Clark
#### Auburn University - Tonia Schwartz Lab
#### Created: 3/29/20
#### Updated: 	      


# Utility of Blood Transcriptomes Directory

### Background
Waits (2019) *The utility of reptile blood transcriptomes in molecular ecology* discussing the usefulness of transcriptomic data. 
I am assembling mitochondrial genomes from the data submitted on NCBI project **SRP135786**. 

I am using `MitoZ` (Meng 2019) as a preliminary mode of mitogenome assembly. 

This will be followed by processing via methods from Forni (2019) *Complete mitochondrial genomes from transcriptomes: assessing pros and cons of data mining for assembling new mitogenomes*. Output from MitoZ gives closely relates species to use as a reference for Forni's [mitoRNA](https://github.com/mozoo/mitoRNA) wrapper. 

### Scripts
usage `sh runall.sh`

This ran 3 scripts to produce mitogenome sequences and visualization info found in `Species.result/summary.txt` & `Species.result/Species.circos.png`. These scripts were written for Auburn's HPC Hopper.

| Scripts |
| ------- |
| `getseq.sh` |
| `trimseq.sh` |
| `mitozseq.sh` |

**The three scripts need to be edited for new users where indicated, so please review the scripts before `sh runall.sh`.**

*User needs one tab-delimited list with species name and the corresponding SRR number in a file named `SRA_Sample.txt`*
(e.g. SRA_Sample.txt, NO HEADER-written here for clarity)

| Species | SRR |
| ------- | --- |
| Pcat | SRR6841718 |   
| Tele | SRR6841717 |
| Socc | SRR6841721 |
| Cpit | SRR6841722 |
| Ccon | SRR6841720 |
| Emul | SRR6841719 |

This provides information for downloading the SRR data associated with Pituophis catenifer and other listed species in the project referenced above, putting fastq files into directory `SRR`, trimming files (located in `trimmed`), and running MitoZ for mitogenome assembly found in `MitoZ/Species.results`. 

#### `getseq.sh`

*User will need to update paths to data and to sra folder.*

#### `trimseq.sh`
The second script took the fastq files and trims them based on 100bp read sizes. Files were renamed with species identifier and placed into directory `trimmed` 

*User will need to update paths to reflect user environment*

#### `mitozseq.sh`
The third script used the trimmed fastq sequences and runs them through the fast mode of MitoZ.
[MitoZ](https://github.com/linzhi2013/MitoZ/tree/master/version_2.4-alpha) will need to be downloaded and set up. (I ran a conda installation)

*User will need to update information on reads and MitoZ run preferences*


