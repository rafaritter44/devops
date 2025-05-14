# App 1

## Local setup

`$ python3 -m venv venv`

`$ source venv/bin/activate`

`$ pip3 install -r requirements-dev.txt`

## Running

### Locally

`$ gunicorn app:app`

### In Docker

`$ docker build -t app-1 .`

`$ docker run --rm -p 8000:8000 app-1`

## Making requests

`$ curl localhost:8000`

## Viewing Prometheus metrics

`$ curl localhost:8000/metrics`

## Running tests

`$ pytest`