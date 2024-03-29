all: presentation.html presentation.pdf paper.pdf

presentation.html: presentation.qmd
	quarto render $^ --to revealjs

presentation.pdf: presentation.html
	decktape $^ $@

paper.pdf: presentation.qmd
	quarto render $^ --to pdf --output $@
