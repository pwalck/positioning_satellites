# Overview

These scripts collect status information about global positioning
satellites from wikipedia tables, and keeps JSON files with
historical data. The idea is to run "make" often, maybe in a cron
job, to catch changes on wikipedia.

The main function is to create RSS feeds with interesting events,
such as new satellites being launched or old ones being retired.

# Installing

This has only been tested on linux, and depends on gnu make, perl
and the "JSON", "Mojo::DOM" and "XML::FeedPP" perl modules.

To get this working on a debian based system, it should be enough to:

    sudo apt-get install \
      make \
      libjson-perl \
      libmojolicious-perl \
      libxml-feedpp-perl

# Running

Just run "make". One directory will be created for each positioning
system, containing one file per satellite with one JSON object per
row. These files will be appended to when changes are detected,
and can be used to determine what happened to which satellite when.
You can run make as often as you want to, the wikipedia pages will
be accessed only once per hour.

RSS files will also be created, with interesting changes. These
can be uploaded to a webserver to make sure everyone knows the
current status of the satellites.
