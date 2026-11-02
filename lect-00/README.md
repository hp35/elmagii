# Lecture 0 - Basic vector analysis applied to electromagnetic theory

This directory contains the Lecture Notes for Lecture 0, <i>Grundläggande
vektoranalys inom elektromagnetisk fältteori</i> (English: <i>Basic vector
analysis applied to electromagnetic theory</i>), including all TeX code
(plain TeX, no LaTeX), MetaPost figures and supporting material.

## Primary files of interest

[lecture-00.tex](lecture-00.tex) - Plain TeX source code for the lecture.

[lecture-00.pdf](lecture-00.pdf) - Compiled document containing the Lecture Notes.

## Summary of the lecture (Swedish)

Denna föreläsning är bistår med ett extramaterial som avhandlar de grundläggande
begrepp inom vektoranalys som vi frekvent kommer att använda oss av i kommande
föreläsningar. Denna extraföreläsning hålls i nära anslutning till den första
föreläsningen i kursen, och avser att fungera som rekapitulation för den
teknolog som känner sig lite ringrostig i sin vektoranalys.

Begreppen fält, gradient, divergens och rotation gås igenom med praktiska ex-
empel hämtade från elektrostatik och magnetostatik.
Vi inleder med en rekapitulation kring begreppet delta-distribution i en
och tre dimensioner, följt av en genomgång av de grundläggande deﬁnitionerna
av gradient ∇φ, divergens ∇ · <b>b</b> och rotation ∇×<b>b</b>.

De grundläggande identiteterna för divergensen av en rotation och rotationen
av en gradient gås igenom, då dessa är väsentliga för förståelsen av hur vi
rent matematiskt kan motivera existensen av vektorpotentialen och den skalära
potentialen. Föreläsningen avslutas med att illustrera vad rotationen av en
rotation (∇ × ∇ ×) innebär, då detta är centralt för formuleringen av den
elektromagnetiska vågekvationen.

## Contents

1. Introduktion

2. Vad är ett fält?

    2.1 Varifrån kommer ordet “fält”?
    
    2.2 Elektriskt och magnetiskt fält.
    
    2.3 Skalär potential och vektorpotential.

3. Diracs delta-distribution och punktformiga källor

    3.1 Delta-distributionen i en dimension – En mycket smal puls
    
    3.2 Den viktigaste egenskapen hos delta-distributionen är urvalsegenskapen
    
    3.3 Delta-funktionen med en annan total styrka
    
    3.4 Från en dimension till tre dimensioner
    
    3.5 En punktladdning
    
    3.6 Hur kommer delta-distributionen in i Gauss lag?
    
    3.7 Laddningsfördelningar i en, två och tre dimensioner
    
    3.8 Strömmar beskrivna med delta-distributioner
    
    3.9 En pulsad ström
    
    3.10 Kontinuitetsekvationen för elektrisk laddning
    
    3.11 Att ta med sig från delta-distributionen
    
4. Gradienten ∇φ

    4.1 Tolkning av gradienten i ett landskap bestående av kullar och dalar
    
    4.2 Gradientens matematiska deﬁnition
    
    4.3 Exempel: elektrisk potential och elektriskt fält
    
5. Divergensen ∇ · a

    5.1 Vad beskriver divergensen?
    
    5.2 Divergens och ﬂöde genom en sluten yta
    
    5.3 Divergensen hos det elektriska fältet
    
    5.4 Divergensen hos det magnetiska fältet
    
    5.5 Konkret exempel på att divergensen för fältet utanför en
        punktladdning är noll
	
    5.6 En paradox för det elektrostatiska fältet i en homogen laddningstäthet
    
6. Rotationen ∇ × b

    6.1 Vad beskriver rotationen?
    
    6.2 Cirkulation och Stokes sats
    
    6.3 Rotation hos det elektrostatiska fältet
    
    6.4 Rotation hos det magnetostatiska fältet
    
    6.5 Biot–Savarts lag och rotationen hos magnetfältet.
    
    6.6 Kan parallella fältlinjer ge upphov till en rotation?
    
    6.7 Exempel på fält med en homogen rotation
    
    6.8 Kan en ytström ge rotation skild från noll?

7. Konservativa fält

    7.1 Vad är ett konservativt fält?
    
    7.2 Exempel från elektrostatik
    
    7.3 Är magnetfältet konservativt?
    
    7.4 Konservativa fält i elektrodynamik
    
    7.5 Under vilka villkor är ett fält konservativt?

8. Tolkningen av ∇ × (∇φ)

9. Tolkningen av ∇ · (∇ × a)

10. Tolkningen av ∇ × (∇ × a)

    10.1 Tolkning 1: “Cirkulationen av en cirkulation”
    
    10.2 Tolkning 2: Variation i källstyrka samt utjämning i rummet
    
