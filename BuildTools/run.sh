#!/bin/bash

cd /root/

if [ ! -z "$GIT_REPO" ]; then
  # Need to pull down the git repo.
  git clone "$GIT_REPO" repo

  # If passed commit or branch in, check it out.
  if [ ! -z "$GIT_TAG"]; then
    git checkout "$GIT_TAG"
  fi
fi

cd ./repo/HelloWorld

chmod +x ./build.sh
bash ./build.sh

# Run Tests

# If Pass, build image
docker build --rm --force-rm -t this .

# Push to docker repo
