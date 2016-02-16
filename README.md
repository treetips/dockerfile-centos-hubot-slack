Easy to develop hubot script Dockerfile
====

## Description

As for this image, **sudo**, **yum**, **vi**, **npm** are installed. become easy to develop a hubot-slack script on docker.

Because this image that was completely specialized in development, the use in the production environment does not consider it.

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

## How to build(optionally)

```bash
# download Dockerfile
git clone git@github.com:treetips/dockerfile-centos-hubot-slack.git

# build Dockerfile
docker build -t treetips/dockerfile-centos-hubot-slack .
```

## Usage

```bash
# pull images
docker pull treetips/dockerfile-centos-hubot-slack:latest

# run container with slac api token
docker run -dit --name hubot-slack -e HUBOT_SLACK_TOKEN=xoxb-XXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXX treetips/centos-hubot-slack:latest

# ssh container
docker exec -it hubot-slack bash

# start hubot with slack adapter
./bin/hubot --adapter slack
```

Because it starts in a **foreground**, hubot is stop in Ctrl + c to let you reflect the hubot script which you made and lets it starts again and reflect it. The reason why I start foreground is that I make it easy to restart hubot.

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
