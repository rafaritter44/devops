# App 1

## Local setup

`$ python3 -m venv venv`

`$ source venv/bin/activate`

`$ pip3 install -r requirements-dev.txt`

## Running

`$ gunicorn -w 4 app:app`

## Making requests

`$ curl localhost:8000`

## Viewing Prometheus metrics

`$ curl localhost:8000/metrics`