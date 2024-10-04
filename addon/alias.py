# Load the content of the uploaded files to process the aliases
aliases_file_1 = "/mnt/e/config/cauhinh/aliases.zsh"
aliases_file_2 = "/mnt/e/.boybh/.aliases"

# Read both files
with open(aliases_file_1, "r") as file1, open(aliases_file_2, "r") as file2:
    aliases_content_1 = file1.readlines()
    aliases_content_2 = file2.readlines()

# Convert to sets to remove duplicates and ignore case sensitivity
aliases_set_1 = set(map(str.strip, aliases_content_1))
aliases_set_2 = set(map(str.strip, aliases_content_2))

# Combine both sets and remove duplicates
combined_aliases = sorted(aliases_set_1.union(aliases_set_2))

# Output the result as a combined aliases file
output_file = "/mnt/e/BACKUP/aliases.zsh"
with open(output_file, "w") as out_file:
    for alias in combined_aliases:
        out_file.write(f"{alias}\n")

output_file

