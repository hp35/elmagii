#
# Makefile for compilation of a single PDF of the entire series of
# Lecture Notes in Electromagnetic Theory II, Uppsala University,
# 2022--2025.
#
# Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
#
PROJECT = complete
TEX    = tex
DVIPS  = dvips
PS2PDF = ps2pdf

LECTNUMS := $(shell printf "%02d " $$(seq 1 11))
LECTURES := $(foreach n,$(LECTNUMS),../lect-$(n)/lecture-$(n).tex)
STRIPPED := $(notdir $(LECTURES:.tex=-strip.tex))

all:
	make clean
	make extract-raw-src
	make replace-initlecture-calls
	make replace-figure-paths
	make compile-booksrc
	make compile-book


#
# Don't split the one-liner sed command below, as sed goes absolutely
# havoc with shell commands interpreted within Makefile blocks.
#
extract-raw-src:
	@for file in $(LECTURES); do \
	    base=$$(basename $$file .tex); \
	    strip=$${base}-strip.tex; \
	    echo "Processing $$file → $$strip"; \
	    ( \
	        echo "%%% Begin of auto-extracted text from $$file %%%"; \
	        sed '/BEGIN OF LOCAL/,/END OF LOCAL/ d' $$file | sed 's/\\bye//'; \
	        echo '\\cleardoublepage'; \
	        echo "%%% End of auto-extracted text from $$file %%%"; \
	    ) > "$$strip"; \
	done


#extract-raw-src:
#	@for file in $(LECTURES); do \
#	   base=$$(basename $$file .tex); \
#	   strip=$${base}-strip.tex; \
#	   echo "Processing $$file → $$strip"; \
#	   ( \
#	      echo "%%% Begin of auto-extracted text from $$file %%%";\
#		sed '/BEGIN OF LOCAL/,/END OF LOCAL/{ \
#		/BEGIN OF LOCAL/{ r src/initlecture.tex \
#		}; d; }'  $$file | sed 's/\\bye//'; \
#	      echo '\\cleardoublepage';\
#	      echo "%%% End of auto-extracted text from $$file %%%";\
#	   ) > $$strip; \
#	done

extract-raw-srcccc:
	@for file in $(LECTURES); do \
	   base=$$(basename $$file .tex); \
	   strip=$${base}-strip.tex; \
	   echo "Processing $$file → $$strip"; \
	   ( \
	      echo "%%% Begin of auto-extracted text from $$file %%%";\
	      sed '/BEGIN OF LOCAL/,/END OF LOCAL/d' $$file \
	         | sed 's/\\bye//'; \
	      echo '\\cleardoublepage';\
	      echo "%%% End of auto-extracted text from $$file %%%";\
	   ) > $$strip; \
	done

extract-raw-srcsss:
	@for file in $(LECTURES); do \
	   base=$$(basename $$file .tex); \
	   strip=$${base}-strip.tex; \
	   echo "Processing $$file → $$strip"; \
	   ( \
	      echo "%%% Begin of auto-extracted text from $$file %%%";\
	      sed '/BEGIN OF LOCAL/,/END OF LOCAL/{\
	         /BEGIN OF LOCAL/{\
	            r src/initlecture.tex\
	         } d \
	      }' $$file \
	         | sed 's/\\bye//'; \
	      echo '\\cleardoublepage';\
	      echo "%%% End of auto-extracted text from $$file %%%";\
	   ) > $$strip; \
	done

replace-initlecture-calls:
	@for n in $(LECTNUMS); do \
	   input=lecture-$$n-strip.tex; \
	   output=lecture-$$n-tmp.tex; \
	   echo "Replacing \\initlecture calls in $$input → $$output"; \
	   sed 's|\\initlecture|\\initlecture{\\coursename}{\\coursecode}{\\courseyear}{\\courserepo}{\\lecturenumber}{\\lecturetitle}{\\lecturetitlesub}{\\lectureauthor}{\\lectureplace}|g' \
	      $$input > $$output ;\
	   mv $$output $$input; \
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
	cp src/frontmatter.tex $(PROJECT).tex
	@for n in $(LECTNUMS); do \
		cat lecture-$$n-strip.tex >> $(PROJECT).tex; \
	done
	@echo '\\bye' >> $(PROJECT).tex

compile-book:
	$(TEX) $(PROJECT).tex
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
	rm -Rf *~ lect*.tex *.log *.dvi *.ps complete.*
