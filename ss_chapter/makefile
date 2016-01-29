stub=ss_chapter
${stub}.pdf: ${stub}.Rnw
	if [ -e ${stub}.aux ]; \
	then \
	rm ${stub}.aux; \
	fi;	
	Rscript -e "library(knitr); knit('${stub}.Rnw')";

clean: 
	if [ -e ${stub}.tex ]; \
	then \
	rm ${stub}.tex; \
	fi;	

open: 
	open ${stub}.tex
