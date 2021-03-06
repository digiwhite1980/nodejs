## NodeJS image including new relic support
This NodeJS image supports multiple options including:
- GIT repo sync support
- Newrelic support

# NodeJS git / ADD through Dockerfile
It is possible to clone this image and inject the JS code through an ADD option in the Dockerfile.
When using the ADD option, please make sure to use NODEJS_PATH var to meet the path where the source code is located.

A better solution would be to pull the source code from GIT using a SSH key. If applicable: please make sure the private key does 
not contain a password. Also be sure to use "ADD ssh-key /root/.ssh/ssh-git" or the git pull command will not work.

# package.json
The script supports package.json dependencies. If a packege.json file is available, npm will run the install command to 
meet the required dependencies.

# NodeJS version
When using the NODEJS_VERSION environment variable the user may chose the NodeJS version he wishes. latest en stable are also possible.

# NodeJS wrapper script options:
```bash
##############################################################################
# Default Docker image for NodeJS
# ----------------------------------------------------------------------------
#
# Mandatory environment vars:
# - NODEJS_PATH (Only when not using GIT_REPO)
#       Path to the nodejs application files.
#       This path is set automatically when using GIT
# - NODEJS_EXEC
#       NodeJS application executable (app.js)
#
# Optional environment vars:
# - NODEJS_VERSION
#       Supports multiple node versions:
#       0.x.x
#       latest
#       stable
# - EXEC_CMD
#       executable to use [nodejs | npm]
# - GIT_REPO
#       GIT repo where application data is stored
#       Currently this option is mandatory.
#	When using SSH please make sure /root/.ssh/ssh-git is available
# - GIT_PTH
#       Path within the GIT_REPO where executable NodeJS file is stored
#       If not given, . is used.
# - GIT_LOG
#       Path to git log
#
# - NEWRELIC
#       If set to 1 the newrelic agent will be started
# - NEWRELIC_LICENSE
#       This will set the newrelic license
```

# Run examples

```shell
docker run -d --name nodejs -p 80:80 \
	-e GIT_REPO=git@github.com:digiwhite1980/nodejs.git \
	-e GIT_PATH=path/to \
	-e NODEJS_EXEC=app.js \
	-e NODEJS_VERSION=latest \
	digiwhite/nodejs

docker run -d --name nodejs -p 80:80 \
	-e GIT_REPO=git@github.com:digiwhite1980/nodejs.git \
	-e GIT_PATH=path/to \
	-e NODEJS_EXEC=app.js \
	-e NODEJS_VERSION=stable \
	-e NEWRELIC=1 \
	-e NEWRELIC_LICENSE={key} \
	-e TZ={you timezone} \
	digiwhite/nodejs
```	

# Tracking
2015-09-24: initial version
