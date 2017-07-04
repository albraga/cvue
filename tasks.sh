#!/bin/bash
for argument in "$@"
do
case $argument in
	www)
		rm -rfv www hooks
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
	toinitialcommit)
		rm -rfv .git
		git init
		git add --all
		git commit -m "to initial commit"
		git remote add origin https://github.com/albraga/cvue.git
		git push -u --force origin master
	;;
esac
done
