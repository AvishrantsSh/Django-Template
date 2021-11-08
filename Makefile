PYTHON_EXE?=python3
MANAGE=bin/python manage.py
ACTIVATE?=. bin/activate;
GET_SECRET_KEY=`base64 /dev/urandom | head -c50`
ENV_FILE=.env

# Default Django Port
PORT = 8000

virtualenv:
	@echo "-> Getting Essential Build Files"
	@sudo apt-get install python3-venv
	@echo "-> Making Virtual Environment"
	@${PYTHON_EXE} -m venv .

genkey: virtualenv
	@echo "-> Generating Secret key"
	@if test -f ${ENV_FILE}; then echo ".env file exists already"; true; fi
	@mkdir -p $(shell dirname ${ENV_FILE}) && touch ${ENV_FILE}
	@echo SECRET_KEY=\"${GET_SECRET_KEY}\" > ${ENV_FILE}

install: genkey
	@echo "-> Installing Dependencies"
	@${ACTIVATE} pip install -r etc/requirements.txt

project: install
	@echo -n "-> Enter Project Name: ";\
	read PROJECT; \
	django-admin startproject --template=./etc/structure $${PROJECT} .

migrate:
	@echo "-> Apply database migrations"
	${MANAGE} makemigrations
	${MANAGE} migrate

run:
	${MANAGE} runserver ${PORT}

freeze:
	@echo "-> Updating Project Requirements"
	@${ACTIVATE} pip freeze > etc/requirements.txt

flush:
	@echo "-> Flushing Database"
	${MANAGE} flush

format:
	@echo "-> Run autoflake to remove unused imports"
	@${ACTIVATE} autoflake ${AUTOFLAKE_ARGS} .
	@echo "-> Run isort imports ordering validation"
	@${ACTIVATE} isort --profile black --gitignore .
	@echo "-> Run black validation"
	@${ACTIVATE} black .

test:
	@${MANAGE} test

check: test
	@echo "-> Run black validation"
	@${ACTIVATE} black --check .