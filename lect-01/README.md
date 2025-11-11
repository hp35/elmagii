# Lecture 1 - Electrostatics, the superposition principle and Gauss law

This directory contains the Lecture Notes for Lecture 1, <i>Elektrostatik,
superpositionsprincipen och Gauss lag</i> (English: <i>Electrostatics, the
superposition principle and Gauss law</i>), including all TeX code (plain
TeX, no LaTeX), MetaPost figures and supporting material.

## Primary files of interest

[lecture-01.tex](lecture-01.tex) - Plain TeX source code for the lecture.

[lecture-01.pdf](lecture-01.pdf) - Compiled document containing the Lecture Notes.

## Summary of the lecture (Swedish)

Med en kort sammanfattning av historiken bakom elektrostatik och upptäckten
av elektronen som elementarladdning går vi direkt in på Coulombs lag för
växelverkan mellan laddade partiklar. Coulombs lag, som i grund och botten
kan härledas från utbyte av virtuella fotoner mellan laddade elementarpartiklar,
tas här som ett axiom, från vilket vi härleder fram motsvarande kraft på en
testladdning från ett system av laddningar, ur vilken det elektriska fältet
definieras.
En genomgång av superpositionsprincipen för elektriska fält följs av en
härledning av Coulomb-växelverkan för en kontinuerlig distribution av
laddningstäthet, den så kallade Coulombs generaliserade lag, eller kort
och gott “Coulombintegralen”. Vi introducerar det elektriska flödet som
integralen av det elektriska fältet över en godtycklig yta, utifrån vilket
vi härleder Gauss lag för elektriska fält, tillämpbar på godtyckliga
laddningsfördelningar i form av punkt- linje- yt- eller volymladdningar.
Slutligen avslutar vi med en härledning av Gauss lag på differentialform.

## Compiling the TeX code and figures

In this directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

## List of figures

[`figs/chargetypes.mp`](figs/chargetypes.mp)
    ([`figs/chargetypes.pdf`](figs/chargetypes.pdf))
    <i>MetaPost drawing of three types of charge distributions: Line charges,
    surface charges and volume charges.</i>

[`figs/coulombdist.mp`](figs/coulombdist.mp)
    ([`figs/coulombdist.pdf`](figs/coulombdist.pdf))
    <i>MetaPost drawing of the classical electric charge distribution used
    when analyzing Coulombs law, with application to the derivation of Gauss'
    law.</i>

[`figs/coulomb.mp`](figs/coulomb.mp)
    ([`figs/coulomb.pdf`](figs/coulomb.pdf))
    <i>MetaPost drawing of coulomb attraction or repulsion between two
    point charges.</i>

[`figs/coulombsys.mp`](figs/coulombsys.mp)
    ([`figs/coulombsys.pdf`](figs/coulombsys.pdf))
    <i>MetaPost drawing of coulomb action for a system of point charges.</i>

[`figs/coulombsyspart.mp`](figs/coulombsyspart.mp)
    ([`figs/coulombsyspart.pdf`](figs/coulombsyspart.pdf))
    <i>MetaPost drawing of coulomb action for a system of point charges,
    partitioned into two separate groups of source charges.</i>

[`figs/elecflow.mp`](figs/elecflow.mp)
    ([`figs/elecflow.pdf`](figs/elecflow.pdf))
    <i>MetaPost drawing of electric flow through a surface, including a
    displayed equation with the definition of electric flow.</i>

[`figs/gauss-step-1.mp`](figs/gauss-step-1.mp)
    ([`figs/gauss-step-1.pdf`](figs/gauss-step-1.pdf))
    <i>MetaPost drawing of Step 1 (point charge, closed surface with
    spherical symmetry) in the derivation of Gauss' law from the basic
    point-charge form of Coulomb's law.</i>

[`figs/gauss-step-2.mp`](figs/gauss-step-2.mp)
    ([`figs/gauss-step-2.pdf`](figs/gauss-step-2.pdf))
    <i>MetaPost drawing of Step 2 (point charge, non-spherical closed
    surface of arbitrary shape) in the derivation of Gauss' law from the
    basic point-charge form of Coulomb's law.</i>

[`figs/gauss-step-3.mp`](figs/gauss-step-3.mp)
    ([`figs/gauss-step-3.pdf`](figs/gauss-step-3.pdf))
    <i>MetaPost drawing of Step 3 (system of point charges, enclosed by
    a closed surface of arbitrary shape) in the derivation of Gauss' law
    from the basic point-charge form of Coulomb's law.</i>

[`figs/gauss-step-4.mp`](figs/gauss-step-4.mp)
    ([`figs/gauss-step-4.pdf`](figs/gauss-step-4.pdf))
    <i>MetaPost drawing of Step 4 (continuous charge distribution, enclosed
    by a closed surface of arbitrary shape) in the derivation of Gauss' law
    from the basic point-charge form of Coulomb's law.</i>

[`figs/worldmap.mp`](figs/worldmap.mp)
    ([`figs/worldmap.pdf`](figs/worldmap.pdf))
    <i>MetaPost drawing of our World Map of electrodynamics, and how
    Coulomb's law together with Biot-Savart's law interlinked with
    constitutive relations result in Maxwell's equations, finally
    producing the electromagnetic wave equation.</i>

## Copyright
Copyright (C) 2025, Fredrik Jonsson, under GPL 3.0.
