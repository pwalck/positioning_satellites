systems = gps glonass galileo beidou
tables = $(systems:=.html)
datafiles = $(tables:.html=.json)

all: $(systems) main.rss clean

beidou.html: every/1hour
	curl -s "https://en.wikipedia.org/wiki/List_of_Beidou_satellites" > "$@"

gps.html: every/1hour
	curl -s "https://en.wikipedia.org/wiki/List_of_GPS_satellites" > "$@"

glonass.html: every/1hour
	curl -s "https://en.wikipedia.org/wiki/List_of_GLONASS_satellites" > "$@"

galileo.html: every/1hour
	curl -s "https://en.wikipedia.org/wiki/List_of_Galileo_satellites" > "$@"

main.rss: $(systems) main_rss.pl
	./main_rss.pl > "$@"

%: %.json extract_satellite_info.pl
	mkdir -p "$@"
	./extract_satellite_info.pl "$@"
	touch -r "$<" "$@"

%.json: %.html extract_json.pl
	./extract_json.pl < "$<" > "$@"

every/%:
	@mkdir -p every
	@touch -d -"$(@F)" "$@"

clean:
	@rm -rf every

distclean: clean
	rm -rf $(tables) $(datafiles)
