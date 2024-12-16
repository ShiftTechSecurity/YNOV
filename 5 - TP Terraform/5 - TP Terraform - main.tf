###############################################################################################################################################################
#####                                                                                                                                                     #####
#####    ███████╗██╗  ██╗██╗███████╗████████╗     ████████╗███████╗ ██████╗██╗  ██╗     ███████╗███████╗ ██████╗██╗   ██╗██████╗ ██╗████████╗██    ██║    #####
#####    ██╔════╝██║  ██║██║██╔════╝╚══██╔══╝     ╚══██╔══╝██╔════╝██╔════╝██║  ██║     ██╔════╝██╔════╝██╔════╝██║   ██║██╔══██╗██║╚══██╔══╝ ██  ██╔╝    #####
#####    ███████╗███████║██║██████╗    ██║           ██║   █████╗  ██║     ███████║     ███████╗█████╗  ██║     ██║   ██║██████╔╝██║   ██║     ████╔╝     #####
#####    ╚════██║██╔══██║██║██╔═══╝    ██║           ██║   ███╗    ██║     ██║  ██║     ╚════██║███╗    ██║     ██║   ██║██╔═██╗ ██║   ██║      ██╔╝      #####
#####    ███████║██║  ██║██║██║        ██║           ██║   ███████╗╚██████╗██║  ██║     ███████║███████╗╚██████╗╚██████╔╝██║  ██╗██║   ██║      ██║       #####
#####    ╚══════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝           ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝     ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝       #####
#####                                                                                                                                                     #####
###############################################################################################################################################################
# Author      : Tristan Truckle - Founder of Shift Tech Security
# Version     : 1.4
# Date        : 24-11-2024
# Subject     : Terraform Configuration for AWS VPC with Private Subnets, NAT Gateways, Auto Scaling Groups, and Load Balancer
# Description : This Terraform configuration provisions a secure, scalable, and fault-tolerant AWS infrastructure
###############################################################################################################################################################

############################################################## TERRAFORM CONFIGURATION ########################################################################

# Configure Terraform to use a remote backend (Terraform Cloud) with specified organization and workspace
terraform {
  backend "remote" {
    organization = "ShiftTechSecurity"
    workspaces {
      name = "PERSONAL"
    }
  }

  # Specify required providers and their versions
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16" # Compatible with AWS provider version 4.16 and above
    }
  }
  required_version = ">= 1.2.0" # Ensure Terraform version is 1.2.0 or newer
}

# Define the AWS provider with a specified region
provider "aws" {
  region = "eu-west-1" # AWS region: Ireland
}

# Variables for AWS credentials, marked sensitive for security
variable "AWS_ACCESS_KEY_ID" {
  type        = string
  description = "AWS access key for authentication"
  sensitive   = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "AWS secret access key for authentication"
  sensitive   = true
}

##################################################################### AWS VPCs ################################################################################

# Define a Virtual Private Cloud (VPC) with a specified CIDR block and default tenancy
resource "aws_vpc" "vpc_1" {
  cidr_block       = "10.20.0.0/16" # IP range for the VPC
  instance_tenancy = "default" # Default tenancy for instances
  tags = {
    Name        = "TTE-Terraform-VPC-1"
    Owner       = "Tristan-Truckle"
    Project     = "Terraform-ELB"
    Environment = "Test"
  }
}

############################################################### AWS Internet Gateways #########################################################################

# Create an Internet Gateway and associate it with the VPC for inbound/outbound traffic
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_1.id # Link Internet Gateway to the VPC

  tags = {
    Name        = "TTE-Terraform-VPC-1-IGW"
    Owner       = "Tristan-Truckle"
    Project     = "Terraform-ELB"
    Environment = "Test"
  }
}

#################################################################### AWS Subnets ##############################################################################

# Create a private subnet in the eu-west-1a availability zone within the VPC
resource "aws_subnet" "vpc_1_subnet_private_1" {
  vpc_id            = aws_vpc.vpc_1.id
  cidr_block        = "10.20.1.0/24" # IP range for the subnet
  availability_zone = "eu-west-1a" # Subnet location
  tags = {
    Name        = "TTE-Terraform-VPC-1-Subnet-private-1"
    Owner       = "Tristan-Truckle"
    Project     = "Terraform-ELB"
    Environment = "Test"
  }
}

