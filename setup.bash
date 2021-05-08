#! /bin/bash
#
# script name: setup.bash
# script author: munair simpson
# script created: 20210508
# script purpose: spin up an EC2 instance to do some development on simple-web3modal-app

# disable/enable debugging.
debug="false" && echo [$0] set debug mode to "$debug".

# step 1: update the package list and install Yarn. this also installs Node. install unzip and install NPM last.
if $debug ; then sudo apt -y update && sudo apt -y install unzip && sudo apt -y install npm && sudo apt -y install vim && sudo apt -y install awscli; fi
sudo apt -y update > /dev/null 2>&1 && echo [$0] updated APT packages.
sudo apt -y install unzip > /dev/null 2>&1 && echo [$0] installed unzip APT.
sudo apt -y install npm > /dev/null 2>&1 && echo [$0] installed NPM APT.
sudo apt -y install vim > /dev/null 2>&1 && echo [$0] installed vim APT.
sudo apt -y install awscli > /dev/null 2>&1 && echo [$0] installed awscli APT.

# step 2: install Yarn.
if $debug ; then sudo npm install --global yarn; fi
sudo npm install --global yarn > /dev/null 2>&1 && echo [$0] installed Yarn.

# step 3: verify the installation of APTs and configure AWS Client.
nodeversion=$(nodejs --version) && echo [$0] verified the installation of nodejs version $nodeversion.
npmversion=$(npm --version) && echo [$0] verified the installation of npm version $npmversion.
yarnversion=$(yarn --version) && echo [$0] verified the installation of yarn version $yarnversion.
awsversion=$(aws --version) && echo [$0] verified the installation of aws version $awsversion.
aws configure

# step 4: https-localhost
if $debug ; then sudo npm install --global --only=prod https-localhost ; fi
sudo npm install --global --only=prod https-localhost > /dev/null 2>&1 && echo [$0] yarned up.
