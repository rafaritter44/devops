from flask import Flask
from werkzeug.middleware.dispatcher import DispatcherMiddleware
from prometheus_client import make_wsgi_app, Counter

app = Flask(__name__)

app.wsgi_app = DispatcherMiddleware(app.wsgi_app, {
    '/metrics': make_wsgi_app()
})

REQUEST_COUNT = Counter(
    'flask_app_request_count', 
    'Total number of requests to the Flask app.',
    ['method', 'endpoint']
)

@app.route('/')
def hello():
    REQUEST_COUNT.labels(method='GET', endpoint='/').inc()
    return "Hello!"