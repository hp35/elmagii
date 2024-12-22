# Lecture Notes on Electromagnetic Theory II (1TE626) at Uppsala University

This repository contains all TeX code (plain TeX, no LaTeX), MetaPost figures
and supporting material as used in my lectures on Electromagnetic Theory II
(1TE626) for Engineering Physics (master level) at Uppsala University.

The directory contains the following subdirectories:

    `lect-06`   <i>Elektriska fält i material</i>
                (English: <i>Electric fields in materials</i>)
    `lect-07`   <i>Magnetiska fält i material</i>
                (English: <i>Magnetic fields in materials</i>)
    `lect-08`   <i>Multipolutvecklingen</i>
                (English: <i>The multipole expansion</i>)
    `lect-09`   <i>Maxwells ekvationer och vågutbredning</i>
                (English: <i>Maxwell's equations and electromagnetic waves</i>)
    `lect-10`   <i>Vågutbredning i homogena och isotropa dielektrika</i>
                (English: <i>Electromagnetic waves in homogeneous and
		 isotropic dielectrics</i>)
    `lect-11`   <i>Retarderade potentialer som lösningar till Maxwells
                   ekvationer</i>
                (English: Retarded potentials as solutions to Maxwell's
		 equations)

Vågutbredning i homogena och isotropa dielektrika

## Compiling the TeX code and figures

In each directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

In order to generate all documents and figures in all lectures, just run
`make` in the `elmagii` root directory. In order to clean up all directories,
just run `make clean` in the `elmagii` root directory.

## Gallery of illustrations used in the course

<i>Lecture 6 - Electric fields in materials</i>: Boundary conditions for
the normal component of electric field across a surface with non-zero charge
density.
![Boundary conditions for normal component of electric field across a surface
with non-zero charge density.](lect-06/figs/esurfnorm.svg)

<i>Lecture 7 - Magnetic fields in materials</i>: The orientation of spin to
form a magnetic polarization density.
![The orientation of spin to form a magnetic polarization
density.](lect-07/figs/magdensity.svg)

The geometry used in calculating the equivalent volume and surface currents
matching the (possibly inhomogeneous) general magnetization of a body.
![The geometry used in calculating the equivalent volume and surface
currents matching the (possibly inhomogeneous) general magnetization
of a body.](lect-07/figs/vectpot.svg)

<i>Lecture 8 - The multipole expansion</i>: The scalar potential and static
electric field from a quadratic electric quadrupole.
![The scalar potential and static electric field from a quadratic electric
quadrupole.](lect-08/multipoles/multipoles/quadquadrupole-str.png)

## Copyright
Copyright (C) 2024, Fredrik Jonsson, under GPL 3.0.
