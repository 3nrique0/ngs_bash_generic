# NGS workflow in bash

**WORK IN PROGRESS IT MIIIIGHT BE INCOMPLETE**

The objective of this repository is to help people getting started at
bioinformatics NGS analyses good practices, as far as it can get people started.

I'd love for people to properly organize data and scripts as well as wrappers
to make things repeatable

I'll hear you asking "why are you not using containrers".
Because not all labs nor users will have access to a big machine with containers.
So let's start with something **basic and robust that will work**.

For this tutorial it's up to you to install the tools you'll need,
whether you'll use a container or do an install it'll depend in the computer
you'll work with.

Ready ? LET'S GO !



## Get your project structure right

I took the structure of the project advised by
[GenomeDK](https://genome.au.dk/docs/best-practices/)'s best practices.

----
I'll add some schematics here
---

The script `build_project_structure.sh  <path>` will create the structure of files.

Keep things tidy !!



## No workflow fits all

Each scientific project being different, data coming in different folders/chuncks
each project will be unique, so it's up to you to make it fit into a more generic
workflow **AND** to adapt the workflow to your project.

Since this is just to get you started, I added some scripts in `scripts/` which
will already do some of the most common basic things in a workflow

