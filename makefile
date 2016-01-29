fname=root
${fname}.pdf: ${fname}.tex \
	fslr_chapter/fslr_chapter.tex \
	fslr_chapter/fslr_chapter.bib \
	acknowledgments/acknowledgments.tex \
	stroke_chapter/stroke_chapter.Rnw \
	stroke_chapter/stroke_chapter.tex \
	stroke_chapter/stroke_chapter.bib \
	intro_chapter/intro_chapter.tex \
	intro_chapter/intro_chapter.bib \
	conclusion_chapter/conclusion_chapter.tex \
	conclusion_chapter/conclusion_chapter.bib \
	ich_chapter/ich_chapter.bib \
	ich_chapter/ich_chapter.Rnw 
	if [ -e ${fname}.aux ]; \
	then \
	rm ${fname}.aux; \
	fi;
	# Rscript -e "library(knitr); knit('R_packages.Rnw')"
	# Rscript convert_bibtex.R
	cd stroke_chapter/ \
	make clean && make;
	cd ich_chapter/ \
	make clean && make;	
	cd ss_chapter/ \
	make clean && make;
	pdflatex ${fname}
	bibtex ${fname}
	bibtex ${fname}1-blx
	bibtex ${fname}2-blx
	bibtex ${fname}3-blx
	bibtex ${fname}4-blx
	bibtex ${fname}5-blx
	bibtex ${fname}6-blx
	pdflatex ${fname}
	pdflatex ${fname}
	cp ${fname}.pdf PhD_Thesis.pdf
	open PhD_Thesis.pdf
clean:
	if [ -e ${fname}.pdf ]; \
	then \
	rm ${fname}.pdf; \
	fi;		
open:
	open ${fname}.pdf
edit:
	open ${fname}.tex