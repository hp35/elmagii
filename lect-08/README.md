# Lecture 8 - The multipole expansion

This directory contains the Lecture Notes for Lecture 8,
<i>Multipolutvecklingen</i> (English: <i>The multipole expansion</i>),
including all TeX code (plain TeX, no LaTeX), MetaPost figures and supporting
material.

## Primary files of interest

[lecture-08.tex](lecture-08.tex) - Plain TeX source code for the lecture.

[lecture-08.pdf](lecture-08.pdf) - Compiled document containing the Lecture Notes.

## Summary of the lecture (Swedish)

Vi lämnar för denna föreläsning dipolmodellen för ett tag, och visar på att
andra konstruktioner av laddningsfördelningar, exempelvis kvadrupoler och
oktopoler, ger bidrag till fält som avklingar med en annan takt en det
klassiska “1/<i>r</i><sup>2</sup>”-uppträdandet. Vi utgår från de klassiska
integralerna för den skalära potentialen φ och vektorpotentialen <b>A</b> och
ägnar oss åt en statisk modell för multipolutvecklingen.

Vi går igenom begreppen dipol, kvadrupol, oktopol och högre ordningar;
specifikt visar vi på att även det enklast tänkbara fallet av en elektrisk
dipol har högre ordningars multipolmoment närvarande, men att dessa oftast
försummas vid betraktelse på stora avstånd.

Föreläsningen avslutas med att demonstrera multipolutvecklingen för generella
laddningsfördelningar i termer av skalär potential, samt fastställande av
dipolapproximationen för elektrostatiska och magnetostatiska fält.

## Compiling the TeX code and figures

In this directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

## List of figures

[`figs/chargedist.mp`](figs/chargedist.mp)
    ([`figs/chargedist.pdf`](figs/chargedist.pdf))
    <i>MetaPost drawing of the classical electric charge distribution
    used when analyzing multipole expansion of the potential.</i>

[`figs/eldipole.mp`](figs/eldipole.mp)
    ([`figs/eldipole.pdf`](figs/eldipole.pdf))
    <i>MetaPost drawing of the classical electric dipole geometry.</i>

[`figs/linelquadpole.mp`](figs/linelquadpole.mp)
    ([`figs/linelquadpole.pdf`](figs/linelquadpole.pdf))
    <i>MetaPost drawing of the classical linear electric quadrupole
    geometry.</i>

[`figs/magdensity.mp`](figs/magdensity.mp)
    ([`figs/magdensity.pdf`](figs/magdensity.pdf))
    <i>MetaPost drawing of the molecular magnetic dipoles building up
    the macroscopic magnetization of the medium.</i>

[`figs/octopole.mp`](figs/octopole.mp)
    ([`figs/octopole.pdf`](figs/octopole.pdf))
    <i>MetaPost drawing of the classical electric octopole geometry.</i>

[`figs/poldensity.mp`](figs/poldensity.mp)
    ([`figs/poldensity.pdf`](figs/poldensity.pdf))
    <i>MetaPost drawing of the molecular polarizability building up
    the polarization density.</i>

[`figs/quadrupole.mp`](figs/quadrupole.mp)
    ([`figs/quadrupole.mp.pdf`](figs/quadrupole.mp.pdf))
    <i>MetaPost drawing of the classical electric quadrupole geometry.</i>

## Copyright
Copyright (C) 2024, Fredrik Jonsson, under GPL 3.0.
