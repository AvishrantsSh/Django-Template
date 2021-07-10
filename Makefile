PYTHON_EXE?=python3
MANAGE=bin/python manage.py
ACTIVATE?=. bin/activate;
VIRTUALENV_PYZ=etc/virtualenv.pyz
GET_SECRET_KEY=`base64 /dev/urandom | head -c50`
ENV_FILE=.env

# Default Django Port
PORT = 8000

virtualenv:
	@echo "-> Making Virtual Environment"
	@${PYTHON_EXE} ${VIRTUALENV_PYZ} --never-download --no-periodic-update .

install: virtualenv
	@echo "-> Generating Secret key"
	@if test -f ${ENV_FILE}; then echo ".env file exists already"; true; fi
	@mkdir -p $(shell dirname ${ENV_FILE}) && touch ${ENV_FILE}
	@echo SECRET_KEY=\"${GET_SECRET_KEY}\" > ${ENV_FILE}
	@echo "-> Installing Dependencies"
	@${ACTIVATE} pip install -r etc/requirements.txt

project: install
	@echo -n "-> Enter Project Name: ";\
	read PROJECT; \
	django-admin startproject --template=./etc/structure $${PROJECT} .

migrate:
	@echo "-> Apply database migrations"
	${MANAGE} migrate

run:
	${MANAGE} runserver ${PORT}

freeze:
	@echo "-> Updating Project Requirements"
	@${ACTIVATE} pip freeze > etc/requirements.txt

flush:
	@echo "-> Flushing Database"
	${ACTIVATE} ./manage.py flush

format:
	@echo "-> Run isort imports ordering validation"
	@isort --gitignore .
	@echo "-> Run black validation"
	@black .