#!/bin/sh
# -*- tab-width: 62; -*-

# ./Alexiev-stats.sh

echo "Book (author), thesis, conference proceedings (editor)	" `grep -cEi '@([a-z]*thesis|book|proceedings)'      Alexiev-bibliography.bib`  > ./Alexiev-stats.txt
echo "Tech reports, manuals, deliverables, ontologies	" `grep -cEi '@(manual|techreport)'              Alexiev-bibliography.bib` >> ./Alexiev-stats.txt
echo "Conference papers, journal articles	" `grep -cEi '@(inproceedings|article)'          Alexiev-bibliography.bib` >> ./Alexiev-stats.txt
echo "Presentations, posters, blog posts	" `grep -cEi '@misc'  Alexiev-bibliography.bib` >> ./Alexiev-stats.txt
echo "TOTAL	" `grep -Ei '@[a-z]+' Alexiev-bibliography.bib | grep -vi '@comment' | wc -l` >> ./Alexiev-stats.txt
