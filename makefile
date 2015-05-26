LATEX = platex
DVIPDF = dvipdfmx

TEXFILE = $(shell ls *.tex)
DVIFILE = $(TEXFILE:%.tex=%.dvi)
PDFFILE = $(TEXFILE:%.tex=%.pdf)
LOGFILE = $(TEXFILE:%.tex=%.log)
AUXFILE = $(TEXFILE:%.tex=%.aux)


%.dvi: %.tex
	echo $<
	$(LATEX) $<
	$(LATEX) $<

%.pdf: %.dvi
	$(DVIPDF) $<

.PHONY: pdf
pdf: $(PDFFILE)

.PHONY: all
all:
	echo $(DVIFILE)
	make $(DVIFILE)

.PHONY: clean
clean:
	rm -f $(DVIFILE) $(PDFFILE) $(LOGFILE) $(AUXFILE)

