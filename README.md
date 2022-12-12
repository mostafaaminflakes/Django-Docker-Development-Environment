## Django Docker Development Environment

Using Docker Compose to set up and run a simple containerized Django app. It provide a starting point for how to integrate different services using a Compose file and to manage their deployment with Docker Compose.

> Before starting, make sure that you have Docker and Docker Compose installed.

The compose file defines an application with two services `web` and `db`. When deploying the application, docker compose maps port 8000 of the web service container to port 8000 of the host as specified in the file.

## Create the container

1. Clone the repo

```
git clone https://github.com/mostafaaminflakes/Django-Docker-Development-Environment.git
cd Django-Docker-Development-Environment
```

2. Build the container

```
docker compose build
```

3. Create a Django project

```
docker compose run --rm web django-admin startproject project1 .
```

4. Connect the database

    In this section, you set up the database connection for Django.

    - In your project directory, edit the `app/project1/settings.py` file.
    - Replace the `DATABASES = ...` with the following:

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'dj1',
        'USER': 'root',
        'PASSWORD': '123456',
        'HOST':'db',
        'PORT':'3306',
    }
}
```

These settings are determined by the MySQL Docker image specified in `docker-compose.yml`.

5. Deploy with docker compose

```
$ docker compose up -d
```

6. Run Django migrations

Execute the following commands to access the `web` container in interactive mode and execute the migrations.

```
docker exec -it web /bin/bash
python manage.py migrate
```

At this point, your Django app should be running at port 8000 on your Docker host. Navigate to `http://localhost:8000` on a web browser to see the Django welcome page.

# Stop and remove the containers

```
$ docker compose down
```
