# Node.js Kubernetes Deployment and Service

## Commands used
- `$ docker build -t rafaritter44/nodejs .`
- `$ docker login`
- `$ docker push rafaritter44/nodejs`
- `$ minikube start`
- `$ kubectl apply -f specs/deployment.yaml`
- `$ kubectl apply -f specs/service.yaml`
- `$ minikube service nodejs-service --url`

## Checking resources
- `$ kubectl get deployments`
- `$ kubectl rollout status deployment.v1.apps/nodejs-deployment`
- `$ kubectl get rs`
- `$ kubectl get pods --show-labels`
- `$ kubectl get services`
- `$ kubectl describe services nodejs-service`

## Cleaning up
- `$ kubectl delete service nodejs-service`
- `$ kubectl delete deployment nodejs-deployment`
- `$ minikube stop`