# Create a private subnet in the eu-west-ba availability zone within the VPC
resource "aws_subnet" "vpc_1_subnet_private_2" {
  vpc_id            = aws_vpc.vpc_1.id
  cidr_block        = "10.20.2.0/24"
  availability_zone = "eu-west-1b"
  tags = {
    Name        = "TTE-Terraform-VPC-1-Subnet-private-2"
    Owner       = "Tristan-Truckle"
    Project     = "Terraform-ELB"
    Environment = "Test"
  }
}

# Create a private subnet in the eu-west-1c availability zone within the VPC
resource "aws_subnet" "vpc_1_subnet_private_3" {
  vpc_id            = aws_vpc.vpc_1.id
  cidr_block        = "10.20.3.0/24"
  availability_zone = "eu-west-1c"
  tags = {
    Name        = "TTE-Terraform-VPC-1-Subnet-private-3"
    Owner       = "Tristan-Truckle"
    Project     = "Terraform-ELB"
    Environment = "Test"
  }
}

################################################################## AWS Route Tables ###########################################################################

# Create a route table for the VPC with a default route to the Internet Gateway
resource "aws_route_table" "default_route_table_vpc_1" {
  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block = "0.0.0.0/0" # Route for all IPv4 traffic
    gateway_id = aws_internet_gateway.gw.id # Send traffic to Internet Gateway
  }
}

# Associate the route table with the private subnet in availability zone eu-west-1a
resource "aws_route_table_association" "default_route_vpc_1_subnet_1" {
  subnet_id      = aws_subnet.vpc_1_subnet_private_1.id
  route_table_id = aws_route_table.default_route_table_vpc_1.id
}

# Associate the route table with the private subnet in availability zone eu-west-1b
resource "aws_route_table_association" "default_route_vpc_1_subnet_2" {
  subnet_id      = aws_subnet.vpc_1_subnet_private_2.id
  route_table_id = aws_route_table.default_route_table_vpc_1.id
}

# Associate the route table with the private subnet in availability zone eu-west-1c
resource "aws_route_table_association" "default_route_vpc_1_subnet_3" {
  subnet_id      = aws_subnet.vpc_1_subnet_private_3.id
  route_table_id = aws_route_table.default_route_table_vpc_1.id
}

################################################################ AWS Security Groups ##########################################################################

# Define a security group for the load balancer to allow HTTP/HTTPS traffic
resource "aws_security_group" "security_group_lb" {
  name          = "TTE-Terraform-SecurityGroup-LB"
  description   = "Allow all HTTP & HTTPS inbound traffic and HTTP & HTTPS outbound traffic to security_group_ec2_private"
  vpc_id        = aws_vpc.vpc_1.id

  tags = {
    Name        = "TTE-Terraform-SecurityGroup-LB"
    Owner       = "Tristan-Truckle"
    Project     = "Terraform-ELB"
    Environment = "Test"
  }
}

# Inbound rules for load balancer security group
resource "aws_vpc_security_group_ingress_rule" "security_group_lb_in_allow_ipv4_tcp_80" {
  security_group_id             = aws_security_group.security_group_lb.id
  cidr_ipv4                     = "0.0.0.0/0" # Allow traffic from any IPv4 address
  from_port                     = 80          # Allow traffic from port 80 HTTP
  ip_protocol                   = "tcp" 
  to_port                       = 80  
  description                   = "Allow all inbound HTTP traffic"
}

resource "aws_vpc_security_group_ingress_rule" "security_group_lb_in_allow_ipv4_tcp_443" {
  security_group_id             = aws_security_group.security_group_lb.id
  cidr_ipv4                     = "0.0.0.0/0"   # Allow traffic from any IPv4 address
  from_port                     = 443           # Allow traffic from port 443 HTTPS
  ip_protocol                   = "tcp"
  to_port                       = 443
  description                   = "Allow all inbound HTTPS traffic"
}

