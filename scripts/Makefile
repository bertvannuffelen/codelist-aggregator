$(objects): %.nt: %.ttl
	rapper -i guess -o ntriples $< > $@

$(objects): %.nt: %.rdf
	rapper -i guess -o ntriples $< > $@

$(objects): %.nt: %.nt
	rapper -i guess -o ntriples $< > $@

$(objects): %.nt: %.json
	rapper -i guess -o ntriples $< > $@


all.nt: $(objects)
	cat $< > all.nt
