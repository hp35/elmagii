# Source for compilation of the complete series of Lecture Notes into a single document

This repository contains a `Makefile` and a set of supportive TeX macros and
definitions, including a preface, in the `src` subdirectory. The compiled
document extracts text from the individual lectures, and the auto-generated
file `complete.tex` should hence never be altered.

## Contributing

Reports on errors, inconsistencies or improvements in general are most welcome!

## Compiling the TeX code and figures

In the present directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

In order to generate all documents and figures in all lectures, just run
`make` in the `elmagii` root directory. In order to clean up all directories,
just run `make clean` in the `elmagii` root directory.

## Copyright
Copyright (C) 2026, Fredrik Jonsson, under GPL 3.0.