# Outbound rules for load balancer security group
resource "aws_vpc_security_group_egress_rule" "security_group_lb_out_allow_ipv4_tcp_80" {
  security_group_id             = aws_security_group.security_group_lb.id
  referenced_security_group_id  = aws_security_group.security_group_ec2_private.id # Destination: EC2 security group
  from_port                     = 80            # Allow traffic from port 80 HTTP
  ip_protocol                   = "tcp"
  to_port                       = 80
  description                   = "Allow outbound HTTP traffic to security_group_ec2_private"
}

resource "aws_vpc_security_group_egress_rule" "security_group_lb_out_allow_ipv4_tcp_443" {
  security_group_id             = aws_security_group.security_group_lb.id
  referenced_security_group_id  = aws_security_group.security_group_ec2_private.id
  from_port                     = 443           # Allow traffic from port 443 HTTPS
  ip_protocol                   = "tcp"
  to_port                       = 443
  description                   = "Allow outbound HTTPS traffic to security_group_ec2_private"
}

# Define a security group for EC2 instances in the private subnet
resource "aws_security_group" "security_group_ec2_private" {
  name        = "TTE-Terraform-SecurityGroup-EC2-private"
  description = "Allow HTTP & HTTPS inbound traffic from security_group_lb and all outbound traffic"
  vpc_id      = aws_vpc.vpc_1.id

  tags = {
    Name        = "TTE-Terraform-SecurityGroup-EC2-private"
    Owner       = "Tristan-Truckle"
    Project     = "Terraform-ELB"
    Environment = "Test"
  }
}

# Inbound rules for EC2 security group
resource "aws_vpc_security_group_ingress_rule" "security_group_ec2_private_in_allow_ipv4_tcp_80" {
  security_group_id             = aws_security_group.security_group_ec2_private.id
  referenced_security_group_id  = aws_security_group.security_group_lb.id # Source: Load balancer security group
  from_port                     = 80            # Allow traffic from port 80 HTTP
  ip_protocol                   = "tcp"
  to_port                       = 80
  description                   = "Allow inbound HTTP traffic from security_group_lb"
}

resource "aws_vpc_security_group_ingress_rule" "security_group_ec2_private_in_allow_ipv4_tcp_443" {
  security_group_id             = aws_security_group.security_group_ec2_private.id
  referenced_security_group_id  = aws_security_group.security_group_lb.id
  from_port                     = 443           # Allow traffic from port 443 HTTPS
  ip_protocol                   = "tcp"
  to_port                       = 443
  description                   = "Allow inbound HTTPS traffic from security_group_lb"
}

# Outbound rule for EC2 security group to allow all traffic
resource "aws_vpc_security_group_egress_rule" "security_group_ec2_private_out_allow_all_traffic_ipv4" {
  security_group_id             = aws_security_group.security_group_ec2_private.id
  cidr_ipv4                     = "0.0.0.0/0"   # Allow traffic to any IPv4 address
  ip_protocol                   = "-1"          # Allow all protocols
  description                   = "Allow all outbound traffic"
}

################################################################# AWS Load Balancers ##########################################################################

# Defining an AWS Application Load Balancer for web servers
resource "aws_lb" "load_balancer_web_servers" {
  name               = "TTE-Terraform-LB-WebServers"              # Name of the load balancer
  internal           = false                                      # Indicates this is a public load balancer
  load_balancer_type = "application"                              # Specifies the type of load balancer
  security_groups    = [aws_security_group.security_group_lb.id]  # Security group associated with the load balancer
  subnets            = [
    aws_subnet.vpc_1_subnet_private_1.id, # Subnet 1 for the load balancer
    aws_subnet.vpc_1_subnet_private_2.id, # Subnet 2 for the load balancer
    aws_subnet.vpc_1_subnet_private_3.id  # Subnet 3 for the load balancer
  ]

  enable_deletion_protection = false  # Ensures the load balancer can be deleted if required

  tags = {
    Name        = "TTE-Terraform-LB-WebServers" # Tag: Name of the resource
    Owner       = "Tristan-Truckle"             # Tag: Owner of the resource
    Project     = "Terraform-ELB"               # Tag: Project name
    Environment = "Test"                        # Tag: Environment
  }
}

