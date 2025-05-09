from flask import Flask, Response
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST

app = Flask(__name__)

REQUEST_COUNT = Counter(
    'flask_app_request_count', 
    'Total number of requests to the Flask app',
    ['method', 'endpoint']
)

@app.route('/')
def hello():
    REQUEST_COUNT.labels(method='GET', endpoint='/').inc()
    return "Hello!"

@app.route('/metrics')
def metrics():
    """
    The endpoint that Prometheus will scrape.
    """
    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)