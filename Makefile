#
# Makefile for compilation of Lecture Notes in Electromagnetic Theory II,
# Uppsala University, 2022--2026. The code for the lectures is exclusively
# written in plain TeX (no LaTeX).
#
# Copyright (C) 2026 under GPL 3.0, Fredrik Jonsson
#
LECTURES = lect-00 lect-01 lect-02 lect-03 lect-04 lect-05 lect-06 \
		lect-07 lect-08 lect-09 lect-10 lect-11 lect-12
MISC = formulas gallery worldmap compiled
COMPLETE = $(LECTURES) $(MISC)

all:
	for dir in $(COMPLETE) ; do\
	   make -C $$dir ;\
	done

archive:
	make -ik clean
	tar --directory=../ -cf ../elmagii.tar elmagii

clean:
	rm -Rf *~ *.tar *.tar.gz
	for dir in $(COMPLETE) ; do\
	   make -ik clean -C $$dir ;\
	done
