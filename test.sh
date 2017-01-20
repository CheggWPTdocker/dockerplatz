for D in `find . -maxdepth 1 -type d`
do
	DIR=`echo $D | cut -f 2 -d "/"`
	if [ $DIR != '.git' ] && [ $DIR != '.' ]; then
		echo $DIR
		
		git config -f .gitmodules submodule.$DIR.branch master
		cd $DIR
		git checkout master
		git pull origin master
		git branch -u origin/master master
		cd ..
		git add $DIR
		git commit -m "$DIR -> track master"

	fi
done


