
all:
	@cabal-dev -j8 build

debug:
	@cabal-dev build

.PHONY: all debug
