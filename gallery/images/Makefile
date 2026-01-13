#
# Makefile for compilation of a gallery of images of the physicists who
# laid the foundation of the electromagnetics as treated in the Lecture
# Notes in Electromagnetic Theory II, Uppsala University, 2022--2025.
#
# Copyright (C) 2026 under GPL 3.0, Fredrik Jonsson
#

#
# Conversion of JPG and PNG images to greyscale EPS.
#
PNG_IMAGES := $(wildcard *.png)
JPG_IMAGES := $(wildcard *.jpg)

#
# Extract base names without their extension.
#
PNG_BASE := $(basename $(PNG_IMAGES))
JPG_BASE := $(basename $(JPG_IMAGES))
BASES := $(PNG_BASE) $(JPG_BASE)

#
# Construct the target names.
#
SCALED := $(BASES:%=%_scaled.png)
EPS    := $(BASES:%=%_scaled.eps)
BW_EPS := $(BASES:%=%_scaled_bw.eps)

all: $(SCALED) $(EPS) $(BW_EPS)

#
# Scale all images to 256px width (PNG as well as JPG output)
#
%_scaled.png: %.png
	convert "$<" -resize 256x "$@"

%_scaled.png: %.jpg
	convert "$<" -resize 256x "$@"

#
# Generate general scaled Encapsulated PostScript.
#
%_scaled.eps: %_scaled.png
	convert "$<" "$@"

#
# Generate greyscale scaled Encapsulated PostScript.
#
%_scaled_bw.eps: %_scaled.png
	convert -colorspace Gray "$<" "$@"

clean:
	rm -f *~ *_scaled.png *_scaled.eps
