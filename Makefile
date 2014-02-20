MODULESDIR=./node_modules
BINDIR=${MODULESDIR}/.bin
export PATH := BINDIR:$(PATH)

source_files := src/app.coffee $(shell find src/* -type f -name '[^app]*.coffee')

app_bundle := public/script/app.js


.PHONY: all clean ccwj sf test

all: $(app_bundle)

clean:
	rm -rf .build/$(filename) $(app_bundle)

ccwj:
	mkdir -p $(dir $(app_bundle))
	coffee -cw -j $(app_bundle) $(source_files) src/

test:
	$(BINDIR)/mocha $(path)
