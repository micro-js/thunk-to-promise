#
# Vars
#

BIN = ./node_modules/.bin
VERSION = 0.0.1

#
# Tasks
#

node_modules: package.json
	@npm install

test: node_modules
	@${BIN}/tape test/*

validate: node_modules
	@${BIN}/standard

release:
	${BIN}/bump ${VERSION} && \
	git commit --all -m "Release ${VERSION}" && \
	git tag ${VERSION} && \
	git push origin master --tags

.PHONY: test validate release
