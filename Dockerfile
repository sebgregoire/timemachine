FROM ubuntu:14.04
MAINTAINER Johan Bloemberg <docker@ijohan.nl>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -yqq netatalk
RUN ln -s -f /bin/true /usr/bin/chfn
RUN mkdir -p /backup/timemachine
RUN echo '/backup/timemachine "Backups" allow:timemachine options:usedots,upriv,tm' >> /etc/netatalk/AppleVolumes.default
RUN echo '-setuplog "Logger log_info"' >> /etc/netatalk/afpd.conf
RUN useradd timemachine -m
RUN chown timemachine /backup/timemachine

ADD start.sh /start.sh

EXPOSE 548

VOLUME ["/backup"]

CMD [ "/start.sh" ]
