# Lecture 6 - Electric fields in materials

This directory contains the Lecture Notes for Lecture 6, <i>Elektriska fält i
material</i> (English: <i>Electric fields in materials</i>), including all TeX
code (plain TeX, no LaTeX), MetaPost figures and supporting material.

## Primary files of interest

[lecture-06.tex](lecture-06.tex) - Plain TeX source code for the lecture.

[lecture-06.pdf](lecture-06.pdf) - Compiled document containing the Lecture Notes.

## Summary of the lecture (Swedish)

I och med denna föreläsning lämnar vi vakuumbeskrivningen av fält och gå in på
växelverkan mellan elektriska eller magnetiska fält och materia. Vi börjar med
en övergripande bild av hur vi successivt kan gå från en kvantmekanisk
beskrivning av denna växelverkan till makroskopiska begrepp som
susceptibiliteter och brytningsindex.

Den klassiska dipolmodellen för elektrisk polarisering av ett materials
molekyler av elektriska fält introduceras, och ett linjärt samband mellan
pålagt externt elektriskt fält och det resulterande elektriska dipolmomentet
hos mediet erhålls. En medelvärdesbildning över molekylernas elektriska
dipolmoment ger den elektriska polarisationsdensiteten hos det dielektriska
mediet, och vi formulerar ur denna den elektriska susceptibiliteten
χ<sub>e</sub> och den relativa elektriska permittiviteten ε<sub>r</sub>.
Vi härleder generaliseringen för Gauss lag för den elektriska flödestätheten
<b>D</b> som ∇ · <b>D</b> = ρ<sub>f</sub>, där ρ<sub>f</sub> är den fria
laddningstätheten.

Randvillkor och övergångar mellan olika dielektrika härleds för den elektriska
fältstyrkan <b>E</b> och den elektriska flödestätheten <b>D</b>, för deras
normal- och tangentialkomponenter. Slutligen formulerar vi måttet på upplagrad
elektrisk energi i ett dielektrikum.

## Compiling the TeX code and figures

In this directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

## List of figures

[`figs/dipole.mp`](figs/dipole.mp)
    ([`figs/dipole.pdf`](figs/dipole.pdf))
    <i>MetaPost drawing of the classical single and static electric
    dipole, excited by an externally applied electric field.</i>

[`figs/displace.mp`](figs/displace.mp)
    ([`figs/displace.pdf`](figs/displace.pdf))
    <i>MetaPost drawing of the more detailed model of the classical single
    and static electric dipole, excited by an externally applied electric
    field.</i>

[`figs/esurfnorm.mp`](figs/esurfnorm.mp)
    ([`figs/esurfnorm.pdf`](figs/esurfnorm.pdf))
    <i>MetaPost drawing of the surface with charge density over which we
    apply Gauss' law in order to extract boundary conditions for the electric
    field normal to the surface.</i>

[`figs/esurftang.mp`](figs/esurftang.mp)
    ([`figs/esurftang.pdf`](figs/esurftang.pdf))
    <i>MetaPost drawing of the surface with charge density over which we
    apply Gauss' law in order to extract boundary conditions for the electric
    field tangential to the surface.</i>

[`figs/poldensity.mp`](figs/poldensity.mp)
    ([`figs/poldensity.pdf`](figs/poldensity.pdf))
    <i>MetaPost drawing of the molecular polarizability building up the
    polarization density.</i>

## Copyright
Copyright (C) 2024, Fredrik Jonsson, under GPL 3.0.
