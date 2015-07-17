#!/usr/bin/perl

use JSON;

($system) = @ARGV or die;

open $list, $system .".json";

while (<$list>)
{
  $data = from_json($_);
  delete $data->{fetched};
  
  $name = $data->{Satellite} =~ s/ /_/gr, "\n";
  
  $file = $system ."/". $name .".json";
  
  $last = -f $file ? from_json(`tail -n1 "$file"`) : {};
  delete $last->{fetched};
  
  if (! -f $file or to_json($last, { canonical => 1 }) ne to_json($data, { canonical => 1 }))
  {
    $data->{fetched} = time();
    open my $f, ">>", $file;
    print $f to_json($data, { canonical => 1 }), "\n";
  }
}
