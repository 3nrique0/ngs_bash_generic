# Script description

The commands are wrapped in a bash script.
All the scripts take a "Step name".
It'll be the name of the directory in `steps/`.
**All the scripts are to be launched from the project's root**

The rest of the parameters required would be input files and sometimes
some parameters like thread numbers, auxiliary files, etc.

If you feel organised, do re-name the scripts in the order they are to be executed:

* 01_quality_check.sh
* 02_trim_and_clean.sh
* 03_mapping_foo.sh

## procedure.sh

This is THE workflow.
This script will add and order all the stages of the process.

