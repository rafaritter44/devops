# ALB vs. NLB

## ELB components

![ELB components](images/elb-components.png)

## Comparison table

|                  | ALB                                     | NLB                             |
|------------------|-----------------------------------------|---------------------------------|
| **OSI layer**    | 7                                       | 4                               |
| **Target types** | IP, instance, and Lambda                | IP, instance, and ALB           |
| **Protocols**    | HTTP, HTTPS, and gRPC                   | TCP, UDP, and TLS               |
| **Algorithm**    | Round-robin                             | Flow hash                       |
| **Use cases**    | Microservices, containers, and web apps | Games, media streaming, and IoT |

## POCs

1. Path-based routing (ALB only)
2. TCP handling
3. Latency (curl -w)
4. Health checks
5. Algorithms

## References

- https://aws.amazon.com/compare/the-difference-between-the-difference-between-application-network-and-gateway-load-balancing/
- https://aws.amazon.com/what-is/osi-model/