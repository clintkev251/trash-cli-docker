FROM ubuntu

COPY --chown=nobody:users startup.sh /etc/trash/startup.sh

RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y zip \
  && rm -rf /var/lib/apt/lists/*

RUN cd /etc/trash \
  && wget -O trash.zip https://github.com/rcdailey/trash-updater/releases/latest/download/trash-linux-x64.zip && unzip -o trash.zip && rm trash.zip && chmod u+rx trash

RUN mkdir /etc/trash/config

ENTRYPOINT [ "/etc/trash/startup.sh" ]