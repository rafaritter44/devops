# Netty Kubernetes Deployment and Service

## Commands used
- `$ docker build -t rafaritter44/netty .`
- `$ docker login`
- `$ docker push rafaritter44/netty`
- `$ minikube start`
- `$ kubectl apply -f specs/deployment.yaml`
- `$ kubectl apply -f specs/service.yaml`
- `$ minikube service netty-service --url`

## Checking resources
- `$ kubectl get deployments`
- `$ kubectl rollout status deployment.v1.apps/netty-deployment`
- `$ kubectl get rs`
- `$ kubectl get pods --show-labels`
- `$ kubectl get services`
- `$ kubectl describe services netty-service`

## Cleaning up
- `$ kubectl delete service netty-service`
- `$ kubectl delete deployment netty-deployment`
- `$ minikube stop`