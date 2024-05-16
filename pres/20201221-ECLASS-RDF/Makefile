IGNORE = prefixes.ttl
TTL    = $(filter-out $(IGNORE), $(wildcard *.ttl))
PNG    = $(patsubst %.ttl, img/%.png, $(TTL))

all : $(PNG) Slides.html index.html

%.puml : %.ttl
	rdfpuml.bat $<

img/%.png : %.puml
	puml.bat -o img $<

index.html : Slides.md
	pandoc Slides.md -o index.html -f markdown+fenced_divs -s

Slides.html : Slides.md
	quarto render $^

%.pdf: %.html
	decktape $^ $@

