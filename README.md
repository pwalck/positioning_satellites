# Status of positioning satellites

Collects status information about global positioning satellites
from wikipedia tables, and keeps JSON files with historical data.
The idea is to run "make" often, maybe in a cron job, to catch
changes on wikipedia.

The next step will be to create rss/atom-feeds that can be published,
containing the latest interesting changes. Primarily to show when
satellites are launched, become operational and retired. This will
be done by comparing new data for each satellite to determine what
changed, and create a corresponding rss item.
