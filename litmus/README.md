# Litmus

## What is Litmus?

- An open-source Chaos Engineering platform for Kubernetes.
- Provides pre-built Chaos Experiments.
    - Pod delete.
    - Pod CPU hog.
    - Network latency.
    - Node drain.
- And a web UI (ChaosCenter).

## Concepts

Chaos Scenario
Chaos Experiment

## Architecture

User -> ChaosCenter/UI -> Chaos Engine (CRD) -> Chaos Runner Pod -> Inject Faults into Target App

## POC

```shell
kind create cluster
helm repo add litmuschaos https://litmuschaos.github.io/litmus-helm/
kubectl create ns litmus
helm install chaos litmuschaos/litmus --namespace=litmus --set portal.frontend.service.type=NodePort --set portal.server.graphqlServer.CHAOS_CENTER_UI_ENDPOINT=http://chaos-litmus-frontend-service.litmus.svc.cluster.local:9091 --set mongodb.image.registry=docker.io --set mongodb.image.repository=bitnami/mongodb --set mongodb.image.tag=latest --set mongodb.auth.enabled=true --set mongodb.auth.rootPassword=password
kubectl port-forward svc/chaos-litmus-frontend-service -n litmus 9091:9091
kind delete cluster
```

## Trade-offs

Litmus
- 2019
- Open-source
- Kubernetes

Other tools
- Chaos Monkey (pioneer, open-sourced in 2012)
- Gremlin (commercial tool, 2017)
- AWS FIS (2021)
- Chaos Mesh (open-source, K8s, 2019)

Litmus vs. Chaos Mesh
- Chaos Mesh
    - Fault Injector
    - Simpler
    - Best for debugging
    - Requires scripting
- Litmus
    - Chaos Platform/Orchestrator
    - More complex
    - Best for pipelines