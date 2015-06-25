cd ./BuildTools
docker build --rm --force-rm -t buildtools .
docker run --privileged -t -i -v "${pwd}/" buildtools
