install:
	pip install -r requirements.txt

install-dev: install
	pip install -r requirements-test.txt

lint:
	flake8 app tests

component:
	PYTHONPATH=. pytest -sv tests/

coverage:
	coverage run --source=app --branch -m pytest tests/ --junitxml=build/test.xml -v
	coverage report
	coverage xml -i -o build/coverage.xml

test: lint component

run:
	docker-compose up

run-dev:
	docker-compose -f docker-compose.local.yml up
