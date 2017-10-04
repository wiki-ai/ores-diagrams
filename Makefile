TEX_SOURCES = $(wildcard *.tex)
PDF_FILES := $(TEX_SOURCES:.tex=.pdf)
SVG_FILES := $(TEX_SOURCES:.tex=.svg)

.PHONY: all pdf svg

all: pdf svg

pdf: $(PDF_FILES)
svg: $(SVG_FILES)


%.pdf: %.tex
	latexmk -pdf $<

%.dvi: %.tex
	latexmk -dvi $<

%.svg: %.dvi
	dvisvgm --no-fonts $<
