###
### CI TEST
### ¯¯¯¯¯¯¯¯¯¯¯
### ¯¯¯¯¯¯¯¯¯¯¯
### ¯¯¯¯¯¯¯¯¯¯¯
### ¯¯¯¯¯¯¯¯¯¯¯
### ¯¯¯¯¯¯¯¯¯¯¯

HELP += $(call help,test.all,			Run all tests)
test.all: test.twig test.eslint

HELP += $(call help,test.twig,			Validate Twig templates)
test.twig: ## Validate Twig templates
	cd ${APP_DIR} && (ENV=$(ENV) docker compose exec php bin/console lint:twig --no-debug ${PLUGIN_DIR}/templates)
	cd ${APP_DIR} && (ENV=$(ENV) docker compose exec php vendor/bin/twigcs ${PLUGIN_DIR}/templates --severity error --display blocking)

HELP += $(call help,test.twig,			Validate Twig templates)
test.twig.fix: ## Fix Twig templates
	cd ${APP_DIR} && (ENV=$(ENV) docker compose exec php vendor/bin/twig-cs-fixer lint --fix ${PLUGIN_DIR}/templates)

HELP += $(call help,test.eslint,			Validate Twig templates)
test.eslint: ## Validate eslint
	cd ${APP_DIR} && (ENV=$(ENV) docker compose run --rm -i nodejs "npm --prefix ${PLUGIN_DIR} run lint")
