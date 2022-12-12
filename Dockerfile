FROM python:latest

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY ./requirements.txt tmp/requirements.txt
RUN pip install -r tmp/requirements.txt

RUN mkdir /django_app
WORKDIR /django_app
COPY . .

RUN adduser django_user
RUN chown django_user /django_app
# USER django_user