#
# Makefile for compilation of a single PDF of the entire series of
# Lecture Notes in Electromagnetic Theory II, Uppsala University,
# 2022--2025.
#
# Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
#
PROJECT = elmagiibook

LECTNUMS := $(shell printf "%02d " $$(seq 1 11))
LECTURES := $(foreach n,$(LECTNUMS),../lect-$(n)/lecture-$(n).tex)
STRIPPED := $(notdir $(LECTURES:.tex=-strip.tex))

all: extract-raw-src

extract-raw-src:
	@for file in $(LECTURES); do \
		base=$$(basename $$file .tex); \
		out=$${base}-strip.tex; \
		echo "Processing $$file → $$out"; \
		( \
			echo "%%% Begin of auto-extracted text from $$file %%%";\
			sed -n '/\\lecture{[0-9][0-9]*}/,/\\bye/ { /\\bye/!p }'\
				$$file; \
			echo "%%% End of auto-extracted text from $$file %%%";\
		) > $$out; \
	done

recompile:
	for lecture in $(LECTURES) ; do\
	   make -C ../$$lecture ;\
	done

book:
	for lecture in $(LECTURES) ; do\
	   make -C ../$$lecture ;\
	done

clean:
	rm -Rf *~ *-strip.tex
