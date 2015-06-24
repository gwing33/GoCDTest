#!/bin/bash
cd /root/repo; /usr/local/activator/activator test stage
rm /root/target/universal/stage/bin/*.bat
bash /root/repo/target/universal/stage/bin/play-scala
