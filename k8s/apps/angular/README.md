# Angular Kubernetes Deployment and Service

## Commands used
- `$ docker build -t rafaritter44/angular .`
- `$ docker login`
- `$ docker push rafaritter44/angular`
- `$ minikube start`
- `$ kubectl apply -f specs/deployment.yaml`
- `$ kubectl apply -f specs/service.yaml`
- `$ minikube service angular-service --url`

## Checking resources
- `$ kubectl get deployments`
- `$ kubectl rollout status deployment.v1.apps/angular-deployment`
- `$ kubectl get rs`
- `$ kubectl get pods --show-labels`
- `$ kubectl get services`
- `$ kubectl describe services angular-service`

## Cleaning up
- `$ kubectl delete service angular-service`
- `$ kubectl delete deployment angular-deployment`
- `$ minikube stop`
