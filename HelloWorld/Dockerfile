FROM        ubuntu:14.04

MAINTAINER  Gerald Leenerts <gleenerts@lifetimefitness.com>

ADD         build.sh /root/

RUN         chmod +x /root/build.sh

WORKDIR     /root/
ENTRYPOINT  ["/root/build.sh"]
