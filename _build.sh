#!/bin/sh
set -e # Exit with nonzero exit code if anything fails

# Copied from here: https://gist.github.com/domenic/ec8b0fc8ab45f39403dd

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"
BUILD_COMMIT_MSG="Update book (travis build ${TRAVIS_BUILD_NUMBER})"
BRANCH=$(if [ "$TRAVIS_PULL_REQUEST" = "false" ]; then echo $TRAVIS_BRANCH; else echo $TRAVIS_PULL_REQUEST_BRANCH; fi)

# Exit without set GITHUB_PAT
[ -z "${GITHUB_PAT}"] && exit 0

git config --global user.email "d-schalk@t-online.de"
git config --global user.name "Daniel Schalk"

# Compile html version of book for gh-pages
make -B pdf
# Compile html version of book for gh-pages
make -B epub
# Compile html version
make -B html

## Only deploy when on master branch of main repository
if [  "$BRANCH" = "master" -a "$TRAVIS_PULL_REQUEST" = "false" ] ; then

  echo "Deploying master to gh-pages."
  # Clone the existing gh-pages for this repo into out/
  # Create a new empty branch if gh-pages doesn't exist yet (should only happen on first deply)
  git clone -b $TARGET_BRANCH https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git out
  cd out
  git rm -rf ./*
  cp -r ../_book/* ./
  touch .nojekyll
  git add .nojekyll

  git add -f --all ./*

  git commit -m "${BUILD_COMMIT_MSG}" --allow-empty

  # Now that we're all set up, we can push.
  git push origin $TARGET_BRANCH

else
  echo "Changes are not being deployed, since this is a fork / branch."
fi

#!/bin/sh
set -e # Exit with nonzero exit code if anything fails


