#!/bin/bash
#Grab the motif and genome files from the week2_assignment folder and add to current directory
motif_file="/home/rbif/week2_assignment/interesting_motifs.txt"
cp "$motif_file" .
bacteria_file="/home/rbif/week2_assignment/r_bifella.fasta"
cp "$bacteria_file" .

#For testing purposes , it will empty the motif.txt file. Should not effect the general  code when running
>motif_count.txt

#Create the directory for the output files
mkdir motifs

#Read the motifs from the file
motifs=($(cat interesting_motifs.txt))

#Loop through each motif and count the number of occurences
for motif in "${motifs[@]}"; do
   # Count the number of occurrences of the motif in the genome file
  count=$(grep -c "$motif" r_bifella.fasta)
   # Output the count to the motif_count.txt file
  echo "$motif: $count" >> motif_count.txt
   # Create a FASTA file for the motif
  grep -B1 "$motif" r_bifella.fasta | grep -v "^--$" > motifs/"$motif".txt
done

#Print the motif_count in the terminal per assignment instructions
cat motif_count.txt
