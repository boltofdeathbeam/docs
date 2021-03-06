# https://gist.githubusercontent.com/SangsooNam/aa73c3e1ff88d30433e4020f1275242a/raw/b5fdc4d1cc44be63dc272a42b55524a1cf32d595/publish_gitbook.sh
# install the plugins and build the static site
git checkout master

gitbook install && gitbook build

# checkout to the gh-pages branch
git checkout gh-pages

# pull the latest updates
git pull origin gh-pages --rebase

# copy the static site files into the current directory.
cp -R _book/* .

# remove 'node_modules' and '_book' directory
git clean -fx node_modules
git clean -fx _book

# add all files
git add .

# commit
git commit -a -m "Update docs"

# push to the origin
git push origin gh-pages

# checkout to the master branch
# git checkout master
