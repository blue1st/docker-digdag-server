# Digdag in Docker with Embulk and dockerd

## Usage

```bash
$ docker run -d --privileged -p 65432:65432 blue1st/digdag-server
$ digdag version -e localhost:65432
2017-12-14 12:15:13 +0900: Digdag v0.9.21
Client version: 0.9.21
Server version: 0.9.21
```

## Optional Settings

[/assets/config.tmp](./assets/config.tmp)

|Key|Desc|
|:---|:---|
|DATABASE_TYPE|(default: memory)|
|DATABASE_HOST||
|DATABASE_PORT||
|DATABASE_DATABASE||
|DATABASE_USER||
|DATABSE_PASSWORD||
|DATABASE_MAXIMUMPOOLSIZE||
|CLIENT_HTTP_ENDPOINT||
|SECRETS_MAIL_HOST||
|SECRETS_MAIL_PORT||
