FROM ubuntu:20.04
COPY date.sh /tmp
CMD /usr/bin/sh /tmp/date.sh
