.DEFAULT_GOAL := help
SHELL=/bin/bash

-include .makefile/composer.mk
-include .makefile/global.mk

###
### VERSIONS
### ¯¯¯

SYLIUS_VERSION=2.0.0
SYMFONY_VERSION=7.1
COMPOSE_PROJECT_NAME=sylius-happy-cms-plugin

PLUGIN_NAME=agence-adeliom/sylius-tailwindcss-theme
PLUGIN_DIR=themes/TailwindTheme
PLUGIN_NAMESPACE=SyliusTailwindcssPlugin
PLUGIN_URL=git@github.com:agence-adeliom/sylius-tailwindcss-theme.git
PLUGIN_ALIAS=sylius_tailwindcss

DOCKER_USER ?= "$(shell id -u):$(shell id -g)"
ENV ?= "dev"
DOCKER_PHP_PORT ?= 8052
DOCKER_MYSQL_PORT ?= 63503

###
### CI
### Commands to install sylius standard version and this plugin automatically (in github workflow)
### ¯¯¯¯¯¯¯¯¯¯¯

-include .makefile/ci.mk

###
### DEV
### Commands to install sylius standard version and this plugin automatically
### ¯¯¯¯¯¯¯¯¯¯¯

-include .makefile/dev.mk

###
### QA
### Commands to test the code quality
### ex: make test.all
### ¯¯¯¯¯¯¯¯¯¯¯

-include .makefile/qa.mk




