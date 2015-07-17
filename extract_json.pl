#!/usr/bin/perl

use JSON;
use Mojo::DOM;

$d = Mojo::DOM->new(do { local $/; <STDIN> });

$d->find("[style*=\"display:none\"], span.sortkey, a[href^=\"#cite_note\"]")->each(sub { $_->remove });

$d->find("table.sortable")->first(sub { @rows = $_->find("tr")->each;
  @headers = shift(@rows)->children->map("text")->each;
  
  for (@rows)
  {
    @r{@headers} = map { s/ ?\x{a0} ?/ /g; $_ } $_->find("td")->map(sub { $_->all_text })->each;
    print to_json(\%r), "\n";
  }
})
