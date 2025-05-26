# Deployment System

## Cluster setup

### Kind setup

`$ kind create cluster`

### OpenTofu setup

`$ cd infra`

`$ tofu init`

`$ tofu apply`

## Accessing App 1

### Deploy App 1

1. Log in to Docker (`$ docker login`).
2. Import App 1's Jenkinsfile into Jenkins.
3. Run the Jenkins pipeline.

### Port-forward App 1 service

`$ kubectl port-forward svc/app-1 8080:80 -n apps`

### Call App 1 endpoints

#### Hello endpoint

`$ curl localhost:8080`

#### Metrics endpoint

`$ curl localhost:8080/metrics`

## Accessing Grafana

### Retrieve Grafana admin password

`$ kubectl get secret grafana -n infra -o jsonpath="{.data.admin-password}" | base64 --decode && echo`

### Port-forward Grafana service

`$ kubectl port-forward svc/grafana 3000:80 -n infra`

### Open Grafana UI

Visit `http://localhost:3000`.

## Accessing Prometheus

### Port-forward Prometheus service

`$ kubectl port-forward svc/prometheus-server 9090:80 -n infra`

### Open Prometheus UI

Visit `http://localhost:9090`.