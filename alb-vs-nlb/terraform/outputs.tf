output "http_server_a_public_ips" {
  description = "Public IPs of HTTP Server A instances"
  value       = aws_instance.http_server_a[*].public_ip
}

output "http_server_b_public_ip" {
  description = "Public IP of HTTP Server B instance"
  value       = aws_instance.http_server_b.public_ip
}

output "tcp_server_public_ips" {
  description = "Public IPs of TCP Server instances"
  value       = aws_instance.tcp_server[*].public_ip
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.alb.dns_name
}

output "nlb_dns_name" {
  description = "DNS name of the Network Load Balancer"
  value       = aws_lb.nlb.dns_name
}