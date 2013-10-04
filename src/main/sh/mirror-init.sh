#!/bin/bash

## ----------------------------------------
## mirror-init.sh
##
## Summary: create local Git mirrors of upstream DocBook SVN
## repositories and push mirrors to GitHub
##
## Related tools:
##  * git-svn
##  * git
## ----------------------------------------

## UPSTREAMS
## list of upstream tree names
UPSTREAMS="docbook buildtools xsl xsl-saxon"

## SVNBASE
## base URL for upstream SVN repository
SVNBASE="http://svn.code.sf.net/p/docbook/code/"
## cf. http://sourceforge.net/p/docbook/code/

## SVNBRANCH
## branch name from upstream SVN repository
SVNBRANCH="V50"

## GITBASE
## base git repository name part for push
GITBASE="git@github.com:GazeboHub"

## MBASE
## base name for mirror repositories
## e.g push to "${GITBASE}/${MBASE}${NAME}.git"
MBASE="mirror-docbook-"


### Procedures

D="${PWD}"

for UP in ${UPSTREAMS}; do
    git svn clone "${SVNBASE}/" --trunk="${UP}" --stdlayout \
	"${MBASE}${UP}"
    cd "${D}/${MBASE}${UP}"
    git push -u --all "${GITBASE}/${MBASE}${UP}.git"
    cd "${D}"
done