################################################################# AWS Target Groups ###########################################################################

# Creating a Target Group for the Application Load Balancer
resource "aws_lb_target_group" "target_group_lb_webservers" {
  name     = "TTE-Terraform-TG-WebServers"  # Name of the target group
  port     = 80                             # Port on which targets are listening
  protocol = "HTTP"                         # Protocol used by the target group
  vpc_id   = aws_vpc.vpc_1.id               # VPC associated with the target group

  health_check { # Configuring health check settings
    path                = "/"  # Health check endpoint
    interval            = 30   # Time in seconds between health checks
    timeout             = 5    # Time to wait for a response before timing out
    healthy_threshold   = 3    # Number of consecutive successes required to mark healthy
    unhealthy_threshold = 3    # Number of consecutive failures to mark unhealthy
  }
}

# Listener configuration for the load balancer
resource "aws_lb_listener" "listener_target_group_lb_webservers_80" {
  load_balancer_arn = aws_lb.load_balancer_web_servers.arn  # ARN of the load balancer
  port              = 80                                    # Listener port defined as 80
  protocol          = "HTTP"                                # Listener protocol defined as HTTP

  default_action { # Default action to forward requests to the target group
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_lb_webservers.arn
  }
}

################################################################# AWS Launch Templates #########################################################################

# Launch Template for EC2 instances used in Auto Scaling Groups
resource "aws_launch_template" "web_server_template" {
  name_prefix   = "TTE-WebServer-"            # Prefix for launch template name
  image_id      = "ami-08a68f1b46a0d8342"     # AMI ID for the EC2 instances
  instance_type = "t2.micro"                  # Instance type for the EC2 instances

  vpc_security_group_ids = [aws_security_group.security_group_ec2_private.id] # Security group for instances

  tag_specifications { # Tagging the instances created by this launch template
    resource_type = "instance"
    tags = {
      Name        = "TTE-Terraform-WebServer" # Tag: Name of the instance
      Owner       = "Tristan-Truckle"         # Tag: Owner
      Project     = "Terraform-ELB"           # Tag: Project
      Environment = "Test"                    # Tag: Environment
    }
  }
}

############################################################## AWS Auto-scaling groups ########################################################################

# Auto Scaling Group for Subnet 1
resource "aws_autoscaling_group" "asg_subnet_1" {
  launch_template {
    id      = aws_launch_template.web_server_template.id            # Launch template ID
    version = "$Latest"                                             # Latest version of the launch template
  }
  name                   = "TTE-Terraform-WebServer-ASG-1"                        # Name of the Auto Scaling Group
  vpc_zone_identifier    = [aws_subnet.vpc_1_subnet_private_1.id]                 # Subnet for the Auto Scaling Group
  min_size               = 1                                                      # Minimum number of instances
  max_size               = 3                                                      # Maximum number of instances
  desired_capacity       = 1                                                      # Desired number of instances
  target_group_arns      = [aws_lb_target_group.target_group_lb_webservers.arn]   # Target group for the Auto Scaling Group
  health_check_type      = "ELB"                                                  # Health check type
  health_check_grace_period = 300                                                 # Grace period for health checks

  tag { # Tags for the instances in the Auto Scaling Group
      key                 = "Name"
      value               = "TTE-Terraform-WebServer-ASG-1"
      propagate_at_launch = true
  }
  tag {
      key                 = "Owner"
      value               = "Tristan-Truckle"
      propagate_at_launch = true
   }
  tag {
      key                 = "Project"
      value               = "Terraform-ELB"
      propagate_at_launch = true
  }
  tag {
      key                 = "Environment"
      value               = "Test"
      propagate_at_launch = true
  }
  tag {
    key                   = "AutoHealing"
    value                 = "enabled"
    propagate_at_launch   = true
  }
}

