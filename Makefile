CS=node_modules/coffee-script/bin/coffee

setup:
	npm install

watch:
	 @$(CS) -bwo lib src
