# Digdag in Docker with Embulk and dockerd

## Usage

```bash
$ docker run -d --privileged -p 65432:65432 -v /var/tmp:/var/tmp  blue1st/digdag-server
$ digdag version -e localhost:65432
2017-12-14 12:15:13 +0900: Digdag v0.9.21
Client version: 0.9.21
Server version: 0.9.21
```

```bash
$ cd sample_project
$ digdag push sample -e localhost:65432
2017-12-14 14:32:53 +0900: Digdag v0.9.21
Creating .digdag/tmp/archive-7397887424985167401.tar.gz...
  Archiving sample_workflow.dig
Workflows:
  sample_workflow.dig
Uploaded:
  id: 1
  name: sample
  revision: 5050043f-5b83-483c-8b77-b738136e303d
  archive type: db
  project created at: 2017-12-14T05:32:56Z
  revision updated at: 2017-12-14T05:32:56Z

Use `digdag workflows` to show all workflows.
$ digdag start sample sample_workflow --session now -e localhost:65432
2017-12-14 14:33:54 +0900: Digdag v0.9.21
Started a session attempt:
  session id: 1
  attempt id: 1
  uuid: 7e5413a9-9e1b-41cf-b00b-492cdc4ca172
  project: sample
  workflow: sample_workflow
  session time: 2017-12-14 14:33:55 +0900
  retry attempt name:
  params: {}
  created at: 2017-12-14 14:33:57 +0900

* Use `digdag session 1` to show session status.
* Use `digdag task 1` and `digdag log 1` to show task status and logs.
$ digdag log 1 -e localhost:65432
2017-12-14 14:34:16 +0900: Digdag v0.9.21
2017-12-14 05:34:00.779 +0000 [INFO] (0038@[0:sample]+sample_workflow+use_docker) io.digdag.core.agent.OperatorManager: sh>: ls
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
660c48dd555d: Pulling fs layer
4c7380416e78: Pulling fs layer
421e436b5f80: Pulling fs layer
e4ce6c3651b3: Pulling fs layer
be588e74bd34: Pulling fs layer
e4ce6c3651b3: Waiting
be588e74bd34: Waiting
4c7380416e78: Verifying Checksum
4c7380416e78: Download complete
421e436b5f80: Download complete
e4ce6c3651b3: Verifying Checksum
e4ce6c3651b3: Download complete
be588e74bd34: Verifying Checksum
be588e74bd34: Download complete
660c48dd555d: Verifying Checksum
660c48dd555d: Download complete
660c48dd555d: Pull complete
4c7380416e78: Pull complete
421e436b5f80: Pull complete
e4ce6c3651b3: Pull complete
be588e74bd34: Pull complete
Digest: sha256:7c67a2206d3c04703e5c23518707bdd4916c057562dd51c74b99b2ba26af0f79
Status: Downloaded newer image for ubuntu:latest
sample_workflow.dig
2017-12-14 05:34:16.890 +0000 [INFO] (0038@[0:sample]+sample_workflow+use_embulk) io.digdag.core.agent.OperatorManager: sh>: embulk --version
embulk 0.8.39
```

## Optional Settings

[/assets/config.tmp](./assets/config.tmp)
