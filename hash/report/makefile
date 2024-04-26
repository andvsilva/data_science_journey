############################################
# Makefile for thesis
############################################

all:
	pdflatex -shell-escape main
	bibtex main
	pdflatex -shell-escape main
	pdflatex -shell-escape main
	date

clean:
	rm -rf *.gz *.bbl *.bcf *.aux *.log *.blg *.out main.pdf *~