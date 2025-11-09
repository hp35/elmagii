# Lecture 4 - Magnetostatics

This directory contains the Lecture Notes for Lecture 4, <i>Magnetostatik</i>
(English: <i>Magnetostatics</i>), including all TeX code (plain TeX, no LaTeX),
MetaPost figures and supporting material.

## Primary files of interest

[lecture-04.tex](lecture-04.tex) - Plain TeX source code for the lecture.

[lecture-04.pdf](lecture-04.pdf) - Compiled document containing the Lecture Notes.

## Summary of the lecture (Swedish)

Med en kort sammanfattning av historiken bakom upptäckandet av magnetiska
fält går vi in på själva definitionen av ett magnetiskt fält som den kraft
som via Lorentz kraftlag utövas på en laddad partikel i rörelse. Utifrån
denna formuleras Ampères kraftlag för strömslingor, samt att vi kan dra
slutsatsen att kraften på fria laddningar aldrig utför något arbete.
Då vi generaliserar strömbegreppet till en strömtäthet <b>J</b> kan vi
under användande av Gauss lag ta fram kontinuitetsekvationen för laddning,
som länkar ihop divergensen ∇ · <b>J</b> hos strömtätheten med tidsderivatan
av laddningstätheten ρ. Biot–Savarts lag introduceras som ett axiom för det
magnetfält som genereras av en ström traverserande en strömslinga, vilket
för övrigt är första momentet där den magnetiska permeabiliteten µ<sub>0</sub>
introduceras. Utifrån formen på Biot–Savarts lag för generering av magnetfält
visar vi att ∇ · <b>B</b> = 0 alltid är uppfyllt, vilket påvisar att magnetiska
monopoler (magnetisk laddning) ej existerar, och att magnetism alltid endast
yttrar sig i form av magnetiska dipoler eller högre ordningar i
multipolutvecklingen.
Vi visar att i magnetostatik kan rotationen av magnetfältet erhållas som
∇ × <b>B</b> = µ<sub>0</sub> <b>J</b>, kallad Ampères lag. Slutligen visar
vi på att icke-existensen av magnetiska monopoler direkt har som följd att
vi kan tolka det magnetiska fältet som härrörande från en vektorpotential
<b>A</b>, i analogi med den skalära potentialen φ inom elektrostatik, som
<b>B</b> = ∇ × <b>A</b>.
Ampères lag kan tolkas i termer av denna vektorpotential som Poissons ekvation
∇<sup>2</sup> <b>A</b> = −µ<sub>0</sub> <b>J</b> med strömtätheten som källterm.

## Compiling the TeX code and figures

In this directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

## List of figures

[`ampereforce.mp`](ampereforce.mp)
    ([`ampereforce.pdf`](ampereforce.pdf))
    <i>MetaPost drawing of the force acting upon the charge transport
    (current) in a fixed trajectory, illustrating the Ampere force law
    on current loops.</i>

[`biotsavart.mp`](biotsavart.mp)
    ([`biotsavart.pdf`](biotsavart.pdf))
    <i>MetaPost drawing of the setup used in Biot--Savart's law, describing
    the generation of a magnetic field by a steady-state current.</i>

[`lorentz.mp`](lorentz.mp)
    ([`lorentz.pdf`](lorentz.pdf))
    <i>MetaPost drawing of a point charge moving with velocity <b>v</b>
    in a magnetic field <b>B</b>, illustrating the resulting Lorentz
    force <b>F</b> acting of the charge.</i>

## Copyright
Copyright (C) 2025, Fredrik Jonsson, under GPL 3.0.
