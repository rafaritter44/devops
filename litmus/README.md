# Litmus

## What is Litmus?

- An open-source Chaos Engineering platform for Kubernetes.
- Provides pre-built Chaos Experiments.
    - Pod delete.
    - Pod CPU hog.
    - Network latency.
    - Node drain.
- And a web UI (ChaosCenter).

## Architecture

User -> ChaosCenter/UI -> Chaos Engine (CRD) -> Chaos Runner Pod -> Inject Faults into Target App

## POC

...