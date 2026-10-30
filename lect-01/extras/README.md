# Examination Problem 1 - The electromagnetic wave equation

This directory contains the source for <em>Examination Problem 1 - The
electromagnetic wave equation</em>, given in the course on Electromagnetic
Theory II (1TE626) for Engineering Physics (master level) at Uppsala University.
This problem is always the first problem in the examination after the course.

## Primary files of interest

[examprob.tex](examprob.tex) - Plain TeX source code for the exam problem.

[examprob.pdf](examprob.pdf) - Compiled document containing the exam problem.

## Summary

Now this may seem very odd, handing out the first problem well in advance of
the examination, right?
The reason why this specific problem is handed out as a completely open
examination problem during the first lecture in the series is that while most
of the exam problems out of necessity need to be kept rather short and concise
in format, most of the principles of electromagnetism we deal with in the
course are actually present in one of the central items in electromagnetic
theory, namely <em>the electromagnetic wave equation</em>.

Frankly, it is very seldom in our careers that we have such a beautiful
opportunity to once and for all derive this wave equation, which in form
is identical for the electric and magnetic fields, with the only difference
being that a time derivative appear for the source term of the wave equation
for the electric field, while it for the magnetic field instead is replaced
by a rotation.
To include such a problem in a regular examination for sure wouldn't be fair,
but as it is such a central and beautiful derivation, this problem has since
2025 been a completely open problem which the students over the course can
learn in detail. The good thing is that everyone knows that "this will be
in the exam", and that everyone will have a good opportunity to study the
details without stress with plenty of time before the exam.

Now there are two ways of studying for this specific problem:

1. Learning the ways that Faraday's, Ampère's and Gauss' laws act together,
   gaining the full physical understanding how these together with the constitutive relations combine into the general form of the wave equations for the electric and magnetic fields, with the final result as a grand statement on the duality between the electric and magnetic field in electromagnetic wave propagation, OR

2. Simply <em>cramming the derivation into your brain</em>.

In the author's point-of-view, it doesn't really matter which method you choose, since the latter in any case will force you into a certain level of understanding of what is going on "under the hood".

## Compiling the TeX code and figures

In this directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

## Copyright
Copyright (C) 2025, Fredrik Jonsson, under GPL 3.0.
