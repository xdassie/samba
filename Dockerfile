# copied directly from https://hub.docker.com/r/servercontainers/samba/dockerfile 
FROM xdassie/samba-base:latest


VOLUME ["/shares"]

EXPOSE 139 445

RUN git clone -b 4.9.4 https://github.com/ServerContainers/samba.git && find ./
RUN cp ServerContainers/scripts /usr/local/bin/
#COPY scripts /usr/local/bin/

HEALTHCHECK CMD ["docker-healthcheck.sh"]
ENTRYPOINT ["entrypoint.sh"]

CMD [ "bash", "-c", "smbd -FS -d 2 < /dev/null" ]
