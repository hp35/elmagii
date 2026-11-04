#
# Makefile for compilation of Lecture Notes in Electromagnetic Theory,
# Uppsala University, 2025. Code for the lectures written in plain TeX.
# Lectures available at Github: https://github.com/hp35/elmagii/
#
# Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
#
TEX    = tex
DVIPS  = dvips
MKIDX  = makeindex
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
	@echo "======= Generating plain document (PDF) ============="
	@echo "Converting plain PS file $< to PDF (target $@)."
	@$(PS2PDF) $(BASE).ps $(BASE).pdf
	@echo "PDF file for $(BASE).ps written to $(BASE).pdf."
	@echo "======= Generating highlighted document (PDF) ======="
	@echo "Converting plain PS file $< to PDF (target $@)."
	@$(PS2PDF) $(BASE)-hl.ps $(BASE)-hl.pdf
	@echo "PDF file for $(BASE)-hl.ps written to $(BASE)-hl.pdf."

$(pss): $(dvis)
	@$(eval BASE = $(shell basename $@ .ps))
	@echo "======= Generating plain document (PS) =============="
	@echo "Converting plain DVI file $< to PostScript (target $@)."
	@$(DVIPS) -D1200 -ta4 $(BASE).dvi -o $(BASE).ps
	@echo "PostScript file for $< written to $@."
	@echo "======= Generating highlighted document (PS) ========"
	@echo "Converting highlighted DVI file $< to PostScript (target $@)."
	@$(DVIPS) -D1200 -ta4 $(BASE)-hl.dvi -o $(BASE)-hl.ps
	@echo "PostScript file for $< written to $@."

$(dvis): $(srcs)
	@$(eval BASE = $(shell basename $@ .dvi))
	@echo "======= Generating plain document (DVI) ============="
	@echo "Compiling source $(BASE).tex to plain DVI (target $(BASE).dvi)."
	@$(TEX) $(BASE).tex
	@$(MKIDX) $(BASE).idx
	@$(TEX) $(BASE).tex
	@echo "DVI file for $(BASE).tex written to $(BASE).dvi."
	@echo "======= Generating highlighted document (DVI) ======="
	@echo "Compiling $(BASE).tex to highlighted DVI ($(BASE)-hl.dvi)."
	@$(TEX) -jobname=$(BASE)-hl '\def\colorsenabled{1}\input $(BASE).tex'
	@$(MKIDX) $(BASE)-hl.idx
	@$(TEX) -jobname=$(BASE)-hl '\def\colorsenabled{1}\input $(BASE).tex'
	@echo "Highlighted DVI file for $(BASE).tex written to $(BASE)-hl.dvi."

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
	@rm -Rf *~ *.aux *.toc *.idx *.ind *.log *.ilg *.dvi *.ps $(ARCHIVE)
