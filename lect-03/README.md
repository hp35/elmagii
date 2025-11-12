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

## Contents

1. Laplaces ekvation för den elektrostatiska (skalära) potentialen

    1.1. Angreppssätt~1 för elektrostatiska problem
         -- Coulombintegralen

    1.2. \subsection{Angreppssätt~2 för elektrostatiska problem
         -- Skalär potential på integralform}

    1.3. Angreppssätt~3 för elektrostatiska problem
         -- Laplaces ekvation för skalär potential

2. Entydighet hos lösningar till Laplace ekvation

    2.1. Laplaces ekvation tillåter bara extrempunkter på randen
         till en domän

    2.2. Första entydighetsteoremet för den elektrostatiska
         potentialen

    2.3 Elektriska ledare och andra entydighetsteoremet för
        den elektrostatiska potentialen

3. Faradays bur

4. Det elektriska fältet är identiskt noll i en perfekt ledare,
   så hur kan vi då skapa strömmar?

5. Sammanfattning av vitsen med entydighetsteoremet

6. Spegelladdningar i perfekt ledande plan

    6.1. Problemformulering för elektrostatik ovanför perfekt
         ledande plan

    6.2. Att lägga till virtuell laddning så att vi når
         randvillkoret φ=0 på <i>z</i>=0

    6.3. Den skalära potentialen i rummet med det ledande planet
         ersatt med virtuell spegelladdning

    6.4. Sammanfattning av virtuell spegelladdning i perfekt ledande plan

    6.5. Det resulterande elektriska fältet med den speglade laddningen

    6.6. Laddningsfördelningen i det perfekt ledande planet $z=0$

7. Spegelladdningar i plana gränsytor mellan dielektrika

8. Spegelladdningar i cylindriska perfekt ledande gränsytor

    8.1. Potential från en linjeladdning

    8.2. Att lägga till virtuell laddning så att vi når
         randvillkoret φ=0 på cylinderns yta |<b>x</b>|=<i>R</i>

    8.3. Sammanfattning av virtuell speglad linjeladdning i cylindrisk yta

9. Spegelladdningar i sfäriska perfekt ledande gränsytor

10. Kan jord ersättas med godtycklig konstant potential?

11. Sammanfattning av Föreläsning~3 -- Spegelladdningar,
    randvillkor och entydighet för lösningar till potentialproblem

## Compiling the TeX code and figures

In this directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

## List of figures

[`figs/condsurf.mp`](figs/condsurf.mp)
    ([`figs/condsurf.pdf`](figs/condsurf.pdf))
    <i>MetaPost drawing of the normal vector and electric field from
    an arbitrary surface S.</i>

[`figs/extrema.mp`](figs/extrema.mp)
    ([`figs/extrema.pdf`](figs/extrema.pdf))
    <i>MetaPost drawing of the sphere used in proving that no local extremum
    points exist for solutions to Laplace's equation, in particular for the
    scalar electrostatic potential.</i>

[`figs/faradaycage.mp`](figs/faradaycage.mp)
    ([`figs/faradaycage.pdf`](figs/faradaycage.pdf))
    <i>MetaPost drawing of Faraday's cage, being a special case of the
    uniqueness configuration.</i>

[`figs/mirrorcharge-cylinder.mp`](figs/mirrorcharge-cylinder.mp)
    ([`figs/mirrorcharge-cylinder.pdf`](figs/mirrorcharge-cylinder.pdf))
    <i>MetaPost drawing of a linecharge lambda placed along and outside of
    a cylindrical perfect conductor, constuting the "gedankenexperiment"
    of mirrored line charges and perfectly conducting cylindrical surfaces.</i>

[`figs/mirrorplane-dielectrica.mp`](figs/mirrorplane-dielectrica.mp)
    ([`figs/mirrorplane-dielectrica.pdf`](figs/mirrorplane-dielectrica.pdf))
    <i>MetaPost drawing of a charge <i>q</i> placed at <i>z</i>=<i>h</i>
    inside a dielectricum with relative electric permittivity
    &epsilon;<sub>r</sub> and a virtual mirror charge <i>q</i>' placed at
    <i>z</i>=&minus;<i>h</i> inside a dielectricum with relative electric
    permittivity &epsilon;'<sub>r</sub>, constuting the "gedankenexperiment"
    of mirror charges and planar interfaces between dielectrica.</i>

[`figs/mirrorplane-gedanken-general.mp`](figs/mirrorplane-gedanken-general.mp)
    ([`figs/mirrorplane-gedanken-general.pdf`](figs/mirrorplane-gedanken-general.pdf))
    <i>MetaPost drawing of a charge <i>q</i> placed at <i>z</i>=<i>h</i> and
    a mirror charge placed at <i>z</i>=&minus;<i>h</i>, constuting the
    "gedankenexperiment" of mirror charges and perfectly conducting planes.</i>

[`figs/mirrorplane-gedanken.mp`](figs/mirrorplane-gedanken.mp)
    ([`figs/mirrorplane-gedanken.pdf`](figs/mirrorplane-gedanken.pdf))
    <i>MetaPost drawing of a charge <i>q</i> placed at <i>z</i>=<i>h</i> and
    a mirror charge placed at <i>z</i>=&minus;<i>h</i>, constuting the
    "gedankenexperiment" of mirror charges and perfectly conducting planes.</i>

[`figs/mirrorplane.mp`](figs/mirrorplane.mp)
    ([`figs/mirrorplane.pdf`](figs/mirrorplane.pdf))
    <i>MetaPost drawing of a charge <i>q</i> placed a distance <i>d</i> above
    an infinite and perfectly conducting plane <i>z</i>=0, providing the first
    example of application of the method of images.</i>

[`figs/unique.mp`](figs/unique.mp)
    ([`figs/unique.pdf`](figs/unique.pdf))
    <i>MetaPost drawing of the volume and surface geometry used in the proof
    of uniqueness for the electrostatic potential as solution to Laplace's
    equation. (Also applied to Poisson's equation.)</i>

## Copyright
Copyright (C) 2025, Fredrik Jonsson, under GPL 3.0.
