create-cluster:
	kind create cluster

install-litmus:
	helm install litmus litmuschaos/litmus -n litmus --create-namespace

deploy-app:
	kubectl apply -f nginx.yaml

run-chaos:
	kubectl apply -f chaos-engine.yaml

destroy:
	kind delete cluster