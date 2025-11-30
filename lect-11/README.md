# Lecture 11 - Retarded potentials as solutions to Maxwell's equations

This directory contains the Lecture Notes for Lecture 11, <i>Retarderade
potentialer som lösningar till Maxwells ekvationer</i> (English: <i>Retarded
potentials as solutions to Maxwell's equations</i>), including all TeX code
(plain TeX, no LaTeX), MetaPost figures and supporting material.

## Primary files of interest

[lecture-11.tex](lecture-11.tex) - Plain TeX source code for the lecture.

[lecture-11.pdf](lecture-11.pdf) - Compiled document containing the Lecture Notes.

## Summary of the lecture (Swedish)

Vi inleder med en rekapitulation av den generella formen på den
elektromagnetiska vågekvationen för elektriska och magnetiska fält, följt
av en analogi mellan potentialerna och mekaniska system.
Utifrån definitionen av vektorpotentialen <b>A</b> som <b>B</b> = ∇ × <b>A</b>
från identiteten ∇ · <b>B</b> = 0, så erhåller vi via Faradays lag att det
elektriska fältet i elektrodynamiska problem måste innehålla även
vektorpotentialen som <b>E</b> = −∇φ−∂<b>A</b>/∂<i>t</i>.

Vågekvationen för de elektrodynamiska potentialerna formuleras, följt av en
genomgång av en viss form av godtycke som existerar i valet av potentialerna,
under den så kallade gauge-transformen. Vi finner under antagande om
Lorenz-villkoret (Lorenz gauge) att ekvationerna för potentialermna frikopplas
från varandra. Formen för de retarderade potentialerna, där ett objekts verkan
på avstånd analyseras, formuleras på integralform för den skalära potentialen
och vektorpotentialen, och exemplifieras slutligen för en tunn dipolantenn.

## Contents

1. Elektrodynamiska fält och retarderade potentialer

2. Recap på vad skalära potentialen och vektorpotentialen är bra för

3. Retarderade potentialer och kopplingen till elektromagnetiska fält

4. Vågekvationen för retarderade potentialer

    4.1. Plan för hur vi angriper problemet med tidsfördröjning hos potentialer

    4.2. Den generella formen av vågekvationen för vektorpotentialen

    4.3. Den generella formen av vågekvationen för skalära potentialen

    4.4. Gauge-transformen

    4.5. Lorenz-villkoret ("Lorenz gauge")

    4.6. Några observationer

5. [Överkurs] Gauge-transformen: Lorenz och Coulomb gauge

    5.1. Lorenz gauge

    5.2. Coulomb gauge

6. Retarderade potentialer på integralform

7. Exempel: Halvvågsantenn och emitterade elektromagnetiska fält

8. Sammanfattning av Föreläsning 11 - Retarderade potentialer som lösningar
   till Maxwells ekvationer

## Compiling the TeX code and figures

In this directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

## List of figures

[`figs/analogi.mp`](figs/analogi.mp)
    ([`figs/analogi.pdf`](figs/analogi.pdf))
    <i>MetaPost drawing of the analogy between potential energy and
    electrostatic potential.</i>

[`figs/chargedist.mp`](figs/chargedist.mp)
    ([`figs/chargedist.pdf`](figs/chargedist.pdf))
    <i>MetaPost drawing of the classical electric charge distribution
    used when analyzing multipole expansion of the potential.</i>

[`figs/example.mp`](figs/example.mp)
    ([`figs/example.pdf`](figs/example.pdf))
    <i>MetaPost drawing of the geometry of the half-wave antenna.</i>

## Copyright
Copyright (C) 2024, Fredrik Jonsson, under GPL 3.0.
