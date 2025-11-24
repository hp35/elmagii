# Lecture 10 - Electromagnetic waves in homogeneous and isotropic dielectrics

This directory contains the Lecture Notes for Lecture 10, <i>Vågutbredning i
homogena och isotropa dielektrika</i> (English: <i>Electromagnetic waves in
homogeneous and isotropic dielectrics</i>), including all TeX code (plain TeX,
no LaTeX), MetaPost figures and supporting material.

## Primary files of interest

[lecture-10.tex](lecture-10.tex) - Plain TeX source code for the lecture.

[lecture-10.pdf](lecture-10.pdf) - Compiled document containing the Lecture Notes.

## Summary of the lecture (Swedish)

Maxwells ekvationer och den elektromagnetiska vågekvationen sammanfattas och
vi introducerar fyra tämligen allmänt giltiga approximationer:

1. <b>J</b><sub>f</sub> = 0 (inga fria strömmar),

2. ρ = 0 (inga fria laddningar),

3. <b>P</b> = ε<sub>0</sub> (ε<sub>r</sub> − 1)<b>E</b>
         (linjärt medium med homogent ε<sub>r</sub>(<b>x</b>) = konstant), samt

4. <b>M</b> = 0 (försumbar magnetisering, µ<sub>r</sub> ≈ 1).

Med dessa approximationer omformulerar vi vågekvationerna för det
elektromagnetiska fältet i form av två identiska ekvationer, för det elektriska
fältet <b>E</b> och det magnetiska fältet <b>B</b> respektive, vilka vidare
direkt kan reduceras till en skalär vågekvation som
(∂<sup>2</sup>/∂z<sup>2</sup> − µ<sub>0</sub>ε<sub>0</sub>ε<sub>r</sub>
∂<sup>2</sup>/∂t<sup>2</sup>)<b>E</b>(<i>z</i>, <i>t</i>) = <b>0</b>.
Utifrån denna form identifierar vi att ljushastigheten i vakuum
<i>c</i><sub>0</sub> ges av
<i>c</i><sub>0</sub><sup>−2</sup> = µ<sub>0</sub>ε<sub>0</sub>
samt brytningsindex <i>n</i> = ε<sub>r</sub><sup>1/2</sup>, skalandes
utbredningshastigheten för de elektromagnetiska vågorna som
<i>c</i> = <i>c</i><sub>0</sub>/<i>n</i>.

Med hjälp av d’Alemberts metod tar vi fram den generella lösningen för
vågekvationen och visar på hur denna i en dimension har motpropagerande
komponenter som alltid alltid uppfyller <i>E</i>(<i>z</i>, <i>t</i>)
= <i>f</i>(<i>z</i>−<i>c</i><i>t</i>) + <i>g</i>(<i>z</i>+<i>c</i><i>t</i>).

För tidsharmoniska fält ansätter vi komplexvärda envelopper som
<b>E</b>(<i>x</i>, <i>t</i>) = <b>k</b> Re[<b>E</b><sub><i>k</i></sub>
exp(<i>i</i><b>k</b> · <b>x</b> − <i>i</i>ω(<b>k</b>)<i>t</i>)], med samma
form för det magnetiska fältet, och visar på hur denna planvågsuppdelning
leder till en ortogonal koppling mellan det elektriska och magnetiska fältet
som <b>B</b><sub><i>k</i></sub> = <b>k</b> × <b>E</b><sub><i>k</i></sub>/ω.

## Contents

1. Elektromagnetiska vågekvationen i homogena dielektrika

2. Plana elektromagnetiska fält och d'Alemberts generella lösning
   till vågekvationen

3. Tidsharmoniska fält och planvågsuppdelning

4. Poynting-vektorn

5. Sammanfattning av Föreläsning~10
  - <i>Vågutbredning i homogena och isotropa dielektrika</i>

## Compiling the TeX code and figures

In this directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

## List of figures

[`figs/ebk.mp`](figs/ebk.mp)
    ([`figs/ebk.pdf`](figs/ebk.pdf))
    <i>MetaPost drawing of the right-hand system formed by (E,B,k).</i>

## Copyright
Copyright (C) 2024, Fredrik Jonsson, under GPL 3.0.
