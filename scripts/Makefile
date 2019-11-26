TARGETDIR := /tmp/workspace/target
SOURCEDIR := /home/circleci/project/codelist
src_ttl := $(wildcard $(SOURCEDIR)/*.ttl)
objectsttl := $(patsubst $(SOURCEDIR)/%.ttl, $(TARGETDIR)/%.nt, $(src_ttl))
objectsrdf := $(patsubst $(SOURCEDIR)/%.ttl, $(TARGETDIR)/%.nt, $(src_ttl))
objectssjon := $(patsubst $(SOURCEDIR)/%.ttl, $(TARGETDIR)/%.nt, $(src_ttl))
objectsnt:= $(patsubst $(SOURCEDIR)/%.ttl, $(TARGETDIR)/%.nt, $(src_ttl))


$(objectsttl): $(TARGETDIR)/%.nt: $(SOURCEDIR)/%.ttl
	rapper -i guess -o ntriples $< > $@

$(objectsrdf): %.nt: %.rdf
	rapper -i guess -o ntriples $< > $@

$(objectsnt): %.nt: %.nt
	rapper -i guess -o ntriples $< > $@

$(objectsjson): %.nt: %.json
	rapper -i guess -o ntriples $< > $@


all.nt: $(objectsttl)
	mkdir -p $(TARGETDIR)
	cat $^ > $(TARGETDIR)/all.nt

