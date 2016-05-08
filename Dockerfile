FROM debian:jessie

# Adds entrypoint script
COPY bin/dockerpresso /

COPY templates/dockerpresso /dockerpresso-templates/
COPY docker-compose* /dockerpresso-templates/

VOLUME /project

ENTRYPOINT /dockerpresso
