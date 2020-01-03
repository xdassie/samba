# copied directly from https://hub.docker.com/r/servercontainers/samba/dockerfile 
FROM quay.io/xdassie/samba-base:latest


VOLUME ["/shares"]

EXPOSE 139 445

RUN mkdir /tmp/gitclone && cd /tmp/gitclone &&  git clone -b 4.9.4 https://github.com/ServerContainers/samba.git && find /tmp/gitclone
RUN cp /tmp/gitclone/samba/scripts /usr/local/bin/
#COPY scripts /usr/local/bin/

HEALTHCHECK CMD ["docker-healthcheck.sh"]
ENTRYPOINT ["entrypoint.sh"]

CMD [ "bash", "-c", "smbd -FS -d 2 < /dev/null" ]
