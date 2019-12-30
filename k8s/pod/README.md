## Pod + NodePort

Create and expose:

`$ kubectl create -f helloworld.yml`

`$ kubectl create -f helloworld-nodeport-service.yml`

Describe:

`$ minikube service helloworld-service --url`

Delete:

`$ kubectl delete service helloworld-service`

`$ kubectl delete pod nodehelloworld.example.com`
