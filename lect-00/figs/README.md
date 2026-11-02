# Figures for Lecture No.0 in Electromagnetic Theory II (1TE626)

This repository contains all MetaPost code for the figures used in Lecture 0
(an extra lecture for a recap on vector analysis and the concept of the Dirac
delta function) of the series of lectures on Electromagnetic Theory II (1TE626)
for Engineering Physics (master level) at Uppsala University.

## Compiling the MetaPost figures

Just run `make` and ensure to install any missing components in case there
are any complaints.

## List of figures

[`dirac-pulse.mp`](dirac-pulse.mp)
    ([`dirac-pulse.pdf`](dirac-pulse.pdf))
    <i>MetaPost drawing of the Dirac delta function as such, in terms
    of a top-hat function of pulse duration &epsilon; and pulse height
    1/&epsilon;.</i>

[`dirac-00.mp`](dirac-00.mp)
    ([`dirac-00.pdf`](dirac-00.pdf))
    <i>MetaPost drawing of the Dirac delta function applied to the formulation
    of a charge density consisting of (zero-dimensional) point charges.</i>

[`dirac-01.mp`](dirac-01.mp)
    ([`dirac-01.pdf`](dirac-01.pdf))
    <i>MetaPost drawing of the Dirac delta function applied to the formulation
    of a charge density consisting of (one-dimensional) line charges.</i>

[`dirac-02.mp`](dirac-02.mp)
    ([`dirac-02.pdf`](dirac-02.pdf))
    <i>MetaPost drawing of the Dirac delta function applied to the formulation
    of a charge density consisting of (two-dimensional) surface charges.</i>

[`potmap.mp`](potmap.mp)
    ([`potmap.pdf`](potmap.pdf))
    <i>MetaPost drawing of a two-dimensional map of a potential as height
    curves, including arrows locally pointing towards the steepest descent
    in the map. As an analogy to the electric field, as defined in terms of
    a negative gradient of the scalar potential, the arrows are drawn for
    the negative gradient of the height in the map. Besides providing an
    illustration of the gradient operator, this specific figure also provides
    a rather nice example on the vector character of MetaPost drawings as
    such.</i>

[`potcapac.mp`](potcapac.mp)
    ([`potcapac.pdf`](potcapac.pdf))
    <i>MetaPost drawing of a plain parallel-plate capacitor subject to a
    potential difference between the two plates.</i>

[`field-divzero.mp`](field-divzero.mp)
    ([`field-divzero.pdf`](field-divzero.pdf))
    <i>MetaPost drawing of a homogeneous vector field, everywhere
    possessing a zero divergence.</i>

[`field-div-nonzero.mp`](field-div-nonzero.mp)
    ([`field-div-nonzero.pdf`](field-div-nonzero.pdf))
    <i>MetaPost drawing of an inhomogeneous vector field, everywhere
    possessing a non-zero divergence.</i>

[`field-pointcharge.mp`](field-pointcharge.mp)
    ([`field-pointcharge.pdf`](field-pointcharge.pdf))
    <i>MetaPost drawing of a the electric field from a positive point
    charge.</i>

[`field-unicharge.mp`](field-unicharge.mp)
    ([`field-unicharge.pdf`](field-unicharge.pdf))
    <i>MetaPost drawing of a domain with a homogeneous distribution of
    positive charge, leading to the divergence of the static electric
    field to be positive everywhere in the domain. This figure illustrates
    the paradox that even with this in the continuum limit possesses a zero
    field.</i>

[`field-biot.mp`](field-biot.mp)
    ([`field-biot.pdf`](field-biot.pdf))
    <i>MetaPost drawing of the vector field corresponding to the magnetic
    field from Biot--Savarts law for a straight current through origo,
    directed in the positive z-direction. This figure is intended to
    illustrate that the rotation of a field as such can be zero despite
    that the field as such obviously is going circularly around a point.</i>

[`field-rot-parallel.mp`](field-rot-parallel.mp)
    ([`field-rot-parallel.pdf`](field-rot-parallel.pdf))
    <i>MetaPost drawing of an inhomogeneous vector field which gives rise
    to a non-zero rotation everywhere despite that the field lines everywhere
    are parallel.</i>

[`field-unicurrent.mp`](field-unicurrent.mp)
    ([`field-unicurrent.pdf`](field-unicurrent.pdf))
    <i>MetaPost drawing of a domain with a homogeneous distribution of
    current density, leading to the rotation of the static magnetic field
    being positive everywhere in the domain.</i>

## Copyright
Copyright (C) 2026, Fredrik Jonsson, under GPL 3.0.
