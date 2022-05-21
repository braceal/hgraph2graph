.DEFAULT_GOAL := all
isort = isort hgraph
black = black --target-version py37 hgraph

.PHONY: format
format:
	$(isort)
	$(black)

.PHONY: lint
lint:
	$(black) --check --diff
	flake8 hgraph/
	#pylint hgraph/
	#pydocstyle hgraph/


.PHONY: mypy
mypy:
	mypy --config-file setup.cfg --package hgraph
	mypy --config-file setup.cfg hgraph/

.PHONY: all
all: format lint mypy