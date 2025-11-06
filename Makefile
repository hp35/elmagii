#
# Makefile for compilation of Lecture Notes in Electromagnetic Theory II,
# Uppsala University, 2022--2025. The code for the lectures is exclusively
# written in plain TeX (no LaTeX).
#
# Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
#
LECTURES = lect-01 lect-02 lect-03 lect-04 lect-05 lect-06 \
		lect-07 lect-08 lect-09 lect-10 lect-11

all:
	for lecture in $(LECTURES) ; do\
	   make -C $$lecture ;\
	done

archive:
	make -ik clean
	tar --directory=../ -cf ../elmagii.tar elmagii

clean:
	rm -Rf *~ *.tar *.tar.gz
	for lecture in $(LECTURES) ; do\
	   make -ik clean -C $$lecture ;\
	done
