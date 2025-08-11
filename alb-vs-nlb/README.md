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

### Code

- [Apps](apps)
- [Terraform](terraform)

### Output of `tofu apply`

![Output of tofu apply](images/tofu-apply-output.png)

### ALB: Path-based routing

![Path-based routing](images/path-based-routing.png)

### ALB: Round-robin algorithm

![Round-robin](images/round-robin.png)

### NLB: TCP handling

![TCP handling](images/tcp-handling.png)

### NLB: Flow hash algorithm

**From my local machine**

![Flow hash from my local machine](images/flow-hash-local.png)

**Connected to a VPN**

![Flow hash connected to a VPN](images/flow-hash-vpn.png)

### Latency comparison

![Latency comparison](images/latency-comparison.png)

### Health checks

**ALB**

![ALB health checks](images/alb-health-checks.png)

**NLB**

![NLB health checks](images/nlb-health-checks.png)

## References

- https://aws.amazon.com/compare/the-difference-between-the-difference-between-application-network-and-gateway-load-balancing/
- https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/how-elastic-load-balancing-works.html