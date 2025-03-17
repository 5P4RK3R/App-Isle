# Define variables
PYTHON = python3
PIP = pip3
VENV = venv
PORT = 8080
OUTPUT_DIR = output
BROWSER = "Arc"
URL = http://localhost:8080
APP_NAME ?= myapp
PLATFORM ?= ipa

# Define targets
.PHONY: all install clean run

# Default target to set up the environment and run the server
all: install run

# Install dependencies
install:
	$(PYTHON) -m venv $(VENV)
	source $(VENV)/bin/activate && $(PIP) install -r requirements.txt

# Clean the project
clean:
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pid" -delete
	find . -type f -name "*.DS_Store" -delete
	find . -type f -name "*.log" -delete
	find . -type f -name "log.html" -delete
	find . -type f -name "report.html" -delete
	find . -type f -name "output.xml" -delete
	find . -type d -name '__pycache__' -exec rm -rf {} +
	find . -type d -name 'output' -exec rm -rf {} +


push:
	git pull
	git commit -m $(msg)
	git push
	git pull
	
# Run the server
run:
	mkdir -p $(OUTPUT_DIR)
	source $(VENV)/bin/activate && python3 manage.py runserver 
	
ui:
	source $(VENV)/bin/activate && python3 main.py

server:
	mkdir -p $(OUTPUT_DIR)
	python3 manage.py runserver

build:
	flet build $(PLATFORM) --output $(OUTPUT_DIR)/$(PLATFORM)/
	
automate:
	ansible-playbook -i ansible/inventory/main.ini ansible/main.yml

# Rule to start a new Django app
app:
	python3 manage.py startapp $(APP_NAME)

doc:
	mkdocs serve
	chmod +x doc.sh
	./doc.sh html

doc_build:
	mkdocs build

# If you want to provide help or instructions
help:
	@echo "Usage: make startapp APP_NAME=<app_name>"
	@echo "Example: make startapp APP_NAME=blog"

