#
# Makefile for compilation of a single PDF of the entire series of
# Lecture Notes in Electromagnetic Theory II, Uppsala University,
# 2022--2025.
#
# Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
#
PROJECT = elmagiibook
TEX    = tex
DVIPS  = dvips
PS2PDF = ps2pdf

LECTNUMS := $(shell printf "%02d " $$(seq 1 11))
LECTURES := $(foreach n,$(LECTNUMS),../lect-$(n)/lecture-$(n).tex)
STRIPPED := $(notdir $(LECTURES:.tex=-strip.tex))

all:
	make clean
	make extract-raw-src
	make replace-figure-paths
	make compile-booksrc
	make compile-book

extract-raw-src:
	@for file in $(LECTURES); do \
		base=$$(basename $$file .tex); \
		strip=$${base}-strip.tex; \
		echo "Processing $$file → $$strip"; \
		( \
			echo "%%% Begin of auto-extracted text from $$file %%%";\
			sed -n '/\\lecture{[0-9][0-9]*}/,/\\bye/ { /\\bye/!p }'\
				$$file; \
			echo '\\cleardoublepage';\
			echo "%%% End of auto-extracted text from $$file %%%";\
		) > $$strip; \
	done

replace-figure-paths:
	@for n in $(LECTNUMS); do \
		input=lecture-$$n-strip.tex; \
		output=lecture-$$n-tmp.tex; \
		echo "Replacing figure paths in $$input → $$output"; \
		sed 's|\\epsfig{|\\epsfig{../lect-'$$n'/|g'\
			$$input > $$output ;\
		mv $$output $$input; \
		sed 's|\\epsfbox{potentials/|\\epsfbox{../lect-'$$n'/potentials/|g'\
			$$input > $$output ;\
		mv $$output $$input; \
		sed 's|\\epsfbox{multipoles/|\\epsfbox{../lect-'$$n'/multipoles/|g'\
			$$input > $$output ;\
		mv $$output $$input; \
	done

compile-booksrc:
	cp src/book.tex $(PROJECT).tex
	@for n in $(LECTNUMS); do \
		cat lecture-$$n-strip.tex >> $(PROJECT).tex; \
	done
	@echo '\\bye' >> $(PROJECT).tex

compile-book:
	$(TEX) $(PROJECT).tex
	@echo "DVI file for $(PROJECT).tex written to $(PROJECT).dvi."
	$(DVIPS) -D1200 -ta4 $(PROJECT).dvi -o $(PROJECT).ps
	@echo "PostScript file for $(PROJECT).dvi written to $(PROJECT).ps."
	@$(PS2PDF) $(PROJECT).ps $(PROJECT).pdf
	@echo "PDF file for $(PROJECT).ps written to $(PROJECT).pdf."

recompile:
	for lecture in $(LECTURES) ; do\
	   make -C ../$$lecture ;\
	done

book:
	for lecture in $(LECTURES) ; do\
	   make -C ../$$lecture ;\
	done

clean:
	rm -Rf *~ *.tex *.log *.dvi *.ps
