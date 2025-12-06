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
	make replace-lecturesubtitles
	make replace-lecturetitles
	make replace-figure-paths
	make insert-copyright-pages
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
	      echo "%%% Begin of auto-extracted text from $$file %%%";\
	      sed -e '/BEGIN OF LOCAL MACROS/,/END OF LOCAL MACROS/{/BEGIN OF LOCAL MACROS/b;/END OF LOCAL MACROS/b;d}' "$$file" | sed 's/\\bye//' ; \
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

replace-lecturesubtitles:
	@for n in $(LECTNUMS); do \
	   input=lecture-$$n-strip.tex; \
	   output=lecture-$$n-tmp.tex; \
	   echo "Replacing \\lecturetitlesub with \\lecturesubtitle in $$input → $$output"; \
	   sed 's/\\lecturetitlesub/\\lecturesubtitle/g' $$input > $$output; \
	   mv $$output $$input; \
	done

#
# Extract the values kept by the "\def\lecturetitle{<string>}" definitions, read
# the <string> into a shell variable and replace all subsequent occurrences by
# this <string> explicitly in the TeX source. This rather cumbersome approach is
# needed in order to avoid TeX:s refusal to expand any macro definition supplied
# as a parameter to the "\writenumberedtocentry{}{}{}" call, to the generation
# of entries to the Table of Contents (ToC).
#
# Main steps in this title expansion:
#    1. Replace any occurrence of "{\aa}", "{\"a}" "{\"o}", etc. by the
#       corresponding characters "å", "ä", "ö", just to avoid capturing
#       matched braces in titles. (The Perl script alternative turned
#       out to be a real mess.)
#    2. Extract the value of \lecturetitle{<string>}
#    3. Escape backslashes, &, and slashes for sed replacement
#    4. Enclose in braces for replacement
#    5. sed: print lines up to the definition, then replace subsequent
#       \lecturetitle occurrences
#    6. Replace back any occurrence of "å", "ä", "ö" to their TeX-code
#    equivalents "{\aa}", "{\"a}" "{\"o}", etc.
#
replace-lecturetitles:
	@for n in $(LECTNUMS); do \
	   input=lecture-$$n-strip.tex; \
	   output=lecture-$$n-tmp.tex; \
	   sed \
	       -e 's/{\\aa}/å/g' \
	       -e 's/{\\"a}/ä/g' \
	       -e 's/{\\"o}/ö/g' \
	       -e 's/{\\AA}/Å/g' \
	       -e 's/{\\"A}/Ä/g' \
	       -e 's/{\\"O}/Ö/g' \
	    "$$input" > "$$output"; \
	    mv "$$output" "$$input"; \
	    lectit=$$(sed -n 's/^\\def\\lecturetitle{\([^}]*\)}/\1/p' "$$input"); \
	    safe_lectit=$$(printf '%s\n' "$$lectit" | sed -e 's/[&\\/]/\\&/g'); \
	    safe_lectit_braced="{$$safe_lectit}"; \
	    echo "Replacing \\lecturetitle with $$safe_lectit_braced in $$input"; \
	    sed -n -e '1,/^\\def\\lecturetitle{[^}]*}/ { p; b }; s/\\lecturetitle/'"$$safe_lectit_braced"'/g; p' "$$input" > "$$output"; \
	    mv "$$output" "$$input"; \
	   sed \
	       -e 's/å/{\\aa}/g' \
	       -e 's/ä/{\\"a}/g' \
	       -e 's/ö/{\\"o}/g' \
	       -e 's/Å/{\\AA}/g' \
	       -e 's/Ä/{\\"A}/g' \
	       -e 's/Ö/{\\"O}/g' \
	       "$$input" > "$$output"; \
	   mv "$$output" "$$input"; \
	done

#
# Correct all paths to illustrations to the respective lecture directory.
#
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

#
# Insert copyright pages after the preamble page of every single lecture.
#
insert-copyright-pages:
	@for n in $(LECTNUMS); do \
	   input=lecture-$$n-strip.tex; \
	   output=lecture-$$n-tmp.tex; \
	   echo "Inserting copyright pages in $$input → $$output"; \
	   sed '/END OF PREAMBLE/{a \\$$\\\\copyrightpage;q}' $$input > $$output ;\
	   mv $$output $$input; \
	done



#
# Initialize the project by copying the frontmatter, index definitions etc.,
# to an empty skeleton which we soon will fill and stream-edit to the complete
# TeX source for all lectures in a single document.
#
compile-booksrc:
	cp src/frontmatter.tex $(PROJECT).tex
	@for n in $(LECTNUMS); do \
		cat lecture-$$n-strip.tex >> $(PROJECT).tex; \
	done
	@echo '\\bye' >> $(PROJECT).tex

#
# Compile the entire project (plain TeX) as extracted by the steps above.
#
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
