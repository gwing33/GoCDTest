
EXTERNAL_DOCKER=no
MOUNTED_DOCKER_FOLDER=no
if [ -S /var/run/docker.sock ]; then
	echo "=> Detected unix socket at /var/run/docker.sock"
	docker version > /dev/null 2>&1 || (echo "   Failed to connect to docker daemon at /var/run/docker.sock" && exit 1)
	EXTERNAL_DOCKER=yes
else
	if [ "$(ls -A /var/lib/docker)" ]; then
		echo "=> Detected pre-existing /var/lib/docker folder"
		MOUNTED_DOCKER_FOLDER=yes
	fi
	echo "=> Starting docker"
	wrapdocker > /dev/null 2>&1 &
	sleep 2
	echo "=> Checking docker daemon"
	docker version > /dev/null 2>&1 || (echo "   Failed to start docker (did you use --privileged when running this container?)" && exit 1)
fi

cd ./BuildTools
docker build --rm --force-rm -t buildtools .
docker run --privileged -t -i -v $(pwd) buildtools
