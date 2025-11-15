# Lecture 2 - Electrostatic potential and applications of Gauss' law

This directory contains the Lecture Notes for Lecture 2, <i>Elektrostatisk
potential och tillämpningar av Gauss lag</i> (English: <i>Electrostatic
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
godtycklig laddningsfördelning.

Att ∇ × <b>E</b> = <b>0</b> gör att vi direkt kan formulera det statiska
elektriska fältet i termer av en skalär potential φ enligt <b>E</b> = −∇φ,
en potential som vi därefter härleder den explicita integralformen för,
uttryckt i laddningstäthet.
Vi härleder uttrycken för upplagrad potentiell energi i termer av den
elektriska potentialen, och vi går igenom paradoxen i att det vektorvärda
elektriska fältet <b>E</b> kan extraheras ur en enda skalär potential φ.

Vi avslutar föreläsningen med att utifrån Gauss lag för det elektriska fältet
på differentialform omformulera denna i termer av den skalära potentialen som
Poissons ekvation ∇<sup>2</sup> φ = −ρ/ε<sub>0</sub>.

## Contents

1. Tillämpning av Gauss lag - Rak linjeladdning

    1.1. Alternativ analys för rak linjeladdning

2. Tillämpning av Gauss lag - Plan ytladdning

3. Rotationen för det statiska elektriska fältet

4. Elektrostatisk skalär potential

    4.1. Tolkning av −∇φ

5. Arbete och upplagrad energi vid förflyttning av elektriska
  laddningar

    5.1. En paradox

6. Poissons ekvation för den skalära potentialen

7. Sammanfattning av Föreläsning 2 - <i>Elektrisk potential och
   tillämpningar av Gauss lag</i>

## Compiling the TeX code and figures

In this directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

## List of figures

[`figs/linecharge.mp`](figs/linecharge.mp)
    ([`figs/linecharge.pdf`](figs/linecharge.pdf))
    <i>MetaPost drawing of a line charge enclosed by a "gaussian
    surface" with the purpose of extracting the electric field.</i>

[`figs/lineintegral.mp`](figs/lineintegral.mp)
    ([`figs/lineintegral.pdf`](figs/lineintegral.pdf))
    <i>MetaPost drawing of the line integral from which we via Stokes'
    theorem can deduce that the rotation of the static electric field
    is identically zero.</i>

[`figs/potential.mp`](figs/potential.mp)
    ([`figs/potential.pdf`](figs/potential.pdf))
    <i>MetaPost drawing of the line integral from which we deduce the
    existence of the (scalar) electrostatic potential.</i>

[`figs/surfcharge.mp`](figs/surfcharge.mp)
    ([`figs/surfcharge.pdf`](figs/surfcharge.pdf))
    <i>MetaPost drawing of a surface charge enclosed by a "gaussian
    surface" with the purpose of extracting the electric field.</i>

## Copyright
Copyright (C) 2025, Fredrik Jonsson, under GPL 3.0.
