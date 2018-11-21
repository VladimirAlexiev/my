#!perl -wn

# perl Alexiev-check.pl Alexiev-bibliography.bib | sort > Alexiev-brokenLinks.txt

use strict;
use LWP;
our $browser;
BEGIN {
  $browser = LWP::UserAgent-> new (agent =>
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36");
  # else https://dl.acm.org/citation.cfm?id=212113 returns 403
}

m{url\w*\s*=\s*\{(.*?)\}} or next;
my $url = $1;
my $resp = $browser->head($url);
my $len = $resp->header("Content-Length");
  # rawgit2 returns 5 for the word 'error' when there's no such link
  # The big publishers don't bother to return this header?
  # - http://www.computer.org/csdl/proceedings/icmew/2015/7079/00/07169818.pdf
  # - https://link.springer.com/chapter/10.1007/978-3-319-59268-8_9

!$resp->is_success and do
  {print "$url ",$resp->status_line,"\n"; next};
$len && $len == 5 &&  $url =~ m{http://rawgit2} and do
  {print "$url rawgit2 'error'\n"; next};
$len && $len <= 10 and do
  {print "$url $len is too short\n"; next};
print "OK $url\n";
