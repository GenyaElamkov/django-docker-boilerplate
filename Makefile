DC = docker-compose
STORAGES_FILE = docker_compose/storages.yaml
LOGS = docker logs
EXEC = docker exec -it
DB_CONTAINER = example-db
ENV = --env-file .env
APP_FILE = docker_compose/app.yaml
APP_CONTAINER = main-app
MANAGE_PY = python manage.py 


.PHONY: storages
storages:
	$(DC) -f $(STORAGES_FILE) $(ENV) up -d

.PHONY: storages-down
storages-down:
	$(DC) -f $(STORAGES_FILE) $(ENV) down

.PHONY: storages-logs
storages-logs:
	$(LOGS) $(DB_CONTAINER) -f

.PHONY: postgres
postgres:
	$(EXEC) $(DB_CONTAINER) psql

.PHONY: app
app:
	$(DC) -f $(APP_FILE) -f $(STORAGES_FILE) $(ENV) up -d

.PHONY: app-logs
app-logs:
	$(LOGS) $(APP_CONTAINER) -f 

.PHONY: app-down
app-down:
	$(DC) -f $(APP_FILE) -f $(STORAGES_FILE) $(ENV) down

.PHONY: migrate
migrate:
	$(EXEC) $(APP_CONTAINER) $(MANAGE_PY) migrate 

.PHONY: migrations
migrations:
	$(EXEC) $(APP_CONTAINER) $(MANAGE_PY) makemigrations  

.PHONY: superuser
superuser:
	$(EXEC) $(APP_CONTAINER) $(MANAGE_PY) createsuperuser  

.PHONY: collectstatic
collectstatic:
	$(EXEC) $(APP_CONTAINER) $(MANAGE_PY) collectstatic 