# Auto Scaling Group for Subnet 2
resource "aws_autoscaling_group" "asg_subnet_2" {
  launch_template {
    id      = aws_launch_template.web_server_template.id            # Launch template ID
    version = "$Latest"                                             # Latest version of the launch template
  }

  name                   = "TTE-Terraform-WebServer-ASG-2"                        # Name of the Auto Scaling Group
  vpc_zone_identifier    = [aws_subnet.vpc_1_subnet_private_2.id]                 # Subnet for the Auto Scaling Group
  min_size               = 1                                                      # Minimum number of instances
  max_size               = 3                                                      # Maximum number of instances
  desired_capacity       = 1                                                      # Desired number of instances
  target_group_arns      = [aws_lb_target_group.target_group_lb_webservers.arn]   # Target group for the Auto Scaling Group
  health_check_type      = "ELB"                                                  # Health check type
  health_check_grace_period = 300                                                 # Grace period for health checks

  tag { # Tags for the instances in the Auto Scaling Group
      key                 = "Name"
      value               = "TTE-Terraform-WebServer-ASG-2"
      propagate_at_launch = true
  }
  tag {
      key                 = "Owner"
      value               = "Tristan-Truckle"
      propagate_at_launch = true
   }
  tag {
      key                 = "Project"
      value               = "Terraform-ELB"
      propagate_at_launch = true
  }
  tag {
      key                 = "Environment"
      value               = "Test"
      propagate_at_launch = true
  }
  tag {
    key                   = "AutoHealing"
    value                 = "enabled"
    propagate_at_launch   = true
  }
}

# Auto Scaling Group for Subnet 3
resource "aws_autoscaling_group" "asg_subnet_3" {
  launch_template {
    id      = aws_launch_template.web_server_template.id            # Launch template ID
    version = "$Latest"                                             # Latest version of the launch template
  }

  name                   = "TTE-Terraform-WebServer-ASG-3"                        # Name of the Auto Scaling Group
  vpc_zone_identifier    = [aws_subnet.vpc_1_subnet_private_3.id]                 # Subnet for the Auto Scaling Group
  min_size               = 1                                                      # Minimum number of instances
  max_size               = 3                                                      # Maximum number of instances
  desired_capacity       = 1                                                      # Desired number of instances
  target_group_arns      = [aws_lb_target_group.target_group_lb_webservers.arn]   # Target group for the Auto Scaling Group
  health_check_type      = "ELB"                                                  # Health check type
  health_check_grace_period = 300                                                 # Grace period for health checks

  tag { # Tags for the instances in the Auto Scaling Group
      key                 = "Name"
      value               = "TTE-Terraform-WebServer-ASG-3"
      propagate_at_launch = true
  }
  tag {
      key                 = "Owner"
      value               = "Tristan-Truckle"
      propagate_at_launch = true
   }
  tag {
      key                 = "Project"
      value               = "Terraform-ELB"
      propagate_at_launch = true
  }
  tag {
      key                 = "Environment"
      value               = "Test"
      propagate_at_launch = true
  }
  tag {
    key                   = "AutoHealing"
    value                 = "enabled"
    propagate_at_launch   = true
  }
}

############################################################### AWS CloudWatch Alarms #########################################################################

# Defines a CloudWatch alarm for high CPU utilization in the Auto Scaling Group of Subnet 1
resource "aws_cloudwatch_metric_alarm" "cpu_high_alarm_asg_subnet_1" {
  alarm_name          = "CPU-High-ASG-Subnet-1"
  comparison_operator = "GreaterThanThreshold"    # Triggers when metric is above the threshold
  evaluation_periods  = 2                         # Number of periods to evaluate before triggering
  metric_name         = "CPUUtilization"          # The metric to monitor
  namespace           = "AWS/EC2"                 # Namespace for EC2 metrics
  period              = 60                        # Evaluation period in seconds
  statistic           = "Average"                 # Uses average value of metric
  threshold           = 60                        # Threshold value for CPU utilization

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg_subnet_1.name # Associates the alarm with the specific Auto Scaling Group
  }

  alarm_actions = [aws_autoscaling_policy.scale_up_policy_asg_subnet_1.arn] # Action to take when alarm triggers
}

