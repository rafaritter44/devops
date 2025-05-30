import pytest
from app import app

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_root(client):
    response = client.get('/')
    assert response.status_code == 200
    assert b"Hello, World!" in response.data

def test_metrics(client):
    response = client.get('/metrics')
    assert response.status_code == 200
    assert b"flask_app_request_count" in response.data
