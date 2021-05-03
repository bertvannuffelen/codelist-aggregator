# env variables should be set outside 
#TARGETDIR := /tmp/workspace/target
#SOURCEDIR := /home/circleci/project/codelist
#
#
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
	dos2unix $<
	rapper -i guess -o ntriples $< > $@

$(objectsrdf): $(TARGETDIR)/%.nt: $(SOURCEDIR)/%.rdf
	dos2unix $<
	rapper -i guess -o ntriples $< > $@

$(objectsnt): $(TARGETDIR)/%.nt: $(SOURCEDIR)/%.nt
	dos2unix $<
	rapper -i guess -o ntriples $< > $@

$(objectsjson): $(TARGETDIR)/%.nt: $(SOURCEDIR)/%.json
	dos2unix $<
	rapper -i guess -o ntriples $< > $@

$(objectsjsonld): $(TARGETDIR)/%.nt: $(SOURCEDIR)/%.jsonld
	dos2unix $<
	jsonld format -q $< > $@


all.nt: $(objectsttl) $(objectsrdf) $(objectsnt) $(objectsjson) $(objectsjsonld)
	mkdir -p $(TARGETDIR)
	if [ -z "$^" ] ; then echo "ERROR: no files are found" ;  else cat $^ > $(TARGETDIR)/all.nt ; fi

muuid.nt: all.nt
	cut -f 1 -d " " $(TARGETDIR)/all.nt | sort -u > $(TARGETDIR)/muuid.nt
	sed -i -e '/concept/!d' $(TARGETDIR)/muuid.nt 
	sed -i -e 's|\(.*conceptscheme\)\(/.*\)>|\1\2> "conceptscheme\2"| ' $(TARGETDIR)/muuid.nt 
	sed -i -e 's|\(.*concept\)\(/.*\)>|\1\2> "concept\2"| ' $(TARGETDIR)/muuid.nt 
	sed -i -e 's|> "|> <http://mu.semte.ch/vocabularies/core/uuid> "|' $(TARGETDIR)/muuid.nt
	for i in 1 2 3 4 ; do \
	      echo $$i ; \
	      sed -i -e 's|\(".*\)/\(.*\)|\1-\2|' $(TARGETDIR)/muuid.nt  ; \
	done \
	sed -i -e 's|$|.|' $(TARGETDIR)/muuid.nt  



all.ttl: all.nt muuid.nt
	rapper -i ntriples -o turtle $(TARGETDIR)/all.nt > $(TARGETDIR)/all.ttl