# Defines a CloudWatch alarm for low CPU utilization in the Auto Scaling Group of Subnet 1
resource "aws_cloudwatch_metric_alarm" "cpu_low_alarm_asg_subnet_1" {
  alarm_name          = "CPU-Low-ASG-Subnet-1"
  comparison_operator = "LessThanThreshold"       # Triggers when metric is below the threshold
  evaluation_periods  = 2                         # Number of periods to evaluate before triggering
  metric_name         = "CPUUtilization"          # The metric to monitor
  namespace           = "AWS/EC2"                 # Namespace for EC2 metrics
  period              = 60                        # Evaluation period in seconds
  statistic           = "Average"                 # Uses average value of metric
  threshold           = 40                        # Threshold value for CPU utilization

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg_subnet_1.name # Associates the alarm with the specific Auto Scaling Group
  }

  alarm_actions = [aws_autoscaling_policy.scale_down_policy_asg_subnet_1.arn] # Action to take when alarm triggers
}

# Defines a CloudWatch alarm for high CPU utilization in the Auto Scaling Group of Subnet 2
resource "aws_cloudwatch_metric_alarm" "cpu_high_alarm_asg_subnet_2" {
  alarm_name          = "CPU-High-ASG-Subnet-2"
  comparison_operator = "GreaterThanThreshold"    # Triggers when metric is above the threshold
  evaluation_periods  = 2                         # Number of periods to evaluate before triggering
  metric_name         = "CPUUtilization"          # The metric to monitor
  namespace           = "AWS/EC2"                 # Namespace for EC2 metrics
  period              = 60                        # Evaluation period in seconds
  statistic           = "Average"                 # Uses average value of metric
  threshold           = 60                        # Threshold value for CPU utilization

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg_subnet_2.name # Associates the alarm with the specific Auto Scaling Group
  }

  alarm_actions = [aws_autoscaling_policy.scale_up_policy_asg_subnet_2.arn] # Action to take when alarm triggers
}

# Defines a CloudWatch alarm for low CPU utilization in the Auto Scaling Group of Subnet 2
resource "aws_cloudwatch_metric_alarm" "cpu_low_alarm_asg_subnet_2" {
  alarm_name          = "CPU-Low-ASG-Subnet-2"
  comparison_operator = "LessThanThreshold"  # Triggers when metric is below the threshold
  evaluation_periods  = 2                       # Number of periods to evaluate before triggering
  metric_name         = "CPUUtilization"       # The metric to monitor
  namespace           = "AWS/EC2"             # Namespace for EC2 metrics
  period              = 60                     # Evaluation period in seconds
  statistic           = "Average"             # Uses average value of metric
  threshold           = 40                     # Threshold value for CPU utilization

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg_subnet_2.name # Associates the alarm with the specific Auto Scaling Group
  }

  alarm_actions = [aws_autoscaling_policy.scale_down_policy_asg_subnet_2.arn] # Action to take when alarm triggers
}

#Defines a CloudWatch alarm for high CPU utilization in the Auto Scaling Group of Subnet 3
resource "aws_cloudwatch_metric_alarm" "cpu_high_alarm_asg_subnet_3" {
  alarm_name          = "CPU-High-ASG-Subnet-3"
  comparison_operator = "GreaterThanThreshold" # Triggers when metric is above the threshold
  evaluation_periods  = 2                        # Number of periods to evaluate before triggering
  metric_name         = "CPUUtilization"        # The metric to monitor
  namespace           = "AWS/EC2"              # Namespace for EC2 metrics
  period              = 60                      # Evaluation period in seconds
  statistic           = "Average"              # Uses average value of metric
  threshold           = 60                      # Threshold value for CPU utilization

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg_subnet_3.name # Associates the alarm with the specific Auto Scaling Group
  }

  alarm_actions = [aws_autoscaling_policy.scale_up_policy_asg_subnet_3.arn] # Action to take when alarm triggers
}

