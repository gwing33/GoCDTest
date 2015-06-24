#!/bin/bash

# Example
# run_in_docker $WORKSPACE/run-unit-tests-docker.sh
run_in_docker() {
  # Need our internal space.
  $docker_repo = "lifetimefitness/base-image"

  docker pull "$docker_repo"
  docker run --rm -v $WORKSPACE:$WORKSPACE --env-file <(env | grep -vE 'PATH|TMP|HOME|LANG|GOROOT') "$docker_repo" "$@"
}
