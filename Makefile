.PHONY: all watch clean

all:
	pdflatex paper.tex
	bibtex paper
	pdflatex paper.tex
	pdflatex paper.tex
	make clean
	open -a Skim paper.pdf

watch:
	fswatch -o *.tex images/*.png *.bib Makefile | xargs -n1 -I{} make all

clean:
	rm __latexindent_temp.tex *.aux paper.bbl paper.blg paper.fdb_latexmk paper.fls paper.log paper.out paper.ent paper.synctex.gz || true
