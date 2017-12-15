FROM docker:17.11.0-ce-dind

ARG digdag_version=0.9.21
ARG embulk_version=0.8.39

ADD https://dl.digdag.io/digdag-${digdag_version} /usr/local/bin/digdag
ADD https://dl.bintray.com/embulk/maven/embulk-${embulk_version}.jar /usr/local/bin/embulk

RUN apk --update --no-cache add nodejs openjdk8 jruby gettext tzdata&&\
	chmod +x /usr/local/bin/digdag &&\
	chmod +x /usr/local/bin/embulk

COPY assets/config.tmp /tmp/
COPY assets/digdag-entrypoint.sh /usr/local/bin/
COPY assets/entrypoint.sh /usr/local/bin/

ENV SERVER_BIND=0.0.0.0
ENV SERVER_PORT=80
ENV CLIENT_HTTP_ENDPOINT=http://localhost:80
ENV LOG_SERVER_TYPE=local
ENV DATABASE_TYPE=memory
ENV EXECUTOR_TASK_TTL=1d
ENV EXECUTOR_ATTEMPT_TTL=7d
ENV DIGDAG_SECRET_ENCRYPTION_KEY=MDEyMzQ1Njc4OTAxMjM0NQ==

ENTRYPOINT ["entrypoint.sh"]
CMD ["digdag", "server", "-c", "/root/.config/digdag/config"]
