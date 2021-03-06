## Deployment

Create and expose:

`$ kubectl create -f helloworld.yml`

`$ kubectl expose deployment helloworld-deployment --type=NodePort`

Describe:

`$ kubectl describe service helloworld-deployment`

`$ minikube service helloworld-deployment --url`

Update image:

`$ kubectl set image deployment/helloworld-deployment k8s-demo=rafaritter44/k8s-demo:2`

Check history:

`$ kubectl rollout history deployment/helloworld-deployment`

Rollback:

`$ kubectl rollout undo deployment/helloworld-deployment`

Delete:

`$ kubectl delete service helloworld-deployment`

`$ kubectl delete deployment helloworld-deployment`
