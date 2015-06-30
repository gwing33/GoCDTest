# INTRO

The purpose of this it to test out GoCD and get everything running locally.

First, [Install Docker](https://docs.docker.com/installation/)

---
_**Note: OS X & Boot2Docker**_ -
_Boot2Docker seems to have major issues, the recommended setup is as follows:_

```
# TODO

```

---

##### HOW THIS WORKS
* GoCD Server will have multiple Agents.
* GoCD pipeline's first step will be to run the Build / Unit tests, then produce a production grade docker container. This is done in a generic BuildTools container.
* The BuildTools container will run a ``build.sh`` and a ``test.sh`` script.
* Upon success, the BuildTools will produce a production grade image.
* GoCD can then take that image and run integration tests.
* With each success it should promote the image, until it reaches a "production ready" state.

## BUILD TOOLS

### Build HelloWorld from Repo
```
docker build -t buildtools .
docker run --privileged -t -i -e GIT_REPO=https://github.com/gwing33/GoCDTest.git buildtools
```

## GoCD

### Build and Run Server
```
docker run --privileged -tiP gocd/gocd-server
```

### Custom Lifetime GoCD Agent
You will need to have the GoCD Server running, so make sure you get the IPAddress: ``docker inspect {{ContainerID}}``

```
cd baseimage
docker build -t baseimage .
cd ../ltf-gocd-agent
docker build -t ltf-gocd-agent .
docker run --privileged -ti -e GO_SERVER={{IPAddress}} ltf-gocd-agent
```
