@ECHO OFF
REM Setting all the environent variables for smoother experience
SET PYTHON_EXE=python
SET MANAGE=.\Scripts\python manage.py
SET ENV_FILE=.env
SET DJANGO_PORT=8000

IF [%1]==[] (
    ECHO Please specify the function to execute
    EXIT
)
IF "%1"=="virtualenv" (
    CALL :virtualenv
)
IF "%1"=="genkey" (
    CALL :genkey
)
IF "%1"=="install" (
    CALL :install
)
IF "%1"=="dev" (
    CALL :dev
)
IF "%1"=="project" (
    CALL :dev
    IF [%2]==[] (
        ECHO Please specify a project name
        EXIT
    )
    django-admin startproject --template=.\etc\structure %2 .
    ECHO Clearing Redundant Files
    rmdir etc/structure
)
IF "%1"=="migrate" (
    ECHO - Migrating Database
    %MANAGE% makemigrations
    %MANAGE% migrate
)
IF "%1"=="run" (
    ECHO - Starting Django Server
    %MANAGE% runserver %DJANGO_PORT%
)
IF "%1"== "flush" (
    ECHO - Flushing Database
    %MANAGE% flush
)
IF "%1"=="format" (
	ECHO - Run isort imports ordering validation
	.\Scripts\isort --profile black --gitignore .
	ECHO - Run black validation
	.\Scripts\black .
)
IF "%1"=="test" (
    ECHO - Running Unit Tests
    %MANAGE% test
)
IF "%1"=="check" (
    ECHO - Running Unit Tests
    %MANAGE% test
    ECHO - Running black validation
    .\Scripts\black --check .
)

EXIT /B 0
:: ----------------------------------------------------------
:: Functions
:: ----------------------------------------------------------

:virtualenv
	ECHO - Making Virtual Environment
	%PYTHON_EXE% -m venv .
    EXIT /B 0

:genkey
    IF NOT EXIST .env (
        ECHO - Generating Secret key
        .\Scripts\%PYTHON_EXE% -c "from django.core.management.utils import get_random_secret_key;key = get_random_secret_key();print(f'SECRET_KEY={key}\nDEVELOPMENT=True')" -> .env
    ) ELSE (
        ECHO .env file already exists
    )
    TYPE etc/env.txt >> .env
    EXIT /B 0

:install
    CALL :virtualenv
    ECHO - Installing Dependencies
    .\Scripts\%PYTHON_EXE% -m pip install -r etc/base.txt
    CALL :genkey
    EXIT /B 0

:dev
    CALL :virtualenv
    ECHO - Installing Dependencies
    .\Scripts\%PYTHON_EXE% -m pip install -r etc/dev.txt
    CALL :genkey
    EXIT /B 0