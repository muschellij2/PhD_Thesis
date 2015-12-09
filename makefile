fname=root
${fname}.pdf: ${fname}.tex \
	fslr_chapter/fslr_chapter.tex \
	fslr_chapter/fslr_chapter.bib 
	if [ -e ${fname}.aux ]; \
	then \
	rm ${fname}.aux; \
	fi;
	# Rscript -e "library(knitr); knit('R_packages.Rnw')"
	# Rscript convert_bibtex.R
	pdflatex ${fname}
	bibtex ${fname}
	bibtex ${fname}1-blx
	bibtex ${fname}2-blx
	if [ -e ${fname}3-blx.bbl ]; \
	then \
		bibtex ${fname}3-blx; \
	fi;	
	pdflatex ${fname}
	pdflatex ${fname}
	cp ${fname}.pdf PhD_Thesis.pdf
	open PhD_Thesis.pdf
clean:
	rm ${fname}.pdf
open:
	open ${fname}.pdf
edit:
	open ${fname}.tex