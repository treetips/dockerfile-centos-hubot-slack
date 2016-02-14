Easy to develop hubot script Dockerfile
====

This dockerfile is intended to make it easy to develop hubot scripts for slack.

## Description

It is the present conditions that the hubot script is hard to do development very much. I made the dockerfile that could develop hubot script on familiar CentOS to solve this problem.

Because this dockerfile uses CentOS which is not optimized by a container, I compare it and size is big, but many package are pre installed by just that much from a beginning and become easy to do development very much because it is easy to add it later in yum.

In addition, this dockerfile is a local development use and is not a production use.

## Requirement

### Required docker

Installation of docker is necessary. I can easily make environment of docker when I install Docker Toolbox.

https://www.docker.com/products/docker-toolbox

### Required slack account

Create slack account.

https://slack.com

### Required slack integration

Add hubot integration.

https://slack.com/apps

Because you use HUBOT_SLACK_TOKEN later, please copy a value of API Token in Integration Settings of the setting window of hubot.

### Required invite hubot

Invite hubot in rooms using the slash commands.

```bash
/invite hubot
```

At this point still hubot is offline. And the hubot to online in the usage section.

## Usage

```bash
# download Dockerfile
git clone git@github.com:treetips/dockerfile-centos-hubot-slack.git

# build Dockerfile
docker build -t treetips/centos-hubot-slack .

# run container with slac api token
docker run -dit --name hubot-slack -e HUBOT_SLACK_TOKEN=xoxb-XXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXX treetips/centos-hubot-slack:latest

# ssh container
docker exec -it hubot-slack bash

# start hubot with slack adapter
./bin/hubot --adapter slack
```

Because it starts in a foreground, hubot is stop in Ctrl + c to let you reflect the hubot script which you made and lets it starts again and reflect it.

Because this Dockerfile add hubot user to /etc/sudoers, You can install a package by yum command optionally.

```
user name = hubot
user sudo password = hubot
```

```bash
# hubot user can run sudo command. hubot user password is hubot.
sudo yum install xxxx
```

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[treetips](https://github.com/treetips)
