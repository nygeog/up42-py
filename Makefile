SRC := .

env:
	mkvirtualenv --python=$(which python3.7) up42-py
	workon up42-py

install:
	pip install up42-py

install[dev]:
	pip install -r $(SRC)/requirements.txt
	pip install -e .
	pip install -r $(SRC)/requirements-dev.txt

test:
	bash test.sh

test[live]:
	bash test.sh --live

e2e:
	python $(SRC)/tests/e2e.py

gh-pages:
	mkdocs gh-deploy -m "update gh-pages [ci skip]"

clean:
	find . -name "__pycache__" -exec rm -rf {} +
	find . -name ".mypy_cache" -exec rm -rf {} +
	find . -name ".pytest_cache" -exec rm -rf {} +
	find . -name ".coverage" -exec rm -f {} +
