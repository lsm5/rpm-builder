#!/bin/sh

. env.sh

# fetch version and commit info
fetch_version_and_commit ()
{
    pushd $REPO_DIR/$PACKAGE
    git fetch origin
    git checkout origin/master
    export LATEST_TAG=$(git describe --tags --abbrev=0)
    export VERSION=$($LATEST_TAG | sed -e 's/v//')
    export COMMIT=$(git show --pretty=%H -s $LATEST_TAG)
    export SHORTCOMMIT=$(c=$COMMIT; echo ${c:0:7})
    popd
}
