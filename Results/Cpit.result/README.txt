------------------------------------------------------------------------------------------
------------------------- summary information --------------------------------------------

- 1. The summary information for the whole analysis.
File:
summary.txt

- 2. You should check the following files to confirm if there are potential
annotation and assembly problems, e.g., a InternalStop for protein coding
genes can be caused by assemlby (e.g., there are Ns), annotation, mutation,
or the sequence simply comes from nuclear mitochondrial DNA segments (NUMTs).
You may inspect its sequencing depth from the visualization result files.
File:
Cpit.errorsummary.val
Cpit_mitoscaf.fa.val

------------------------------------------------------------------------------------------
------------------------- mitochondrial genome files -------------------------------------

- 3. The mitochondrial genome in GenBank format.
File:
Cpit_mitoscaf.fa.gbf

- 4. The mitochondrial genome in Fasta format.
File:
Cpit.fasta

- 5. The visualization of the mitochondrial genome.
File:
Cpit.circos.svg
Cpit.circos.png

- 6. The sequencing depth of each site of the mitochondrial genome,
and the sequence id relationships.
File:
Cpit.circos.dep
Cpit.circos.karyotype.txt

- 7. The mitochondrial genome in sqn format.
This file can be used to upload to GenBank database after you confirm
the file Cpit_mitoscaf.fa.gbf has no annotation problem.
File:
Cpit_mitoscaf.fa.sqn

- 8. The feature table for the mitochondrial genome.
File:
Cpit_mitoscaf.fa.tbl

------------------------------------------------------------------------------------------
------------------------- each gene sequences --------------------------------------------

- 9. The CDS sequences of each protein coding gene.
File:
Cpit.cds

- 10. The rRNA gene sequences for each rRNA gene.
File:
Cpit.rrna

- 11. The tRNA gene sequences for each tRNA gene.
File:
Cpit.trna

- 12. The control region sequence.
File:
Cpit.misc_feature

------------------------------------------------------------------------------------------
------------------------- mitochondrial sequences from each kmer assembly ----------------

- 13. The mitochondrial sequences from each Kmer assembly.
File:
work71.mitogenome.fa
        
- 14. The most closely related species of each sequence of each Kmer assembly.
File:
work71.most_related_species.txt
        
------------------------------------------------------------------------------------------
----- potential contamination or nuclear mitochondrial DNA segments (NUMTs) (if any) -----

- 15. The fasta files of potential contamination or numts,
and their gene information (from HMMER search, which are just rough results).
File:
work71.hmmtblout.besthit.sim.filtered.high_abundance_10.0X.reformat.sorted.Not-picked
work71.hmmtblout.besthit.sim.filtered.high_abundance_10.0X.reformat.sorted.Not-picked.fa
work71.hmmtblout.besthit.sim.filtered.low_abundance
work71.hmmtblout.besthit.sim.filtered.low_abundance.fasta
        
------------------------------------- THE END -------------------------------------------

