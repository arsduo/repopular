# Repopular

OpenGraph support for Github Repos

## Configuration environment

All env vars should go in `.env` for foreman.

You can sync the config with heroku using the heroku:config plugin

Installation:
  heroku plugins:install git://github.com/ddollar/heroku-config.git

Usage:

Load config from Heroku:
  heroku config:pull --overwrite

Push config from .env to Heroku:

