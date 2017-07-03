#!/bin/bash
for argument in "$@"
do
case $argument in
	toinitialcommit)
		rm -rfv .git
		git init
		git add --all
		git commit -m "to initial commit"
		git remote add origin https://github.com/albraga/cvue.git
		git push -u --force origin master
	;;
	www)
		rm -rfv www
		mkdir www
		cd www
		wget https://raw.githubusercontent.com/albraga/cvue/master/www/index.html
		mkdir js
		cd js
		wget https://raw.githubusercontent.com/albraga/cvue/master/www/js/index.js
		wget https://raw.githubusercontent.com/albraga/cvue/master/www/js/main.js
		wget https://raw.githubusercontent.com/albraga/cvue/master/www/js/random-word.vue
		cd ../..
		mkdir scripts
		cd scripts
		wget https://raw.githubusercontent.com/albraga/cvue/master/scripts/vueify-build.js
	;;
	dependencies)
		npm install --save-dev vueify vue-hot-reload-api browserify babel-runtime babel-preset-es2015 babel-core babel-plugin-transform-runtime
		npm install --save vue vue-resource
	;;
	browser)
		sed -i 's/"devDependencies": {/"browser": { \n"vue": "vue\/dist\/vue.common.js" \n}, \n"devDependencies": {/g' package.json
	;;
	hook)
		sed -i 's/<\/widget>/ <hook src="scripts\/vueify-build.js" type="before_compile" \/> <\/widget>/g' config.xml
	;;
	assemble_docs_2_githubpages)
		mkdir docs
		mv -fv staticdata docs/
		mv -fv index.html docs/
		mv -fv dist docs/
	;;
	lint)
	# add to .eslintrc.js
	# "rules": {
	# "no-console": "off",
					./node_modules/.bin/eslint --ext .js,.vue src; exit 0
	;;
	eslintinit)
					./node_modules/.bin/eslint --init
	;;
	static)
					rm -rfv static && mkdir -v static
					cd static
					wget -O temp.zip "https://jqueryui.com/resources/download/jquery-ui-1.12.1.zip"
					unzip temp.zip && rm temp.zip
					mv jquery-ui-1.12.1 jquery-ui
					cd jquery-ui
					rm AUTHORS.txt
					rm index.html
					rm jquery-ui.css
					rm jquery-ui.js
					rm jquery-ui.structure.css
					rm jquery-ui.theme.css
					rm LICENSE.txt
					rm package.json
					cd ..
					wget -O temp.zip "https://github.com/twbs/bootstrap/releases/download/v3.3.7/bootstrap-3.3.7-dist.zip"
					unzip temp.zip && rm temp.zip
					mv bootstrap-3.3.7-dist bootstrap
					cd bootstrap/css
					rm bootstrap.css 
					rm bootstrap.css.map 
					rm bootstrap.min.css.map 
					rm bootstrap-theme.css 
					rm bootstrap-theme.css.map 
					rm bootstrap-theme.min.css.map
					cd ../js
					rm bootstrap.js
					rm npm.js
					cd ../..
					wget https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js
	;;
esac
done
