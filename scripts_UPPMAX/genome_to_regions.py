# Read the genome index file
genome_index = "/crex/proj/uppstore2019097/popgen/PhylloscopusRefGenomeNew/ncbi_dataset/data/GCA_025389015.1/GCA_025389015.1.LUNI_Pthr_2_genomic.fna.fai"  # Update with your file path
contigs = []
total_length = 0

with open(genome_index, 'r') as file:
    for line in file:
        parts = line.strip().split()  # Split the line into parts
        contig_name = parts[0]
        contig_length = int(parts[1])
        contigs.append((contig_name, contig_length))
        total_length += contig_length

print('Total genome length including all contigs:', total_length)

# Sort contigs by length in descending order
contigs_sorted = sorted(contigs, key=lambda x: x[1], reverse=True)

# Exclude the 10 largest contigs for further processing but include in total length
contigs_to_use = contigs_sorted[10:]

# Calculate target interval length based on the total genome length
target_interval_length = total_length // 15

# Initialize variables for creating intervals
current_interval_length = 0
interval_contig_ids = []

# Output file setup
output_file_path = "contigs_output.txt"  # Update with your desired file path

with open(output_file_path, 'w') as output_file:
    # Write the 10 largest contigs
    for contig_name, contig_length in contigs_sorted[:10]:
        output_file.write(f"-L {contig_name}:1-{contig_length}\n")
    
    # Process and write the combined smaller contigs
    for contig_name, contig_length in contigs_to_use:
        if current_interval_length + contig_length > target_interval_length and current_interval_length != 0:
            # Finish the current line for the current interval
            output_file.write("\n")
            # Reset for the next interval
            current_interval_length = contig_length
            output_file.write(f"-L {contig_name}:1-{contig_length}")
        else:
            # Continuation of the current interval
            if current_interval_length != 0:  # Not the first entry
                output_file.write(f" -L {contig_name}:1-{contig_length}")
            else:  # The first entry of an interval
                output_file.write(f"-L {contig_name}:1-{contig_length}")
            current_interval_length += contig_length

# Make sure to update the paths and filenames as necessary for your environment and needs.

