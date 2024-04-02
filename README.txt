Author: Andrew Kyle Brand Ardis
Date: 4/2/2024

Purpose: This is a description of what this program is, and how to use it. Written for dummies.

*** Overview ***

GTDB is a dabase, with an associated tool kit GTDB-Tk. The toolkit can be used to quickly and easily assign taxonomy to assembled genomes. 



*** Reference Websites and Githubs ***

1. https://forum.gtdb.ecogenomic.org/

2. https://github.com/Ecogenomics/GTDBTk/blob/master/README.md

3. https://ecogenomics.github.io/GTDBTk/

// this one is for an installation issue. ignore if you're not installing:
https://github.com/Ecogenomics/GTDBTk/issues/459


*** Use ***

step 1. cp the script from this test file to where youare using it with
`cp /mount/britton/kyle/test/2024-04-01-GTDB-Tk/code/GTDB-Tk.sh /PATH/TO/WHERE/YOU/WANT/`

step 2. create a batch file.  (go to reference website 3, under commands, classify_wf you can find what a batchfile is supposed to be.)

step 3. create an ouput directory

step 4. update your newly copied script to reflect the location of `batch_path` and `output_dir`.  

step 5. Once batch_path and output_dir are updated, submit the job with 
`sbatch GTDB-Tk.sh`

you should receive an email when it's completed.  to follow the progress you can check the output file, it updates live.




*** Results ***

the main result file will be gtdbktk.bac120.summary.tsv. Some of the columns are obvious, others not as much, below is a brief description of each:
If you don't want to read it all, the ones you probably want to know are classification and `fastani_af`.


    user_genome: This column contains the names you assigned for the sample in the batchfile
    classification: This column contains the taxonomic classification assigned to each user genome by GTDB-Tk. It typically includes the kingdom, phylum, class, order, family, genus, and species of the organism, based on the GTDB taxonomy.
    fastani_reference: The identifier or name of the reference genome used in the FastANI (Fast Average Nucleotide Identity) analysis.
    fastani_reference_radius: The genomic radius around the FastANI reference genome within which to search for closely related genomes.
    fastani_taxonomy: Taxonomic classification of the FastANI reference genome.
    fastani_ani: The Average Nucleotide Identity (ANI) calculated between the user genome and the FastANI reference genome.
    fastani_af: The alignment fraction (AF) calculated between the user genome and the FastANI reference genome. This represents the proportion of the user genome that aligns with the reference genome.
    closest_placement_reference: The identifier or name of the reference genome used in the closest placement analysis.
    closest_placement_radius: The genomic radius around the closest placement reference genome within which to search for closely related genomes.
    closest_placement_taxonomy: Taxonomic classification of the closest placement reference genome.
    closest_placement_ani: The Average Nucleotide Identity (ANI) calculated between the user genome and the closest placement reference genome.
    closest_placement_af: The alignment fraction (AF) calculated between the user genome and the closest placement reference genome.
    pplacer_taxonomy: Taxonomic classification assigned to the user genome using the pplacer tool.
    classification_method: The method used to assign taxonomic classification to the user genome.
    note: Any additional notes or comments related to the classification process or results.
    other_related_references: Additional references or genomes that are related to the user genome, typically including their identifiers, species names, radii, ANI, and AF.
    msa_percent: Percentage of multi-sequence alignment (MSA) coverage between the user genome and the reference genome.
    translation_table: The translation table used for translating DNA sequences into protein sequences.

	notes about FastANI and fastani_reference
	FastANI (Fast Average Nucleotide Identity) is a method used for calculating the average nucleotide identity between two genomic sequences. 
	In the context of GTDB-Tk, the fastani_reference_radius parameter defines the genomic radius around the reference genome within which GTDB-Tk searches for closely related genomes to compare against the user genome.
	The fastani_reference_radius parameter defines the scope of the genomic search space around the reference genome in the FastANI analysis, impacting the breadth and depth of genomic comparisons performed by GTDB-Tk. 