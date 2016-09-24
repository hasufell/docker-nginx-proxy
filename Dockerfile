FROM        hasufell/gentoo-nginx:latest
MAINTAINER  Julian Ospald <hasufell@gentoo.org>

# Install Forego
RUN wget -P /usr/local/bin https://github.com/jwilder/forego/releases/download/v0.16.1/forego \
 && chmod u+x /usr/local/bin/forego

ENV DOCKER_GEN_VERSION 0.7.3

RUN wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && rm /docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

ENV DOCKER_HOST unix:///tmp/docker.sock

# Configure Nginx
COPY nginx.conf perfect-forward-secrecy.conf /etc/nginx/

VOLUME ["/etc/nginx/certs"]

COPY nginx.tmpl Procfile /app/
WORKDIR /app/

CMD exec forego start -r
