variable "cluster_name" {
  default = "tanisha.k8s.local"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "master_count" {
  default = 1
}

variable "worker_count" {
  default = 1
}

variable "master_instance_type" {
  default = "t2.medium"
}

variable "worker_instance_type" {
  default = "t2.medium"
}

