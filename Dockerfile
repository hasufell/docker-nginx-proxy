FROM        hasufell/gentoo-nginx:latest
MAINTAINER  Julian Ospald <hasufell@gentoo.org>

ENV DOCKER_HOST unix:///tmp/docker.sock

COPY nginx.tmpl Procfile /app/
WORKDIR /app/

CMD ["forego", "start", "-r"]
