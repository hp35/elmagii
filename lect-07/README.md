# Lecture 7 - Magnetic fields in materials

This directory contains the Lecture Notes for Lecture 7, <i>Magnetiska fält i
material</i> (English: <i>Magnetic fields in materials</i>), including all TeX
code (plain TeX, no LaTeX), MetaPost figures and supporting material.

## Primary files of interest

[lecture-07.tex](lecture-07.tex) - Plain TeX source code for the lecture.

[lecture-07.pdf](lecture-07.pdf) - Compiled document containing the Lecture Notes.

## Summary of the lecture (Swedish)

I denna föreläsning analyserar vi vad som händer då det magnetiska spinnet hos
material linjeras och magnetiserar materialet, antingen genom ett externt
pålagt magnetiskt fält eller genom att spinnen är naturligt linjerade i
materialet, i så kallade permanentmagneter.

Krafter och moment på magnetiska dipoler extraheras från upplagrade energier
för dipoler i elektriska eller magnetiska fält, och vi introducerar
magnetisering som en “magnetisk polarisationsdensitet”, i analogi med den
elektriska motsvarigheten. Vi diskuterar översiktligt den upplagrade energin
i ett magnetiserat medium och effekten av hysteres som effekt av ett varierande
externt pålagt magnetfält.

Slutligen går vi igenom hur vektorpotentialen <b>A</b>(</b>x</b>, <i>t</i>)
uttrycks för ett objekt med godtycklig magnetisering <b>M</b>(</b>x</b>,
<i>t</i>), och finner att uttrycket för vektorpotentialen är ekvivalent med
om det magnetiserade objektet istället hade varit konstruerat som ekvivalenta
volyms- och ytströmmar <b>J</b><sub>b</sub> och <b>K</b><sub>b</sub> av bundna
laddningar.

## Compiling the TeX code and figures

In this directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

## List of figures

[`figs/hysteres.mp`](figs/hysteres.mp)
    ([`figs/hysteres.pdf`](figs/hysteres.pdf))
    <i>MetaPost drawing of the hysteresis curve in magnetostatics.</i>

[`figs/magcurrent.mp`](figs/magcurrent.mp)
    ([`figs/magcurrent.pdf`](figs/magcurrent.pdf))
    <i>MetaPost drawing of the equivalent bound surface and volume currents
    corresponding to the local magnetization of a magnetized object.</i>

[`figs/magdensity.mp`](figs/magdensity.mp)
    ([`figs/magdensity.pdf`](figs/magdensity.pdf))
    <i>MetaPost drawing of the magnetization, expressed as the density of
    molecular magnetic dipoles per unit volume.</i>

[`figs/magdipole.mp`](figs/magdipole.mp)
    ([`figs/magdipole.pdf`](figs/magdipole.pdf))
    <i>MetaPost drawing of the molecular magnetic dipoles of the Gilbert
    and Ampère models.</i>

[`figs/vectpot.mp`](figs/vectpot.mp)
    ([`figs/vectpot.pdf`](figs/vectpot.pdf))
    <i>MetaPost drawing of the geometry for extracting the vector potential
    from a magnetized object.</i>

## Copyright
Copyright (C) 2024, Fredrik Jonsson, under GPL 3.0.
