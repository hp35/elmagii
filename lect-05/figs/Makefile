#
# Makefile for compilation of figures written in MetaPost.
#
# Copyright (C) 2024 under GPL 3.0, Fredrik Jonsson
#
SHELL    = /bin/sh
METAPOST = mpost
TEX      = tex
DVIPS    = dvips
PS2PDF   = ps2pdf
PDFCROP  = pdfcrop
PDF2SVG  = pdf2svg

srcs = $(wildcard *.mp)
dvis = $(patsubst %.mp,%.dvi,$(srcs))
epss = $(patsubst %.dvi,%.eps,$(dvis))
pdfs = $(patsubst %.eps,%.pdf,$(epss))
svgs = $(patsubst %.pdf,%.svg,$(pdfs))

all: $(svgs)

$(svgs): $(pdfs)
	$(eval BASE = $(shell basename $@ .svg))
	@echo "Converting PDF file $< to SVG (target $@)."
	$(PDFCROP) $(BASE).pdf $(BASE)-crop.pdf
	$(PDF2SVG) $(BASE)-crop.pdf $(BASE).svg
	@echo "SVG file for $(BASE).pdf written to $(BASE).svg."

$(pdfs): $(epss)
	$(eval BASE = $(shell basename $@ .pdf))
	@echo "Converting EPS file $< to PDF (target $@)."
	$(PS2PDF) $(BASE).eps $(BASE).pdf
	@echo "PDF file for $(BASE).eps written to $(BASE).pdf."

$(epss): $(dvis)
	$(eval BASE = $(shell basename $@ .eps))
	@echo "Converting DVI file $< to EPS (target $@)."
	$(DVIPS) -D1200 -E $(BASE).dvi -o $(BASE).eps
	@echo "EPS file for $< written to $@."

$(dvis): $(srcs)
	$(eval BASE = $(shell basename $@ .dvi))
	@echo "Compiling source file $(BASE).mp to DVI (target $(BASE).dvi)."
	$(METAPOST) $(BASE).mp
	$(TEX) -jobname=$(BASE) \
		"\input epsf.tex \nopagenumbers\
			\centerline{\epsfbox{"$(BASE)".1}}\bye"
	@echo "DVI file for $(BASE).mp written to $(BASE).dvi."

clean:
	-rm -Rf *~ *.log *.dvi *.1 *.tex *.mpx *.eps *-crop.pdf
