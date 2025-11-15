# Lecture 5 - Electromagnetic induction

This directory contains the Lecture Notes for Lecture 5, <i>Elektromagnetisk
induktion</i> (English: <i>Electromagnetic induction</i>), including all TeX
code (plain TeX, no LaTeX), MetaPost figures and supporting material.

## Primary files of interest

[lecture-05.tex](lecture-05.tex) - Plain TeX source code for the lecture.

[lecture-05.pdf](lecture-05.pdf) - Compiled document containing the Lecture Notes.

## Summary of the lecture (Swedish)

Ämnet för föreläsningen beskrivs kort och koncist med Michael Faradays egna
ord (1831), fritt tolkade som “Ett varierande magnetfält inducerar ett
elektriskt fält”. Vi går igenom definitionerna av magnetiskt flöde Φ<sub>M</sub>
och det historiskt betingade begreppet elektromotorisk “kraft”.

Vi härleder Faradays induktionslag <i>E</i> = −dΦ<sub>M</sub>/dt i två separata
och inbördes sammanhållna fall. Det första fallet introduceras för sin enkelhet
och intuitivt greppbara geometri, där vi studerar en rektangulär strömslinga
som förs genom ett inhomogent magnetiskt fält och kommer fram till formen på
Faradays induktionslag. Det andra fallet är en formell härledning av Faradays
induktionslag för en godtycklig rörligt geometri i form av en slinga med
godtycklig hastighet längs med sin trajektoria, samt med ett godtyckligt
varierande magnetfält.

Vi noterar att Faradays induktionslag härleds enbart utifrån Lorentz kraftlag
och ej involverande vare sig Coulombs eller Biot–Savarts lag eller nåot av
deras derivat i det elektromagnetiska “släktträdet”; i och med detta har vi i
Faradays induktionslag avsaknad av såväl den elektriska permittiviteten
ε<sub>0</sub> som den magnetiska permeabiliteten µ<sub>0</sub>.
Utifrån Faradays induktionslag formulerar vi Lenz lag som slutsatsen att en
inducerad ström alltid har en riktning som motverkar orsaken till att den
uppkom, och vi går utifrån denna princip igenom en samling med tankeexperiment
med bäring på tolkning av elektromagnetisk induktion.

Med utgångspunkt i Faradays induktionslag härleder vi Faradays lag
∇×<b>E</b> = −∂<b>B</b>/∂t, eller “Maxwell–Faradays lag”, på differential-
och integralform.

Vi avslutar med att gå igenom hur två strömbärande slingor påverkar varandra
genom ömsesidig induktion, och vi härleder Neumanns formel för den ömsesidiga
induktansen. Specifikt går vi igenom tolkningen av Neumanns formel i form av
reciprocitet mellan två slingor, där vi har det smått förbluffande resultatet
att det magnetiska flöde som uppfångas av en slinga från en ström i den andra
slingan exakt motsvaras av det magnetiska flöde som den andra slingan skulle
uppfånga om istället den första slingan drevs med exakt samma ström.

## Contents

1. Introduktion - Faradays induktionslag

2. Grundläggande begrepp inför Faradays induktionslag

    2.1. Definition: Magnetiskt flöde

    2.2. Magnetisk flödestäthet och lite terminologi

    2.3. Definition: Elektromotorisk "kraft" - EMK

3. Faradays induktionslag härledd för en rektangulär
  slinga med konstant hastighet

    3.1. Observation I kring Faradays induktionslag
         - Avsaknad av permittivitet och permebilitet

    3.2. Observation II kring Faradays induktionslag
         - Fysisk vs virtuell slinga

    3.3. Observation III kring Faradays induktionslag
         - Negativt tecken och Lenz lag

4. Lenz lag som rimlighetsbedömning av lösningar till induktionsproblem

5. Generell härledning av Faradays induktionslag

6. Faradays induktionslag för stationära slingor

7. Spolar och utväxling på det magnetiska flödet

8. Faradays lag på differentialform

9. Faradays lag på integralform

10. Tre principiella specialfall för induktion

11. Ömsesidig induktans

12. Neumanns formel för den ömsesidiga induktansen

    12.1. Ett par observationer kring Neumanns formel

13. Kontinuitetsekvationen - Teaser inför Maxwell's ekvationer

14. Sammanfattning av Föreläsning 5 - Elektromagnetisk induktion

## Compiling the TeX code and figures

In this directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

## List of figures

[`figs/faradayelement.mp`](figsfaradayelement.mp)
    ([`figs/faradayelement.pdf`](figsfaradayelement.pdf))
    <i>MetaPost drawing of the enlarged area element dA, being part of the
    "ribbon" between the closed trajectory Gamma(t) and Gamma(t+dt) in the
    formal and general derivation of Faradays law of induction (the "flux
    law"). This figure is part of the figure drawn by the MetaPost code in
    faradayrib.mp.</i>

[`figs/faradayrect.mp`](figsfaradayrect.mp)
    ([`figs/faradayrect.pdf`](figsfaradayrect.pdf))
    <i>MetaPost drawing of the setup of a closed, rectangular current-carrying
    loop dragged over a homogeneous field in such a way that the magnetic flux
    through the loop is linearly decreasing with time. This is the simplest
    illustration of the Faraday induction law, based directly on the Lorentz
    force acting upon the charges in the conducting wire, and serves as an
    illustration of the general case.</i>

[`figs/faradayrib.mp`](figsfaradayrib.mp)
    ([`figs/faradayrib.pdf`](figsfaradayrib.pdf))
    <i>MetaPost drawing of the setup of a closed current-carrying loop and
    the electro-motoric force (EMF) driving a current through this whenever
    the magnetic flow enclosed by the loop is altered, either by means of a
    magnetic field which is changing in time or by means of a change in the
    orientation or position of the loop itself. This is the basic setup in
    which we derive Faraday's law of induction.</i>

[`figs/inductance.mp`](figsinductance.mp)
    ([`figs/inductance.mp.pdf`](figsinductance.mp.pdf))
    <i>MetaPost drawing of the geometry used in deriving the mutual
    inductance between two conducting loops Gamma and Gamma'.</i>

[`figs/inductioncases.mp`](figsinductioncases.mp)
    ([`figs/inductioncases.pdf`](figsinductioncases.pdf))
    <i>MetaPost drawing of the three principal ways of inducing an
    electromotoric force (EMF) be the Faraday law of induction
    (flux law), being
    (1) a closed circuit moving through a stationary inhomogeneous
        magnetic field,
    (2) a stationary closed circuit through which an inhomogeneous
        magnetic field is moving, and
    (3) a stationary closed circuit through which a the magnetic
        flux is varying in time.</i>

[`figs/lenz.mp`](figslenz.mp)
    ([`figs/lenz.pdf`](figslenz.pdf))
    <i>MetaPost drawing of a set of eight geometries and thought-experients
    concerning the interpretation of Lenz law and how to sanity-check results
    in induction problems.</i>

[`figs/magflow.mp`](figsmagflow.mp)
    ([`figs/magflow.pdf`](figsmagflow.pdf))
    <i>MetaPost drawing of electric flow through a surface, including a
    displayed equation with the definition of electric flow.</i>

## Copyright
Copyright (C) 2025, Fredrik Jonsson, under GPL 3.0.
