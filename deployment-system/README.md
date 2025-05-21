# Deployment System

## Setup

### Kind setup

`$ kind create cluster`

### OpenTofu setup

`$ cd infra`

`$ tofu init`

`$ tofu apply`

## Accessing App 1

### Port-forward App 1 service

`$ kubectl port-forward svc/app-1 8080:80 -n apps`

### Call App 1 endpoints

#### Hello endpoint

`$ curl localhost:8080`

#### Metrics endpoint

`$ curl localhost:8080/metrics`

## Accessing Jenkins

### Retrieve Jenkins admin password

`$ kubectl get secret --namespace infra jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode && echo`

### Port-forward Jenkins service

`$ kubectl port-forward svc/jenkins 8080:8080 -n infra`

### Open Jenkins UI

Visit `http://localhost:8080`.

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