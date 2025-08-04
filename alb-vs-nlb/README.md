# ALB vs. NLB

## ALB

- OSI layer: 7.
- Target types: IP addresses, instances, and AWS Lambda.
- Protocols: HTTP, HTTPS, and gRPC.
- Algorithm: Round-robin.
- Use cases: Microservices, containers, and web apps.

## NLB

- OSI layer: 4.
- Target types: IP addresses, instances, and ALBs.
- Protocols: TCP, UDP, and TLS.
- Algorithm: Flow hash.
- Use cases: Games, media streaming, and IoT.

## References

- https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html
- https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html
- https://aws.amazon.com/compare/the-difference-between-the-difference-between-application-network-and-gateway-load-balancing/
- https://aws.amazon.com/what-is/osi-model/