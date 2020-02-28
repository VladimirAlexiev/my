#!/bin/sh
# -*- tab-width: 62; -*-

# ./Alexiev-stats.sh > ./Alexiev-stats.txt

echo "Book (author), thesis, conference proceedings (editor)	" `grep -cEi '@(.*thesis|book|proceedings){'      *.bib`
echo "Tech reports, manuals, deliverables, ontologies	" `grep -cEi '@(manual|techreport){'              *.bib` 
echo "Conference papers, journal articles	" `grep -cEi '@(inproceedings|article){'          *.bib`
echo "Presentations, posters, blog posts	" `grep -cEi '{(presentation|poster|blog|gist)}'  *.bib`
echo "TOTAL	" `grep -cEi '@[a-z]+{'                           *.bib`
