#variable "aws_secret_key" {}
#variable "aws_access_key" {}


# Defining which AWS region is used for our EC2 instances.
variable "aws_region" {
  type        = string
  default     = "eu-west-2"
  description = "Define which region should be selected to create ec2 instance"
}

# create VPC variables
variable "cluster_name" {
  type        = string
  default     = "assignment-eks"
  description = "Define a name for EKS cluster"
}

variable "iac_environment_tag" {
  type        = string
  default     = "dev"
  description = "Indicate environment name"
}

variable "name_prefix" {
  type        = string
  default     = "assignment"
  description = "Prefix to be used on each infrastructure object Name created in AWS"
}

variable "main_network_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Base CIDR block to be used in our VPC."
}

variable "subnet_prefix_extension" {
  type        = number
  default     = 4
  description = "CIDR block bits extension to calculate CIDR blocks of each subnet"
}

variable "zone_offset" {
  type        = number
  default     = 8
  description = "CIDR block bits extension offset to calculate Public subnets, avoiding collisions with Private subnets"
}

# create EKS variables
variable "admin_users" {
  type        = list(string)
  default     = ["meysam-adm"]
  description = "List of Kubernetes admins"
}

variable "developer_users" {
  type        = list(string)
  default     = ["meysam-dev"]
  description = "List of Kubernetes developers"
}

variable "asg_instance_types" {
  type        = list(string)
  default     = ["t3.small", "t2.small"]
  description = "List of EC2 instance machine types to be used in EKS"
}

variable "autoscaling_minimum_size_by_az" {
  type        = number
  default     = 1
  description = "Minimum number of EC2 instances to autoscale our EKS cluster on each AZ"
}

variable "autoscaling_maximum_size_by_az" {
  type        = number
  default     = 3
  description = "Maximum number of EC2 instances to autoscale our EKS cluster on each AZ"
}

variable "autoscaling_average_cpu" {
  type        = number
  default     = 60
  description = "Average CPU threshold to autoscale EKS EC2 instances"
}

# Ref: https://github.com/aws/aws-node-termination-handler
variable "spot_termination_handler_chart_name" {
  type        = string
  default     = "aws-node-termination-handler"
  description = "EKS Spot termination handler Helm chart name"
}

variable "spot_termination_handler_chart_repo" {
  type        = string
  default     = "https://aws.github.io/eks-charts"
  description = "EKS Spot termination handler Helm repository name"
}

variable "spot_termination_handler_chart_version" {
  type        = string
  default     = "0.13.3"
  description = "EKS Spot termination handler Helm chart version"
}

variable "spot_termination_handler_chart_namespace" {
  type        = string
  default     = "kube-system"
  description = "Kubernetes namespace to deploy EKS Spot termination handler Helm chart"
}


