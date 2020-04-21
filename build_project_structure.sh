#!/bin/bash

# Use first argument as name for the project
project_dir=$1

# Create the project and all sub-directories at once
mkdir -p ${project_dir}/{data,docs,plots,restults,scripts,steps}

# Create a NOTEBOOK.txt and a README.txt
touch ${project_dir}/NOTEBOOK.txt ${project_dir}/README.txt

# Select all folders contained in project
# and create a README.txt in each one
for i in $(ls -d ${project_dir}/*/)
do
    touch ${i}README.md
done

# Print on the screen the full path of the localisation of the project
echo 'Your project structure has been created in: '
echo ${project_dir}

