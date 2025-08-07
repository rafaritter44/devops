from flask import Flask
import socket

app = Flask(__name__)

@app.route('/health')
def health():
    return 'OK', 200

@app.route('/a')
def a():
    return f"Hello from app A on {socket.gethostname()}"