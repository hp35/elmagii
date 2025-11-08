# Lecture 3 - Method of images for charges, boundary conditions and the uniqueness theorem, for the scalar potential

This directory contains the Lecture Notes for Lecture 3, <i>Spegelladdningar,
randvillkor och entydighet för lösningar till potentialproblem</i>
(English: <i>Method of images for charges, boundary conditions and the
uniqueness theorem, for the scalar potential</i>), including all TeX code
(plain TeX, no LaTeX), MetaPost figures and supporting material.

## Primary files of interest

[lecture-03.tex](lecture-03.tex) - Plain TeX source code for the lecture.

[lecture-03.pdf](lecture-03.pdf) - Compiled document containing the Lecture Notes.

## Summary of the lecture (Swedish)

Genom att visa på att Laplaces ekvation ∇<sup>2</sup> φ = 0 saknar lokala
extrempunkter, och har samtliga extrempunkter i randvärden till domänen där
vi löser ekvationen, så kan vi dra slutsatsen att en lösning φ till Laplaces
ekvation också är entydig, det vill säga att om vi finner en lösning φ så är
det också den enda existerande lösningen. Med utgångspunkt i detta finner vi
därefter att även Poissons ekvation ∇<sup>2</sup> φ = ρ/ε<sub>0</sub> i direkt
närvaro av en laddningstäthet ρ även den ger entydighet för lösningar φ.
Vi kan med detta visa att en domän som är omgiven av ett skal som hålls vid
konstant potential φ0 direkt ger att det elektriska fältet innanför skalet är
identiskt noll, vilket är principen för “Faradays bur”.
Utifrån entydighetsteoremet för Laplace och Poissons ekvation kan vi visa på
hur vi kan konstruera så kallade “virtuella spegelladdningar” för att lösa
elektrostatiska problem i närvaro av fria laddningar i elektriskt ledande
domäner eller ytor, specifikt för plana ytor mellan ledare eller dieletrika
samt cylinderytor och sfärer.
Slutligen så tar vi fram en metod för hur den resulterande laddningstätheten
på en yta av ledande material kan tas fram med de virtuella spegelladdningarna.

## Compiling the TeX code and figures

In this directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

## Copyright
Copyright (C) 2025, Fredrik Jonsson, under GPL 3.0.
