# Lecture 2 - Electrostatic potential and applications of Gauss' law

This directory contains the Lecture Notes for Lecture 2, <i>Elektrostatisk
potential och till{\"a}mpningar av Gauss lag</i> (English: <i>Electrostatic
potential and applications of Gauss' law</i>), including all TeX code (plain
TeX, no LaTeX), MetaPost figures and supporting material.

## Primary files of interest

[lecture-02.tex](lecture-02.tex) - Plain TeX source code for the lecture.

[lecture-02.pdf](lecture-02.pdf) - Compiled document containing the Lecture Notes.

## Summary of the lecture (Swedish)

Ett par enkla exempel på utnyttjande av symmetrier inom elektrostatik med Gauss
lag gås igenom. Vi bevisar att i elektrostatiska problem är alltid
∇ × <b>E</b> = <b>0</b>, vilket följer direkt av Stokes teorem applicerat
på en sluten slinga i ett statiskt elektriskt fält från en punktladdning.
Detta resultat generaliseras därefter med superpositionsprincipen för en
godtycklig laddningsfördelning. Att ∇ × <b>E</b> = <b>0</b> gör att vi
direkt kan formulera det statiska elektriska fältet i termer av en skalär
potential φ enligt <b>E</b> = −∇φ, en potential som vi därefter härleder den
explicita integralformen för, uttryckt i laddningstäthet. Vi härleder uttrycken
för upplagrad potentiell energi i termer av den elektriska potentialen, och vi
går igenom paradoxen i att det vektorvärda elektriska fältet <b>E</i> kan
extraheras ur en enda skalär potential φ. Vi avslutar föreläsningen med att
utifrån Gauss lag för det elektriska fältet på differentialform omformulera
denna i termer av den skalära potentialen som Poissons
ekvation ∇<sup>2</sup> φ = −ρ/ε<sub>0</sub>.

## Compiling the TeX code and figures

In this directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

## Copyright
Copyright (C) 2025, Fredrik Jonsson, under GPL 3.0.
