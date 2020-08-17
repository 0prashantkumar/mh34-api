#!/bin/sh
# Credit: https://gist.github.com/willprice/e07efd73fb7f13f917ea

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_json_file() {
  git checkout master
  dateAndMonth=`date "+%b %Y %T"`
  # Stage the modified files in dist/output
  git add -f temp/data.json
  # Create a new commit with a custom build message
  # with "[skip ci]" to avoid a build loop
  # and Travis build number for reference
  git commit -m "Travis update: $dateAndMonth (Build $TRAVIS_BUILD_NUMBER)" -m "[skip ci]"
}

upload_files() {
  # Remove existing "origin"
  git remote rm origin
  # Add new "origin" with access token in the git URL for authentication
  git remote add origin https://ameykhaire:${GH_TOKEN}@github.com/ameykhaire/mh34-api.git > /dev/null 2>&1
  git push origin master --quiet
}

setup_git

commit_json_file

upload_files
