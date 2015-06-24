#!/bin/bash

cd /root/

if [ ! -z "$GITHUB_URL"]; then
  # Need to pull down the git repo.
  git clone "$GITHUB_URL" repo
  cd ./repo

  # If passed commit or branch in, check it out.
  if [ ! -z "$GITHUB_COMMIT"]; then
    git checkout "$GITHUB_COMMIT"
  fi
fi

ls
chmod +x /root/repo/build.sh
bash /root/repo/build.sh
