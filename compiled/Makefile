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
	make replace-lecturenumbers
	make replace-figure-paths
	make compile-booksrc
	make compile-book

#	make replace-lecturetitles


#
# Don't split the one-liner sed command below, as sed goes absolutely
# havoc with shell commands interpreted within Makefile blocks.
#
extract-raw-srcddd:
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


extract-raw-srcddfffd:
	@for file in $(LECTURES); do \
	   base=$$(basename $$file .tex); \
	   strip=$${base}-strip.tex; \
	   echo "Processing $$file → $$strip"; \
	   ( \
	      echo "%%% Begin of auto-extracted text from $$file %%%";\
	      sed '/BEGIN OF LOCAL/,/END OF LOCAL/{ /BEGIN OF LOCAL/{ r src/initlecture.tex }; d; }'  $$file | sed 's/\\bye//'; \
	      echo '\\cleardoublepage';\
	      echo "%%% End of auto-extracted text from $$file %%%";\
	   ) > $$strip; \
	done

extract-raw-src:
	@for file in $(LECTURES); do \
	   base=$$(basename $$file .tex); \
	   strip=$${base}-strip.tex; \
	   echo "Processing $$file → $$strip"; \
	   ( \
	      echo "%%% Begin of auto-extracted text from $$file %%%";\
	      sed -e '/BEGIN OF LOCAL MACROS/,/END OF LOCAL MACROS/{/BEGIN OF LOCAL MACROS/b;/END OF LOCAL MACROS/b;d}' "$$file" | sed 's/\\bye//' ; \
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
	   sed '/BEGIN OF LOCAL/r src/initlecture.tex' $$input > $$output ;\
	   mv $$output $$input; \
	   sed 's/\\initlecture//' $$input > $$output ;\
	   mv $$output $$input; \
	done

#
# Extract the values kept by the "\def\lecturenumber{<n>}" definitions, read
# the value into a shell variable and replace all subsequent occurrences by
# this value explicitly in the TeX source. This rather cumbersome approach
# is needed in order to avoid TeX:s refusal to expand any macro definition
# supplied as a parameter to the "\writenumberedtocentry{}{}{}" call, to the
# generation of entries to the Table of Contents (ToC).
#
replace-lecturenumbers:
	@for n in $(LECTNUMS); do \
	    input=lecture-$$n-strip.tex; \
	    output=lecture-$$n-tmp.tex; \
	    lecnum=$$(sed -n 's/^\\def\\lecturenumber{\([^}]*\)}/\1/p' "$$input"); \
	    echo "Replacing \lecturenumber with $$lecnum in $$input"; \
	    sed -n -e '1,/^\\def\\lecturenumber{[^}]*}/ { p; b }; s/\\lecturenumber/'"$$lecnum"'/g; p' "$$input" > "$$output"; \
	    mv "$$output" "$$input"; \
	done

# 	    sed -n -e '1,/^\\def\\lecturenumber{[^}]*}/ { p; b }; s/\\lecturenumber/'"$$lecnum"'/g' "$$input" > "$$output"; \


#
# Extract the values kept by the "\def\lecturetitle{<string>}" definitions, read the <string> into a shell variable and replace all subsequent occurrences by this <string> explicitly in the TeX source. This rather cumbersome approach is needed in order to avoid TeX:s refusal to expand any macro definition supplied as a parameter to the "\writenumberedtocentry{}{}{}" call, to the generation of entries to the Table of Contents (ToC).
#
replace-lecturetitles:
	@for n in $(LECTNUMS); do \
	    input=lecture-$$n-strip.tex; \
	    output=lecture-$$n-tmp.tex; \
	    lectit=$$(sed -n 's/^\\def\\lecturetitle{\([^}]*\)}/\1/p' "$$input"); \
	    echo "Replacing \lecturetitle with $$lectit in $$input"; \
	    sed -e '1,/^\\def\\lecturetitle{[^}]*}/ { p; b }; s/\\lecturetitle/'"$$lectit"'/g' "$$input" > "$$output"; \
	    mv "$$output" "$$input"; \
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
