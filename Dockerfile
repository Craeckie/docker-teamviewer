FROM debian:stable-slim

MAINTAINER Bruno Binet <bruno.binet@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yq \
    && apt install -y curl \
    && curl -fSL -o /tmp/teamviewer.deb "https://download.teamviewer.com/download/linux/teamviewer_amd64.deb" \
    && dpkg -i /tmp/teamviewer.deb; apt install -y --fix-broken \
    && rm /tmp/teamviewer.deb \
    && rm -rf /var/lib/apt/lists/*


VOLUME ["/tmp/.X11-unix"]

CMD ["/usr/bin/teamviewer"]
