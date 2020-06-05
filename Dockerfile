FROM alpine:3

# Adds entrypoint script
COPY bin/dockerpresso-installer /bin

COPY ./templates /templates

VOLUME /project

ENTRYPOINT /bin/dockerpresso-installer /project
