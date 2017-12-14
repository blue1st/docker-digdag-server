FROM docker:17.11.0-ce-dind

ARG digdag_version=0.9.21
ARG embulk_version=0.8.39

ADD https://dl.digdag.io/digdag-${digdag_version} /usr/local/bin/digdag
ADD https://dl.bintray.com/embulk/maven/embulk-${embulk_version}.jar /usr/local/bin/embulk

RUN apk --update --no-cache add nodejs openjdk8 gettext tzdata&&\
	chmod +x /usr/local/bin/digdag &&\
	mkdir -p /digdag/logs/ &&\
	chmod +x /usr/local/bin/embulk

COPY assets/config.tmp /tmp/
COPY assets/digdag-entrypoint.sh /usr/local/bin/
COPY assets/entrypoint.sh /usr/local/bin/

ENV DATABASE_TYPE=memory

ENTRYPOINT ["entrypoint.sh"]
CMD ["digdag", "server", "-c", "/root/.config/digdag/config", "-b", "0.0.0.0", "-O", "/var/tmp"]
