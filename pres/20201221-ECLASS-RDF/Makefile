IGNORE = prefixes.ttl
TTL    = $(filter-out $(IGNORE), $(wildcard *.ttl))
PNG    = $(patsubst %.ttl, img/%.png, $(TTL))

all : $(PNG) Slides.html index.html

%.puml : %.ttl
	rdfpuml.bat $<

img/%.png : %.puml
	plantuml -o img $<

index.html : Slides.md
	pandoc --defaults=pandoc-defaults $^  -o $@

Slides.html : Slides.md
	quarto render $^

%.pdf: %.html
	decktape $^ $@

