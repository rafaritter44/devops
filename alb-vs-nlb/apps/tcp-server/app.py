
import socket
import threading
import os

HOST = '0.0.0.0' # Listen on all interfaces.
PORT = 6000

def handle_client(conn, addr):
    hostname = os.uname().nodename
    print(f"[{hostname}] New connection from {addr}")
    try:
        while True:
            data = conn.recv(1024)
            if not data:
                break
            response = f"Echo from {hostname}: {data.decode()}".encode()
            conn.sendall(response)
    finally:
        conn.close()
        print(f"[{hostname}] Closed connection from {addr}")

def main():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind((HOST, PORT))
        s.listen()
        print(f"TCP server listening on {HOST}:{PORT}")
        while True:
            conn, addr = s.accept()
            thread = threading.Thread(target=handle_client, args=(conn, addr), daemon=True)
            thread.start()

if __name__ == "__main__":
    main()