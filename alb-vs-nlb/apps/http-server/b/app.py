from flask import Flask
import socket

app = Flask(__name__)

@app.route('/health')
def health():
    return 'OK', 200

@app.route('/b')
def b():
    return f"Hello from app B on {socket.gethostname()}"