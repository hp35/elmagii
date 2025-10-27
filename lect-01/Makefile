#
# Makefile for compilation of Lecture Notes in Electromagnetic Theory,
# Uppsala University, 2025. Code for the lectures written in plain TeX.
# Lectures available at Github: https://github.com/elmagii/
#
# Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
#
TEX    = tex
DVIPS  = dvips
PS2PDF = ps2pdf
TAR    = tar

srcs = $(wildcard *.tex)
dvis = $(patsubst %.tex,%.dvi,$(srcs))
pss  = $(patsubst %.tex,%.ps ,$(srcs))
pdfs = $(patsubst %.tex,%.pdf,$(srcs))

TEXFILE := $(firstword $(wildcard *.tex))
PROJDIR := $(notdir $(CURDIR))
ARCHIVE := $(notdir $(CURDIR)).tar.gz

all: figures $(pdfs)

figures:
	@make -C figs

$(pdfs): $(pss)
	@$(eval BASE = $(shell basename $@ .pdf))
	@echo "Converting PS file $< to PDF (target $@)."
	@$(PS2PDF) $(BASE).ps $(BASE).pdf
	@echo "PDF file for $(BASE).ps written to $(BASE).pdf."

$(pss): $(dvis)
	@$(eval BASE = $(shell basename $@ .ps))
	@echo "Converting DVI file $< to PostScript (target $@)."
	@$(DVIPS) -D1200 -ta4 $(BASE).dvi -o $(BASE).ps
	@echo "PostScript file for $< written to $@."

$(dvis): $(srcs)
	@$(eval BASE = $(shell basename $@ .dvi))
	@echo "Compiling source file $(BASE).tex to DVI (target $(BASE).dvi)."
	@$(TEX) $(BASE).tex
	@$(TEX) $(BASE).tex
	@echo "DVI file for $(BASE).tex written to $(BASE).dvi."

texchars:
	@echo "Converting Swedish Unicode chars in $(TEXFILE) to TeX codes."
	@./macros/se-texchars.sh $(TEXFILE) > tmp.tex
	@mv tmp.tex $(TEXFILE)
	@echo "Reload $(TEXFILE) to incorporate the changes."

archive:
	@make -ik clean
	@echo $(PROJDIR)
	@echo $(ARCHIVE)
	@echo "Creating archive: $(ARCHIVE) of $(PROJDIR)"
	@$(TAR) --exclude="$(ARCHIVE)" -czf $(ARCHIVE) -C .. $(PROJDIR)

clean:
	@make -ik clean -C figs
	@rm -Rf *~ *.aux *.toc *.log *.dvi *.ps $(ARCHIVE)
