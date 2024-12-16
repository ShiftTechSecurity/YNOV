
Application local navigation
The page navigation is complete. You may now navigate the page content as you wish.
Skip to main content

    Workspaces
    PERSONAL
    Overview
    Runs
    States
    Variables
    Settings

    ShiftTechSecurity
    Workspaces
    PERSONAL
    Runs
    run-nKejUcGWwWT1s8pg

PERSONAL

ID:

Add workspace description.
Running
Resources 0
Terraform
v1.9.8
Updated a few seconds ago
Triggered via CLI
CURRENT
Planned

Pending confirmation

Less than a minute

Resources to be changed

+37 ~0 -0
 
 
 
 
Started a few seconds ago > Finished a few seconds ago

Terraform v1.9.8
on linux_amd64
Initializing plugins and modules...

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_autoscaling_group.asg_subnet_1 will be created
  + resource "aws_autoscaling_group" "asg_subnet_1" {
      + arn                       = (known after apply)
      + availability_zones        = (known after apply)
      + default_cooldown          = (known after apply)
      + desired_capacity          = 1
      + force_delete              = false
      + force_delete_warm_pool    = false
      + health_check_grace_period = 300
      + health_check_type         = "ELB"
      + id                        = (known after apply)
      + max_size                  = 3
      + metrics_granularity       = "1Minute"
      + min_size                  = 1
      + name                      = "TTE-Terraform-WebServer-ASG-1"
      + name_prefix               = (known after apply)
      + predicted_capacity        = (known after apply)
      + protect_from_scale_in     = false
      + service_linked_role_arn   = (known after apply)
      + target_group_arns         = (known after apply)
      + vpc_zone_identifier       = (known after apply)
      + wait_for_capacity_timeout = "10m"
      + warm_pool_size            = (known after apply)

      + launch_template {
          + id      = (known after apply)
          + name    = (known after apply)
          + version = "$Latest"
        }

      + tag {
          + key                 = "AutoHealing"
          + propagate_at_launch = true
          + value               = "enabled"
        }
      + tag {
          + key                 = "Environment"
          + propagate_at_launch = true
          + value               = "Test"
        }
      + tag {
          + key                 = "Name"
          + propagate_at_launch = true
          + value               = "TTE-Terraform-WebServer-ASG-1"
        }
      + tag {
          + key                 = "Owner"
          + propagate_at_launch = true
          + value               = "Tristan-Truckle"
        }
      + tag {
          + key                 = "Project"
          + propagate_at_launch = true
          + value               = "Terraform-ELB"
        }
    }

  # aws_autoscaling_group.asg_subnet_2 will be created
  + resource "aws_autoscaling_group" "asg_subnet_2" {
      + arn                       = (known after apply)
      + availability_zones        = (known after apply)
      + default_cooldown          = (known after apply)
      + desired_capacity          = 1
      + force_delete              = false
      + force_delete_warm_pool    = false
      + health_check_grace_period = 300
      + health_check_type         = "ELB"
      + id                        = (known after apply)
      + max_size                  = 3
      + metrics_granularity       = "1Minute"
      + min_size                  = 1
      + name                      = "TTE-Terraform-WebServer-ASG-2"
      + name_prefix               = (known after apply)
      + predicted_capacity        = (known after apply)
      + protect_from_scale_in     = false
      + service_linked_role_arn   = (known after apply)
      + target_group_arns         = (known after apply)
      + vpc_zone_identifier       = (known after apply)
      + wait_for_capacity_timeout = "10m"
      + warm_pool_size            = (known after apply)

      + launch_template {
          + id      = (known after apply)
          + name    = (known after apply)
          + version = "$Latest"
        }

      + tag {
          + key                 = "AutoHealing"
          + propagate_at_launch = true
          + value               = "enabled"
        }
      + tag {
          + key                 = "Environment"
          + propagate_at_launch = true
          + value               = "Test"
        }
      + tag {
          + key                 = "Name"
          + propagate_at_launch = true
          + value               = "TTE-Terraform-WebServer-ASG-2"
        }
      + tag {
          + key                 = "Owner"
          + propagate_at_launch = true
          + value               = "Tristan-Truckle"
        }
      + tag {
          + key                 = "Project"
          + propagate_at_launch = true
          + value               = "Terraform-ELB"
        }
    }

  # aws_autoscaling_group.asg_subnet_3 will be created
  + resource "aws_autoscaling_group" "asg_subnet_3" {
      + arn                       = (known after apply)
      + availability_zones        = (known after apply)
      + default_cooldown          = (known after apply)
      + desired_capacity          = 1
      + force_delete              = false
      + force_delete_warm_pool    = false
      + health_check_grace_period = 300
      + health_check_type         = "ELB"
      + id                        = (known after apply)
      + max_size                  = 3
      + metrics_granularity       = "1Minute"
      + min_size                  = 1
      + name                      = "TTE-Terraform-WebServer-ASG-3"
      + name_prefix               = (known after apply)
      + predicted_capacity        = (known after apply)
      + protect_from_scale_in     = false
      + service_linked_role_arn   = (known after apply)
      + target_group_arns         = (known after apply)
      + vpc_zone_identifier       = (known after apply)
      + wait_for_capacity_timeout = "10m"
      + warm_pool_size            = (known after apply)

      + launch_template {
          + id      = (known after apply)
          + name    = (known after apply)
          + version = "$Latest"
        }

      + tag {
          + key                 = "AutoHealing"
          + propagate_at_launch = true
          + value               = "enabled"
        }
      + tag {
          + key                 = "Environment"
          + propagate_at_launch = true
          + value               = "Test"
        }
      + tag {
          + key                 = "Name"
          + propagate_at_launch = true
          + value               = "TTE-Terraform-WebServer-ASG-3"
        }
      + tag {
          + key                 = "Owner"
          + propagate_at_launch = true
          + value               = "Tristan-Truckle"
        }
      + tag {
          + key                 = "Project"
          + propagate_at_launch = true
          + value               = "Terraform-ELB"
        }
    }

  # aws_autoscaling_policy.scale_down_policy_asg_subnet_1 will be created
  + resource "aws_autoscaling_policy" "scale_down_policy_asg_subnet_1" {
      + adjustment_type         = "ChangeInCapacity"
      + arn                     = (known after apply)
      + autoscaling_group_name  = "TTE-Terraform-WebServer-ASG-1"
      + cooldown                = 300
      + enabled                 = true
      + id                      = (known after apply)
      + metric_aggregation_type = (known after apply)
      + name                    = "Scale-Down-ASG-Subnet-1"
      + policy_type             = "SimpleScaling"
      + scaling_adjustment      = -1
    }

  # aws_autoscaling_policy.scale_down_policy_asg_subnet_2 will be created
  + resource "aws_autoscaling_policy" "scale_down_policy_asg_subnet_2" {
      + adjustment_type         = "ChangeInCapacity"
      + arn                     = (known after apply)
      + autoscaling_group_name  = "TTE-Terraform-WebServer-ASG-2"
      + cooldown                = 300
      + enabled                 = true
      + id                      = (known after apply)
      + metric_aggregation_type = (known after apply)
      + name                    = "Scale-Down-ASG-Subnet-2"
      + policy_type             = "SimpleScaling"
      + scaling_adjustment      = -1
    }

  # aws_autoscaling_policy.scale_down_policy_asg_subnet_3 will be created
  + resource "aws_autoscaling_policy" "scale_down_policy_asg_subnet_3" {
      + adjustment_type         = "ChangeInCapacity"
      + arn                     = (known after apply)
      + autoscaling_group_name  = "TTE-Terraform-WebServer-ASG-3"
      + cooldown                = 300
      + enabled                 = true
      + id                      = (known after apply)
      + metric_aggregation_type = (known after apply)
      + name                    = "Scale-Down-ASG-Subnet-3"
      + policy_type             = "SimpleScaling"
      + scaling_adjustment      = -1
    }

  # aws_autoscaling_policy.scale_up_policy_asg_subnet_1 will be created
  + resource "aws_autoscaling_policy" "scale_up_policy_asg_subnet_1" {
      + adjustment_type         = "ChangeInCapacity"
      + arn                     = (known after apply)
      + autoscaling_group_name  = "TTE-Terraform-WebServer-ASG-1"
      + cooldown                = 300
      + enabled                 = true
      + id                      = (known after apply)
      + metric_aggregation_type = (known after apply)
      + name                    = "Scale-Up-ASG-Subnet-1"
      + policy_type             = "SimpleScaling"
      + scaling_adjustment      = 1
    }

  # aws_autoscaling_policy.scale_up_policy_asg_subnet_2 will be created
  + resource "aws_autoscaling_policy" "scale_up_policy_asg_subnet_2" {
      + adjustment_type         = "ChangeInCapacity"
      + arn                     = (known after apply)
      + autoscaling_group_name  = "TTE-Terraform-WebServer-ASG-2"
      + cooldown                = 300
      + enabled                 = true
      + id                      = (known after apply)
      + metric_aggregation_type = (known after apply)
      + name                    = "Scale-Up-ASG-Subnet-2"
      + policy_type             = "SimpleScaling"
      + scaling_adjustment      = 1
    }

  # aws_autoscaling_policy.scale_up_policy_asg_subnet_3 will be created
  + resource "aws_autoscaling_policy" "scale_up_policy_asg_subnet_3" {
      + adjustment_type         = "ChangeInCapacity"
      + arn                     = (known after apply)
      + autoscaling_group_name  = "TTE-Terraform-WebServer-ASG-3"
      + cooldown                = 300
      + enabled                 = true
      + id                      = (known after apply)
      + metric_aggregation_type = (known after apply)
      + name                    = "Scale-Up-ASG-Subnet-3"
      + policy_type             = "SimpleScaling"
      + scaling_adjustment      = 1
    }

  # aws_cloudwatch_metric_alarm.cpu_high_alarm_asg_subnet_1 will be created
  + resource "aws_cloudwatch_metric_alarm" "cpu_high_alarm_asg_subnet_1" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_name                            = "CPU-High-ASG-Subnet-1"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanThreshold"
      + dimensions                            = {
          + "AutoScalingGroupName" = "TTE-Terraform-WebServer-ASG-1"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 2
      + id                                    = (known after apply)
      + metric_name                           = "CPUUtilization"
      + namespace                             = "AWS/EC2"
      + period                                = 60
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 60
      + treat_missing_data                    = "missing"
    }

  # aws_cloudwatch_metric_alarm.cpu_high_alarm_asg_subnet_2 will be created
  + resource "aws_cloudwatch_metric_alarm" "cpu_high_alarm_asg_subnet_2" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_name                            = "CPU-High-ASG-Subnet-2"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanThreshold"
      + dimensions                            = {
          + "AutoScalingGroupName" = "TTE-Terraform-WebServer-ASG-2"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 2
      + id                                    = (known after apply)
      + metric_name                           = "CPUUtilization"
      + namespace                             = "AWS/EC2"
      + period                                = 60
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 60
      + treat_missing_data                    = "missing"
    }

  # aws_cloudwatch_metric_alarm.cpu_high_alarm_asg_subnet_3 will be created
  + resource "aws_cloudwatch_metric_alarm" "cpu_high_alarm_asg_subnet_3" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_name                            = "CPU-High-ASG-Subnet-3"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanThreshold"
      + dimensions                            = {
          + "AutoScalingGroupName" = "TTE-Terraform-WebServer-ASG-3"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 2
      + id                                    = (known after apply)
      + metric_name                           = "CPUUtilization"
      + namespace                             = "AWS/EC2"
      + period                                = 60
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 60
      + treat_missing_data                    = "missing"
    }

  # aws_cloudwatch_metric_alarm.cpu_low_alarm_asg_subnet_1 will be created
  + resource "aws_cloudwatch_metric_alarm" "cpu_low_alarm_asg_subnet_1" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_name                            = "CPU-Low-ASG-Subnet-1"
      + arn                                   = (known after apply)
      + comparison_operator                   = "LessThanThreshold"
      + dimensions                            = {
          + "AutoScalingGroupName" = "TTE-Terraform-WebServer-ASG-1"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 2
      + id                                    = (known after apply)
      + metric_name                           = "CPUUtilization"
      + namespace                             = "AWS/EC2"
      + period                                = 60
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 40
      + treat_missing_data                    = "missing"
    }

  # aws_cloudwatch_metric_alarm.cpu_low_alarm_asg_subnet_2 will be created
  + resource "aws_cloudwatch_metric_alarm" "cpu_low_alarm_asg_subnet_2" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_name                            = "CPU-Low-ASG-Subnet-2"
      + arn                                   = (known after apply)
      + comparison_operator                   = "LessThanThreshold"
      + dimensions                            = {
          + "AutoScalingGroupName" = "TTE-Terraform-WebServer-ASG-2"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 2
      + id                                    = (known after apply)
      + metric_name                           = "CPUUtilization"
      + namespace                             = "AWS/EC2"
      + period                                = 60
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 40
      + treat_missing_data                    = "missing"
    }

  # aws_cloudwatch_metric_alarm.cpu_low_alarm_asg_subnet_3 will be created
  + resource "aws_cloudwatch_metric_alarm" "cpu_low_alarm_asg_subnet_3" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_name                            = "CPU-Low-ASG-Subnet-3"
      + arn                                   = (known after apply)
      + comparison_operator                   = "LessThanThreshold"
      + dimensions                            = {
          + "AutoScalingGroupName" = "TTE-Terraform-WebServer-ASG-3"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 2
      + id                                    = (known after apply)
      + metric_name                           = "CPUUtilization"
      + namespace                             = "AWS/EC2"
      + period                                = 60
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 40
      + treat_missing_data                    = "missing"
    }

  # aws_internet_gateway.gw will be created
  + resource "aws_internet_gateway" "gw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-VPC-1-IGW"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
      + tags_all = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-VPC-1-IGW"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
      + vpc_id   = (known after apply)
    }

  # aws_launch_template.web_server_template will be created
  + resource "aws_launch_template" "web_server_template" {
      + arn                    = (known after apply)
      + default_version        = (known after apply)
      + id                     = (known after apply)
      + image_id               = "ami-08a68f1b46a0d8342"
      + instance_type          = "t2.micro"
      + latest_version         = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "TTE-WebServer-"
      + tags_all               = (known after apply)
      + vpc_security_group_ids = (known after apply)

      + metadata_options (known after apply)

      + tag_specifications {
          + resource_type = "instance"
          + tags          = {
              + "Environment" = "Test"
              + "Name"        = "TTE-Terraform-WebServer"
              + "Owner"       = "Tristan-Truckle"
              + "Project"     = "Terraform-ELB"
            }
        }
    }

  # aws_lb.load_balancer_web_servers will be created
  + resource "aws_lb" "load_balancer_web_servers" {
      + arn                                         = (known after apply)
      + arn_suffix                                  = (known after apply)
      + desync_mitigation_mode                      = "defensive"
      + dns_name                                    = (known after apply)
      + drop_invalid_header_fields                  = false
      + enable_deletion_protection                  = false
      + enable_http2                                = true
      + enable_tls_version_and_cipher_suite_headers = false
      + enable_waf_fail_open                        = false
      + enable_xff_client_port                      = false
      + id                                          = (known after apply)
      + idle_timeout                                = 60
      + internal                                    = false
      + ip_address_type                             = (known after apply)
      + load_balancer_type                          = "application"
      + name                                        = "TTE-Terraform-LB-WebServers"
      + preserve_host_header                        = false
      + security_groups                             = (known after apply)
      + subnets                                     = (known after apply)
      + tags                                        = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-LB-WebServers"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
      + tags_all                                    = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-LB-WebServers"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
      + vpc_id                                      = (known after apply)
      + xff_header_processing_mode                  = "append"
      + zone_id                                     = (known after apply)

      + subnet_mapping (known after apply)
    }

  # aws_lb_listener.listener_target_group_lb_webservers_80 will be created
  + resource "aws_lb_listener" "listener_target_group_lb_webservers_80" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + load_balancer_arn = (known after apply)
      + port              = 80
      + protocol          = "HTTP"
      + ssl_policy        = (known after apply)
      + tags_all          = (known after apply)

      + default_action {
          + order            = (known after apply)
          + target_group_arn = (known after apply)
          + type             = "forward"
        }
    }

  # aws_lb_target_group.target_group_lb_webservers will be created
  + resource "aws_lb_target_group" "target_group_lb_webservers" {
      + arn                                = (known after apply)
      + arn_suffix                         = (known after apply)
      + connection_termination             = false
      + deregistration_delay               = "300"
      + id                                 = (known after apply)
      + ip_address_type                    = (known after apply)
      + lambda_multi_value_headers_enabled = false
      + load_balancing_algorithm_type      = (known after apply)
      + load_balancing_cross_zone_enabled  = (known after apply)
      + name                               = "TTE-Terraform-TG-WebServers"
      + port                               = 80
      + preserve_client_ip                 = (known after apply)
      + protocol                           = "HTTP"
      + protocol_version                   = (known after apply)
      + proxy_protocol_v2                  = false
      + slow_start                         = 0
      + tags_all                           = (known after apply)
      + target_type                        = "instance"
      + vpc_id                             = (known after apply)

      + health_check {
          + enabled             = true
          + healthy_threshold   = 3
          + interval            = 30
          + matcher             = (known after apply)
          + path                = "/"
          + port                = "traffic-port"
          + protocol            = "HTTP"
          + timeout             = 5
          + unhealthy_threshold = 3
        }

      + stickiness (known after apply)

      + target_failover (known after apply)
    }

  # aws_route_table.default_route_table_vpc_1 will be created
  + resource "aws_route_table" "default_route_table_vpc_1" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + gateway_id                 = (known after apply)
                # (12 unchanged attributes hidden)
            },
        ]
      + tags_all         = (known after apply)
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.default_route_vpc_1_subnet_1 will be created
  + resource "aws_route_table_association" "default_route_vpc_1_subnet_1" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.default_route_vpc_1_subnet_2 will be created
  + resource "aws_route_table_association" "default_route_vpc_1_subnet_2" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.default_route_vpc_1_subnet_3 will be created
  + resource "aws_route_table_association" "default_route_vpc_1_subnet_3" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.security_group_ec2_private will be created
  + resource "aws_security_group" "security_group_ec2_private" {
      + arn                    = (known after apply)
      + description            = "Allow HTTP & HTTPS inbound traffic from security_group_lb and all outbound traffic"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "TTE-Terraform-SecurityGroup-EC2-private"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-SecurityGroup-EC2-private"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
      + tags_all               = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-SecurityGroup-EC2-private"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.security_group_lb will be created
  + resource "aws_security_group" "security_group_lb" {
      + arn                    = (known after apply)
      + description            = "Allow all HTTP & HTTPS inbound traffic and HTTP & HTTPS outbound traffic to security_group_ec2_private"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "TTE-Terraform-SecurityGroup-LB"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-SecurityGroup-LB"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
      + tags_all               = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-SecurityGroup-LB"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.vpc_1_subnet_private_1 will be created
  + resource "aws_subnet" "vpc_1_subnet_private_1" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "eu-west-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.20.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-VPC-1-Subnet-private-1"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
      + tags_all                                       = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-VPC-1-Subnet-private-1"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.vpc_1_subnet_private_2 will be created
  + resource "aws_subnet" "vpc_1_subnet_private_2" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "eu-west-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.20.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-VPC-1-Subnet-private-2"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
      + tags_all                                       = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-VPC-1-Subnet-private-2"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.vpc_1_subnet_private_3 will be created
  + resource "aws_subnet" "vpc_1_subnet_private_3" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "eu-west-1c"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.20.3.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-VPC-1-Subnet-private-3"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
      + tags_all                                       = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-VPC-1-Subnet-private-3"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.vpc_1 will be created
  + resource "aws_vpc" "vpc_1" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.20.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_classiclink                   = (known after apply)
      + enable_classiclink_dns_support       = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-VPC-1"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
      + tags_all                             = {
          + "Environment" = "Test"
          + "Name"        = "TTE-Terraform-VPC-1"
          + "Owner"       = "Tristan-Truckle"
          + "Project"     = "Terraform-ELB"
        }
    }

  # aws_vpc_security_group_egress_rule.security_group_ec2_private_out_allow_all_traffic_ipv4 will be created
  + resource "aws_vpc_security_group_egress_rule" "security_group_ec2_private_out_allow_all_traffic_ipv4" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "0.0.0.0/0"
      + description            = "Allow all outbound traffic"
      + id                     = (known after apply)
      + ip_protocol            = "-1"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags_all               = {}
    }

  # aws_vpc_security_group_egress_rule.security_group_lb_out_allow_ipv4_tcp_443 will be created
  + resource "aws_vpc_security_group_egress_rule" "security_group_lb_out_allow_ipv4_tcp_443" {
      + arn                          = (known after apply)
      + description                  = "Allow outbound HTTPS traffic to security_group_ec2_private"
      + from_port                    = 443
      + id                           = (known after apply)
      + ip_protocol                  = "tcp"
      + referenced_security_group_id = (known after apply)
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {}
      + to_port                      = 443
    }

  # aws_vpc_security_group_egress_rule.security_group_lb_out_allow_ipv4_tcp_80 will be created
  + resource "aws_vpc_security_group_egress_rule" "security_group_lb_out_allow_ipv4_tcp_80" {
      + arn                          = (known after apply)
      + description                  = "Allow outbound HTTP traffic to security_group_ec2_private"
      + from_port                    = 80
      + id                           = (known after apply)
      + ip_protocol                  = "tcp"
      + referenced_security_group_id = (known after apply)
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {}
      + to_port                      = 80
    }

  # aws_vpc_security_group_ingress_rule.security_group_ec2_private_in_allow_ipv4_tcp_443 will be created
  + resource "aws_vpc_security_group_ingress_rule" "security_group_ec2_private_in_allow_ipv4_tcp_443" {
      + arn                          = (known after apply)
      + description                  = "Allow inbound HTTPS traffic from security_group_lb"
      + from_port                    = 443
      + id                           = (known after apply)
      + ip_protocol                  = "tcp"
      + referenced_security_group_id = (known after apply)
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {}
      + to_port                      = 443
    }

  # aws_vpc_security_group_ingress_rule.security_group_ec2_private_in_allow_ipv4_tcp_80 will be created
  + resource "aws_vpc_security_group_ingress_rule" "security_group_ec2_private_in_allow_ipv4_tcp_80" {
      + arn                          = (known after apply)
      + description                  = "Allow inbound HTTP traffic from security_group_lb"
      + from_port                    = 80
      + id                           = (known after apply)
      + ip_protocol                  = "tcp"
      + referenced_security_group_id = (known after apply)
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {}
      + to_port                      = 80
    }

  # aws_vpc_security_group_ingress_rule.security_group_lb_in_allow_ipv4_tcp_443 will be created
  + resource "aws_vpc_security_group_ingress_rule" "security_group_lb_in_allow_ipv4_tcp_443" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "0.0.0.0/0"
      + description            = "Allow all inbound HTTPS traffic"
      + from_port              = 443
      + id                     = (known after apply)
      + ip_protocol            = "tcp"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags_all               = {}
      + to_port                = 443
    }

  # aws_vpc_security_group_ingress_rule.security_group_lb_in_allow_ipv4_tcp_80 will be created
  + resource "aws_vpc_security_group_ingress_rule" "security_group_lb_in_allow_ipv4_tcp_80" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "0.0.0.0/0"
      + description            = "Allow all inbound HTTP traffic"
      + from_port              = 80
      + id                     = (known after apply)
      + ip_protocol            = "tcp"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags_all               = {}
      + to_port                = 80
    }

Plan: 37 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + elb_dns_name = (known after apply)

Sentinel mocks can be used for testing your Sentinel policies
Apply pending
Please review the following changes before continuing:
 
 
 
 

To create

+ 37
Choosing "Confirm & apply" below will execute the above changes.
Please review the plan output before proceeding.

        Support
        Terms
        Privacy
        Security
        Accessibility

© 2024 HashiCorp
