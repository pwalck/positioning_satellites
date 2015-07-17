# Overview

These scripts collect status information about global positioning
satellites from wikipedia tables, and keeps JSON files with
historical data. The idea is to run "make" often, maybe in a cron
job, to catch changes on wikipedia.

The next step will be to create rss/atom-feeds that can be published,
containing the latest interesting changes. Primarily to show when
satellites are launched, become operational and retired. This will
be done by comparing new data for each satellite to determine what
changed, and create a corresponding rss item.

# Installing

This has only been tested on linux, and depends on gnu make, perl
and the "JSON" and "Mojo::DOM" perl modules.

To get this working on a debian based system, it should be enough to:

    sudo apt-get install make libjson-perl libmojolicious-perl

# Running

Just run "make". One directory will be created for each positioning
system, containing one file per satellite with one JSON object per
row. These files will be appended to when changes are detected,
and can be used to determine what happened to which satellite when.
You can run make as often as you want to, the wikipedia pages will
be accessed only once per hour.

The idea is to also create RSS files which publish the changes,
from the satellite JSON files. This is not implemented yet.
