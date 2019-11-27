TARGETDIR := /tmp/workspace/target
SOURCEDIR := /home/circleci/project/codelist
src_ttl := $(wildcard $(SOURCEDIR)/*.ttl)
src_rdf := $(wildcard $(SOURCEDIR)/*.rdf)
src_json := $(wildcard $(SOURCEDIR)/*.json)
src_jsonld := $(wildcard $(SOURCEDIR)/*.jsonld)
src_nt := $(wildcard $(SOURCEDIR)/*.nt)
objectsttl := $(patsubst $(SOURCEDIR)/%.ttl, $(TARGETDIR)/%.nt, $(src_ttl))
objectsrdf := $(patsubst $(SOURCEDIR)/%.rdf, $(TARGETDIR)/%.nt, $(src_rdf))
objectsjson := $(patsubst $(SOURCEDIR)/%.json, $(TARGETDIR)/%.nt, $(src_json))
objectsjsonld := $(patsubst $(SOURCEDIR)/%.jsonld, $(TARGETDIR)/%.nt, $(src_jsonld))
objectsnt := $(patsubst $(SOURCEDIR)/%.nt, $(TARGETDIR)/%.nt, $(src_nt))


$(objectsttl): $(TARGETDIR)/%.nt: $(SOURCEDIR)/%.ttl
	rapper -i guess -o ntriples $< > $@

$(objectsrdf): $(TARGETDIR)/%.nt: $(SOURCEDIR)/%.rdf
	rapper -i guess -o ntriples $< > $@

$(objectsnt): $(TARGETDIR)/%.nt: $(SOURCEDIR)/%.nt
	rapper -i guess -o ntriples $< > $@

$(objectsjson): $(TARGETDIR)/%.nt: $(SOURCEDIR)/%.json
	rapper -i guess -o ntriples $< > $@

$(objectsjsonld): $(TARGETDIR)/%.nt: $(SOURCEDIR)/%.jsonld
	jsonld format -q $< > $@


all.nt: $(objectsttl) $(objectsrdf) $(objectsnt) $(objectsjson) $(objectsjsonld)
	mkdir -p $(TARGETDIR)
	cat $^ > $(TARGETDIR)/all.nt

