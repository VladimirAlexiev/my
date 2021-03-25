#!/bin/sh
# -*- tab-width: 62; -*-

# ./Alexiev-stats.sh

echo "Book (author), thesis, conference proceedings (editor)	" `grep -cEi '@(.*thesis|book|proceedings){'      *.bib`  > ./Alexiev-stats.txt
echo "Tech reports, manuals, deliverables, ontologies	" `grep -cEi '@(manual|techreport){'              *.bib` >> ./Alexiev-stats.txt
echo "Conference papers, journal articles	" `grep -cEi '@(inproceedings|article){'          *.bib` >> ./Alexiev-stats.txt
echo "Presentations, posters, blog posts	" `grep -cEi '{(presentation|poster|blog|gist)}'  *.bib` >> ./Alexiev-stats.txt
echo "TOTAL	" `grep -cEi '@[a-z]+{'                           *.bib` >> ./Alexiev-stats.txt
