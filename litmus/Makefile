.PHONY: create-cluster install-litmus deploy-app run-chaos destroy

create-cluster:
	kind create cluster

install-litmus: create-cluster
	helm repo add litmuschaos https://litmuschaos.github.io/litmus-helm/
	helm install litmus litmuschaos/litmus -n litmus --create-namespace

deploy-app: install-litmus
	kubectl apply -f nginx.yaml

run-chaos: deploy-app
	kubectl apply -f chaos-engine.yaml

destroy:
	kind delete cluster