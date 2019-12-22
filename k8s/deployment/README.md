## Deployment

Create and expose:

`$ kubectl create -f helloworld.yml`

`$ kubectl expose deployment helloworld-deployment --type=NodePort`

Describe:

`$ kubectl describe service helloworld-deployment`

`$ minikube service helloworld-deployment --url`

Delete:

`$ kubectl delete service helloworld-deployment`

`$ kubectl delete deployment helloworld-deployment`
