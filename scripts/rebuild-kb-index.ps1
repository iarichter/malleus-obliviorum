# Define the path to your main directory
$docsPath = "./docs"
Get-Location

# Initialize an empty array to store results
$resultArray = @()

# Define the list of folder names to match with sections in kbindex.md
$sections = @("projects", "areas", "resources", "archive")
$excludedTags = @("noble-creature")

# Get all subdirectories within the "docs" directory (projects, areas, resources, archive)
$subfolders = Get-ChildItem -Path $docsPath -Directory | Where-Object { $sections -contains $_.name }

# Loop through each subfolder
foreach ($folder in $subfolders) {
    # Get all markdown files in the current subfolder
    $markdownFiles = Get-ChildItem -Path $folder.FullName -Filter "*.md"
    
    # Loop through each markdown file
    foreach ($file in $markdownFiles) {
        # Read the file content
        $content = Get-Content -Path $file.FullName
        
        # Initialize variables for title and filename
        $title = ""
        $filename = ""
        $tags = @()
        $tagBlock = ''

        # Loop through the lines to find 'title' and 'filename' metadata in YAML
        foreach ($line in $content) {
            if ($line -match "^title:\s*(.+)$") {
                $title = $matches[1].Trim()
            }
            elseif ($line -match "^filename:\s*(.+)$") {
                $filename = $matches[1].Trim()
            }
            # Check for the start of the tags block
            elseif ($line -match "^tags:\s*$") {
                $tagBlock = $true
            }
            # Collect lines with tags (four spaces, hyphen, space, and the tag value)
            elseif ($tagBlock -and $line -match "^\s{4}-\s+(.+)$") {
                $tags += $matches[1].Trim()
            }
            # Reset the tag block if the line no longer matches the tag format
            elseif ($tagBlock -and $line -notmatch "^\s{4}-\s+(.+)$") {
                $tagBlock = $false
            }

            # Break out of the loop if title and filename are found (optional for optimization)
            if ($title -ne "" -and $filename -ne "" -and $tagBlock -eq $false) {
                # Remove the tags.Count condition if tags can be optional
                break
            }
        }

        # Construct the folder/file path
        $path = "$($folder.Name)/$filename"

        # Add the title and path to the result array as a hashtable
        $resultArray += [pscustomobject]@{
            Title = $title
            Path  = $path
            Name  = $file.name
            Tags  = $tags
        }
    }
}

# Output the result array (you can format it as needed or export it)
$resultArray


# Path to the kbindex.md file
$kbIndexPath = "$docsPath\kbindex.md"

# Read kbindex.md into an array of lines
$kbIndexContent = Get-Content -Path $kbIndexPath

# Dictionary to store array entries grouped by folder name
$groupedEntries = @{}

# Group entries by folder name in the result array
foreach ($entry in $resultArray) {
    $folderName = ($entry.Path -split "/")[0]
    if (-not $groupedEntries.ContainsKey($folderName)) {
        $groupedEntries[$folderName] = @()
    }
    $groupedEntries[$folderName] += $entry | Where-Object {-not ($_.Tags | Where-Object { $excludedTags -contains $_ })}
}

# Initialize an array to store the updated content of kbindex.md
$updatedContent = @()

# Loop through each line of kbindex.md to modify sections
for ($i = 0; $i -lt $kbIndexContent.Count; $i++) {
    $line = $kbIndexContent[$i]

    # Check if the line matches one of the section headers
    $matchingSection = $sections | Where-Object { $line -eq "=== `"$_`"" }
    if ($matchingSection) {
        # Add the header line to the updated content
        $updatedContent += $line
        $sectionName = $matchingSection
        # Skip subsequent lines until a blank line is found
        while (++$i -lt $kbIndexContent.Count -and $kbIndexContent[$i].Trim() -ne "") { }

        # Insert new rows for each file in the current section
        if ($groupedEntries.ContainsKey($sectionName)) {
            foreach ($entry in $groupedEntries[$sectionName]) {
                $newLine = "    * [$($entry.Title)]($($entry.Path))"
                Write-Host $newLine
                $updatedContent += $newLine
            }
        }
        
        # Add the blank line back to separate sections
        $updatedContent += ""
    }
    else {
        # Add lines that aren't part of a section
        $updatedContent += $line
    }
}

# Write the updated content back to kbindex.md
$updatedContent | Set-Content -Path $kbIndexPath

Write-Output "kbindex.md has been updated successfully."
<# build this later?
$distinctTags = $resultArray.tags | Sort-Object | Get-Unique
foreach ($tag in $distinctTags) {
    # Output the current tag
    Write-Host "Tag: $tag"
    
    # Find all records in $resultArray that have the current tag
    $matchingPages = $resultArray | Where-Object { $_.Tags -contains $tag }
    
    # Output the matching records
    foreach ($page in $matchingPages) {
        Write-Host "  - Title: $($page.Title), Filename: $($page.Path)"
    }
    
    Write-Host "" # Add an empty line for better readability
}
#>