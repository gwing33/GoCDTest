FROM        ubuntu:14.04

MAINTAINER  Gerald Leenerts <gleenerts@lifetimefitness.com>

ADD         run.sh /root/

RUN         chmod +x /root/run.sh

WORKDIR     /root/
ENTRYPOINT  ["/root/run.sh"]
