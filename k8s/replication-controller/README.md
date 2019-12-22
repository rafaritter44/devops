## ReplicationController

Create:

`$ kubectl create -f helloworld-controller.yml`

Test scaling:

`$ kubectl get pods`

`$ kubectl delete pod ${pod_name}`

Change scaling:

`$ kubectl scale --replicas=${num_of_replicas} rc/helloworld-controller`

Delete:

`$ kubectl delete rc/helloworld-controller`