# Defines a CloudWatch alarm for low CPU utilization in the Auto Scaling Group of Subnet 3
resource "aws_cloudwatch_metric_alarm" "cpu_low_alarm_asg_subnet_3" {
  alarm_name          = "CPU-Low-ASG-Subnet-3"
  comparison_operator = "LessThanThreshold"  # Triggers when metric is below the threshold
  evaluation_periods  = 2                       # Number of periods to evaluate before triggering
  metric_name         = "CPUUtilization"       # The metric to monitor
  namespace           = "AWS/EC2"             # Namespace for EC2 metrics
  period              = 60                     # Evaluation period in seconds
  statistic           = "Average"             # Uses average value of metric
  threshold           = 40                     # Threshold value for CPU utilization

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg_subnet_3.name # Associates the alarm with the specific Auto Scaling Group
  }

  alarm_actions = [aws_autoscaling_policy.scale_down_policy_asg_subnet_3.arn] # Action to take when alarm triggers
}

############################################################# AWS Auto-scaling policies #######################################################################

# Defines a scaling policy to increase capacity for the Auto Scaling Group of subnet 1
resource "aws_autoscaling_policy" "scale_up_policy_asg_subnet_1" {
  name                   = "Scale-Up-ASG-Subnet-1"
  scaling_adjustment     = 1                                        # Increases instance count by 1
  adjustment_type        = "ChangeInCapacity"                       # Specifies the adjustment type
  cooldown               = 300                                      # Cooldown period in seconds before next scaling action
  autoscaling_group_name = aws_autoscaling_group.asg_subnet_1.name  # References the Auto Scaling Group
}

# Defines a scaling policy to decrease capacity for the Auto Scaling Group of subnet 1
resource "aws_autoscaling_policy" "scale_down_policy_asg_subnet_1" {
  name                   = "Scale-Down-ASG-Subnet-1"
  scaling_adjustment     = -1                                       # Decreases instance count by 1
  adjustment_type        = "ChangeInCapacity"                       # Specifies the adjustment type
  cooldown               = 300                                      # Cooldown period in seconds before next scaling action
  autoscaling_group_name = aws_autoscaling_group.asg_subnet_1.name  # References the Auto Scaling Group
}

# Defines a scaling policy to increase capacity for the Auto Scaling Group of subnet 2
resource "aws_autoscaling_policy" "scale_up_policy_asg_subnet_2" {
  name                   = "Scale-Up-ASG-Subnet-2"
  scaling_adjustment     = 1                                        # Increases instance count by 1
  adjustment_type        = "ChangeInCapacity"                       # Specifies the adjustment type
  cooldown               = 300                                      # Cooldown period in seconds before next scaling action
  autoscaling_group_name = aws_autoscaling_group.asg_subnet_2.name  # References the Auto Scaling Group
}

# Defines a scaling policy to decrease capacity for the Auto Scaling Group of subnet 2
resource "aws_autoscaling_policy" "scale_down_policy_asg_subnet_2" {
  name                   = "Scale-Down-ASG-Subnet-2"
  scaling_adjustment     = -1                                       # Decreases instance count by 1
  adjustment_type        = "ChangeInCapacity"                       # Specifies the adjustment type
  cooldown               = 300                                      # Cooldown period in seconds before next scaling action
  autoscaling_group_name = aws_autoscaling_group.asg_subnet_2.name  # References the Auto Scaling Group
}

# Defines a scaling policy to increase capacity for the Auto Scaling Group of subnet 3
resource "aws_autoscaling_policy" "scale_up_policy_asg_subnet_3" {
  name                   = "Scale-Up-ASG-Subnet-3"
  scaling_adjustment     = 1                                        # Increases instance count by 1
  adjustment_type        = "ChangeInCapacity"                       # Specifies the adjustment type
  cooldown               = 300                                      # Cooldown period in seconds before next scaling action
  autoscaling_group_name = aws_autoscaling_group.asg_subnet_3.name  # References the Auto Scaling Group
}

# Defines a scaling policy to decrease capacity for the Auto Scaling Group of subnet 3
resource "aws_autoscaling_policy" "scale_down_policy_asg_subnet_3" {
  name                   = "Scale-Down-ASG-Subnet-3"
  scaling_adjustment     = -1                                       # Decreases instance count by 1
  adjustment_type        = "ChangeInCapacity"                       # Specifies the adjustment type
  cooldown               = 300                                      # Cooldown period in seconds before next scaling action
  autoscaling_group_name = aws_autoscaling_group.asg_subnet_3.name  # References the Auto Scaling Group
}