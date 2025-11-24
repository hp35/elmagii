# Lecture 9 - Maxwell's equations and electromagnetic waves

This directory contains the Lecture Notes for Lecture 9, <i>Maxwells ekvationer
och vågutbredning</i> (English: <i>Maxwell's equations and electromagnetic
waves</i>), including all TeX code (plain TeX, no LaTeX), MetaPost figures
and supporting material.

## Primary files of interest

[lecture-09.tex](lecture-09.tex) - Plain TeX source code for the lecture.

[lecture-09.pdf](lecture-09.pdf) - Compiled document containing the Lecture Notes.

## Summary of the lecture (Swedish)

Faradays och Ampères lagar sys tillsammans med Gauss lag för det elektriska
och magnetiska fältet slutligen ihop till Maxwells ekvationer. Nyckeln till
dessa kommer ifrån Maxwells generalisering av Ampères lag, där Maxwell kom
på att lösningen till problemet med att kontinuitetsekvationen för elektrisk
laddning inte uppfylldes för tidsberoende fält var att lägga till en term i
den fria strömtätheten <b>J</b><sub>f</sub>, motsvarande förskjutningsströmmen
∂<b>D</b>/∂<i>t</i>. Med denna förskjutningsström närvarande i Ampères lag
∇ × <b>H</b> = <b>J</b><sub>f</sub> + ∂<b>D</b>/∂<i>t</i> satisfieras även
kontinuitetsekvationen ∇ · <b>J</b> = −∂ρ/∂<i>t</i>.

Vi sammanfattar Maxwells ekvationer en gång för alla, och visar hur dessa kan
omformuleras till två vågekvationer för de elektriska och magnetiska fälten.

## Contents

1. Maxwells generalisering av Ampères lag

2. Maxwells ekvationer

3. Från Maxwells ekvationer till elektromagnetisk vågekvation

4. Apropå särskiljning av polarisationsdensitet och magnetisering

5. Vågekvation, induktion, elektrostatik, elektrodynamik, vad gäller detta
   egentligen?

    5.1 Exempel I: Elektrostatik

    5.2 Exempel II: Magnetostatik

6. Sammanfattning av Föreläsning 8 - <i>Maxwells ekvationer och vågutbredning</i>

## Compiling the TeX code and figures

In this directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

## List of figures

[`figs/chargeconsv.mp`](figs/chargeconsv.mp)
    ([`figs/chargeconsv.pdf`](figs/chargeconsv.pdf))
    <i>MetaPost drawing of the charge conservation law.</i>

[`figs/poldensity.mp`](figs/poldensity.mp)
    ([`figs/poldensity.pdf`](figs/poldensity.pdf))
    <i>MetaPost drawing of the molecular polarizability building up the
    polarization density.</i>

## Copyright
Copyright (C) 2024, Fredrik Jonsson, under GPL 3.0.
