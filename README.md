# configManagementProject
Project for Configuration Management. 
## Topic (Alpha Phase)

My project will be a module that will deploy a Django production installation with a Web interface. Multiple users can register, log in and edit customer database. The project is in alpha phase and will require a lot more tuning. 

## Features

One click Django production installation.

## Installation instructions

- sudo apt-get install virtualenv git, salt-minion
- git clone git@github.com:JyriLampio/configManagementProject.git
- Copy the django directory to /srv/salt/
`sudo salt-call --local state.apply django`
