CS=node_modules/coffee-script/bin/coffee
YUIDOC=node_modules/yuidocjs/lib/cli.js

setup:
	npm install

doc:
	cd src && \
  ../$(YUIDOC) .\
  --syntaxtype coffee \
  -e .coffee \
  -o ../docs

watch:
	 @$(CS) -bwo lib src
