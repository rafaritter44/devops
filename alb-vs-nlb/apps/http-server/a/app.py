from flask import Flask
import socket
import os
import threading

app = Flask(__name__)

@app.route('/health')
def health():
    return 'OK', 200

@app.route('/a')
def a():
    return f"Hello from app A on {socket.gethostname()}"

@app.route("/shutdown", methods=["POST"])
def shutdown():
    threading.Timer(1.0, lambda: os._exit(0)).start()
    return "Shutting down..."