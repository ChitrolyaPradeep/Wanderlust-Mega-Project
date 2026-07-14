variable "aws_region" {
  description = "AWS region where resources will be provisioned"
  default     = "us-west-2"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-02167eae61967e403"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "m7i-flex.large"
}

variable "ingress_ports" {
  type    = list(number)
  default = [22, 80, 443, 465, 25, 6443, 6379]
}

variable "ingress_rules" {
  description = "Ingress port ranges"

  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    cidr      = string
  }))

  default = [
    {
      from_port = 3000
      to_port   = 10000
      protocol  = "tcp"
      cidr      = "0.0.0.0/0"
    },
    {
      from_port = 30000
      to_port   = 32767
      protocol  = "tcp"
      cidr      = "0.0.0.0/0"
    }
  ]
}