11. Sammanfattning av Föreläsning 0 – Grundläggande vektoranalys inom fältteori

## Compiling the TeX code and figures

In this directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

## List of figures

[`figs/dirac-pulse.mp`](figs/dirac-pulse.mp)
    ([`figs/dirac-pulse.pdf`](figs/dirac-pulse.pdf))
    <i>MetaPost drawing of the Dirac delta function as such, in terms
    of a top-hat function of pulse duration &epsilon; and pulse height
    1/&epsilon;.</i>

[`figs/dirac-00.mp`](figs/dirac-00.mp)
    ([`figs/dirac-00.pdf`](figs/dirac-00.pdf))
    <i>MetaPost drawing of the Dirac delta function applied to the formulation
    of a charge density consisting of (zero-dimensional) point charges.</i>

[`figs/dirac-01.mp`](figs/dirac-01.mp)
    ([`figs/dirac-01.pdf`](figs/dirac-01.pdf))
    <i>MetaPost drawing of the Dirac delta function applied to the formulation
    of a charge density consisting of (one-dimensional) line charges.</i>

[`figs/dirac-02.mp`](figs/dirac-02.mp)
    ([`figs/dirac-02.pdf`](figs/dirac-02.pdf))
    <i>MetaPost drawing of the Dirac delta function applied to the formulation
    of a charge density consisting of (two-dimensional) surface charges.</i>

[`figs/potmap.mp`](figs/potmap.mp)
    ([`figs/potmap.pdf`](figs/potmap.pdf))
    <i>MetaPost drawing of a two-dimensional map of a potential as height
    curves, including arrows locally pointing towards the steepest descent
    in the map. As an analogy to the electric field, as defined in terms of
    a negative gradient of the scalar potential, the arrows are drawn for
    the negative gradient of the height in the map. Besides providing an
    illustration of the gradient operator, this specific figure also provides
    a rather nice example on the vector character of MetaPost drawings as
    such.</i>

[`figs/potcapac.mp`](figs/potcapac.mp)
    ([`figs/potcapac.pdf`](figs/potcapac.pdf))
    <i>MetaPost drawing of a plain parallel-plate capacitor subject to a
    potential difference between the two plates.</i>

[`figs/field-divzero.mp`](figs/field-divzero.mp)
    ([`figs/field-divzero.pdf`](figs/field-divzero.pdf))
    <i>MetaPost drawing of a homogeneous vector field, everywhere
    possessing a zero divergence.</i>

[`figs/field-div-nonzero.mp`](figs/field-div-nonzero.mp)
    ([`figs/field-div-nonzero.pdf`](figs/field-div-nonzero.pdf))
    <i>MetaPost drawing of an inhomogeneous vector field, everywhere
    possessing a non-zero divergence.</i>

[`figs/field-pointcharge.mp`](figs/field-pointcharge.mp)
    ([`figs/field-pointcharge.pdf`](figs/field-pointcharge.pdf))
    <i>MetaPost drawing of a the electric field from a positive point
    charge.</i>

[`figs/field-unicharge.mp`](figs/field-unicharge.mp)
    ([`figs/field-unicharge.pdf`](figs/field-unicharge.pdf))
    <i>MetaPost drawing of a domain with a homogeneous distribution of
    positive charge, leading to the divergence of the static electric
    field to be positive everywhere in the domain. This figure illustrates
    the paradox that even with this in the continuum limit possesses a zero
    field.</i>

[`figs/field-biot.mp`](figs/field-biot.mp)
    ([`figs/field-biot.pdf`](figs/field-biot.pdf))
    <i>MetaPost drawing of the vector field corresponding to the magnetic
    field from Biot--Savarts law for a straight current through origo,
    directed in the positive z-direction. This figure is intended to
    illustrate that the rotation of a field as such can be zero despite
    that the field as such obviously is going circularly around a point.</i>

[`figs/field-rot-parallel.mp`](figs/field-rot-parallel.mp)
    ([`figs/field-rot-parallel.pdf`](figs/field-rot-parallel.pdf))
    <i>MetaPost drawing of an inhomogeneous vector field which gives rise
    to a non-zero rotation everywhere despite that the field lines everywhere
    are parallel.</i>

[`figs/field-unicurrent.mp`](figs/field-unicurrent.mp)
    ([`figs/field-unicurrent.pdf`](figs/field-unicurrent.pdf))
    <i>MetaPost drawing of a domain with a homogeneous distribution of
    current density, leading to the rotation of the static magnetic field
    being positive everywhere in the domain.</i>

## Copyright
Copyright (C) 2026, Fredrik Jonsson, under GPL 3.0.
