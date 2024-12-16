
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
Unlocked
Resources 37
Terraform
v1.9.8
Updated a minute ago
Triggered via CLI
CURRENT
Applied

Plan & apply duration

4 minutes

Resources changed

+37 ~0 -0
 
 
 
 
Started 4 minutes ago > Finished a minute ago

Terraform v1.9.8
on linux_amd64
Initializing plugins and modules...
aws_vpc.vpc_1: Creating...
aws_vpc.vpc_1: Creation complete after 2s [id=vpc-0cd9a6389ca431ae3]
aws_internet_gateway.gw: Creating...
aws_subnet.vpc_1_subnet_private_3: Creating...
aws_subnet.vpc_1_subnet_private_1: Creating...
aws_lb_target_group.target_group_lb_webservers: Creating...
aws_security_group.security_group_lb: Creating...
aws_subnet.vpc_1_subnet_private_2: Creating...
aws_security_group.security_group_ec2_private: Creating...
aws_subnet.vpc_1_subnet_private_2: Creation complete after 1s [id=subnet-0e53861d269d3959a]
aws_subnet.vpc_1_subnet_private_3: Creation complete after 1s [id=subnet-05066161bcc4c680b]
aws_subnet.vpc_1_subnet_private_1: Creation complete after 1s [id=subnet-07ee6e30b29254f8c]
aws_internet_gateway.gw: Creation complete after 1s [id=igw-0400fcfedf6cdd20a]
aws_route_table.default_route_table_vpc_1: Creating...
aws_lb_target_group.target_group_lb_webservers: Creation complete after 1s [id=arn:aws:elasticloadbalancing:eu-west-1:590183894337:targetgroup/TTE-Terraform-TG-WebServers/c1e51d42d0cfeaae]
aws_route_table.default_route_table_vpc_1: Creation complete after 1s [id=rtb-053d524e4c57dbb2a]
aws_route_table_association.default_route_vpc_1_subnet_2: Creating...
aws_route_table_association.default_route_vpc_1_subnet_1: Creating...
aws_route_table_association.default_route_vpc_1_subnet_3: Creating...
aws_security_group.security_group_lb: Creation complete after 2s [id=sg-05e46bcfbabe5cd6d]
aws_lb.load_balancer_web_servers: Creating...
aws_vpc_security_group_ingress_rule.security_group_lb_in_allow_ipv4_tcp_80: Creating...
aws_vpc_security_group_ingress_rule.security_group_lb_in_allow_ipv4_tcp_443: Creating...
aws_route_table_association.default_route_vpc_1_subnet_2: Creation complete after 0s [id=rtbassoc-0c00c24bc1ed17e6a]
aws_security_group.security_group_ec2_private: Creation complete after 2s [id=sg-0713abb186e6a1118]
aws_launch_template.web_server_template: Creating...
aws_vpc_security_group_egress_rule.security_group_lb_out_allow_ipv4_tcp_80: Creating...
aws_vpc_security_group_egress_rule.security_group_ec2_private_out_allow_all_traffic_ipv4: Creating...
aws_vpc_security_group_ingress_rule.security_group_ec2_private_in_allow_ipv4_tcp_443: Creating...
aws_vpc_security_group_egress_rule.security_group_lb_out_allow_ipv4_tcp_443: Creating...
aws_route_table_association.default_route_vpc_1_subnet_1: Creation complete after 0s [id=rtbassoc-060369e32cf394174]
aws_route_table_association.default_route_vpc_1_subnet_3: Creation complete after 0s [id=rtbassoc-09f1af8c1f959231e]
aws_vpc_security_group_ingress_rule.security_group_ec2_private_in_allow_ipv4_tcp_80: Creating...
aws_vpc_security_group_ingress_rule.security_group_lb_in_allow_ipv4_tcp_80: Creation complete after 1s [id=sgr-0fae622235aae6bc9]
aws_vpc_security_group_ingress_rule.security_group_lb_in_allow_ipv4_tcp_443: Creation complete after 1s [id=sgr-065e34796362dbd62]
aws_vpc_security_group_egress_rule.security_group_lb_out_allow_ipv4_tcp_443: Creation complete after 1s [id=sgr-052bbfb83dcf8a7e9]
aws_launch_template.web_server_template: Creation complete after 1s [id=lt-0c5f575f426a11d93]
aws_vpc_security_group_ingress_rule.security_group_ec2_private_in_allow_ipv4_tcp_80: Creation complete after 1s [id=sgr-025d1f29c158612a8]
aws_vpc_security_group_egress_rule.security_group_lb_out_allow_ipv4_tcp_80: Creation complete after 1s [id=sgr-08cf49449915ef6c7]
aws_vpc_security_group_egress_rule.security_group_ec2_private_out_allow_all_traffic_ipv4: Creation complete after 1s [id=sgr-077f526ccc6c480bc]
aws_autoscaling_group.asg_subnet_1: Creating...
aws_autoscaling_group.asg_subnet_2: Creating...
aws_autoscaling_group.asg_subnet_3: Creating...
aws_vpc_security_group_ingress_rule.security_group_ec2_private_in_allow_ipv4_tcp_443: Creation complete after 1s [id=sgr-0d38becff172caf14]
aws_lb.load_balancer_web_servers: Still creating... [10s elapsed]
aws_autoscaling_group.asg_subnet_1: Still creating... [10s elapsed]
aws_autoscaling_group.asg_subnet_2: Still creating... [10s elapsed]
aws_autoscaling_group.asg_subnet_3: Still creating... [10s elapsed]
aws_autoscaling_group.asg_subnet_1: Creation complete after 10s [id=TTE-Terraform-WebServer-ASG-1]
aws_autoscaling_policy.scale_down_policy_asg_subnet_1: Creating...
aws_autoscaling_policy.scale_up_policy_asg_subnet_1: Creating...
aws_autoscaling_group.asg_subnet_2: Creation complete after 10s [id=TTE-Terraform-WebServer-ASG-2]
aws_autoscaling_policy.scale_down_policy_asg_subnet_2: Creating...
aws_autoscaling_policy.scale_up_policy_asg_subnet_2: Creating...
aws_autoscaling_policy.scale_down_policy_asg_subnet_1: Creation complete after 0s [id=Scale-Down-ASG-Subnet-1]
aws_autoscaling_policy.scale_up_policy_asg_subnet_1: Creation complete after 0s [id=Scale-Up-ASG-Subnet-1]
aws_cloudwatch_metric_alarm.cpu_low_alarm_asg_subnet_1: Creating...
aws_cloudwatch_metric_alarm.cpu_high_alarm_asg_subnet_1: Creating...
aws_autoscaling_policy.scale_up_policy_asg_subnet_2: Creation complete after 1s [id=Scale-Up-ASG-Subnet-2]
aws_cloudwatch_metric_alarm.cpu_high_alarm_asg_subnet_2: Creating...
aws_autoscaling_policy.scale_down_policy_asg_subnet_2: Creation complete after 1s [id=Scale-Down-ASG-Subnet-2]
aws_cloudwatch_metric_alarm.cpu_low_alarm_asg_subnet_2: Creating...
aws_cloudwatch_metric_alarm.cpu_low_alarm_asg_subnet_1: Creation complete after 1s [id=CPU-Low-ASG-Subnet-1]
aws_cloudwatch_metric_alarm.cpu_high_alarm_asg_subnet_1: Creation complete after 1s [id=CPU-High-ASG-Subnet-1]
aws_cloudwatch_metric_alarm.cpu_high_alarm_asg_subnet_2: Creation complete after 0s [id=CPU-High-ASG-Subnet-2]
aws_cloudwatch_metric_alarm.cpu_low_alarm_asg_subnet_2: Creation complete after 0s [id=CPU-Low-ASG-Subnet-2]
aws_autoscaling_group.asg_subnet_3: Creation complete after 16s [id=TTE-Terraform-WebServer-ASG-3]
aws_autoscaling_policy.scale_up_policy_asg_subnet_3: Creating...
aws_autoscaling_policy.scale_down_policy_asg_subnet_3: Creating...
aws_autoscaling_policy.scale_down_policy_asg_subnet_3: Creation complete after 1s [id=Scale-Down-ASG-Subnet-3]
aws_cloudwatch_metric_alarm.cpu_low_alarm_asg_subnet_3: Creating...
aws_autoscaling_policy.scale_up_policy_asg_subnet_3: Creation complete after 1s [id=Scale-Up-ASG-Subnet-3]
aws_cloudwatch_metric_alarm.cpu_high_alarm_asg_subnet_3: Creating...
aws_cloudwatch_metric_alarm.cpu_low_alarm_asg_subnet_3: Creation complete after 0s [id=CPU-Low-ASG-Subnet-3]
aws_cloudwatch_metric_alarm.cpu_high_alarm_asg_subnet_3: Creation complete after 0s [id=CPU-High-ASG-Subnet-3]
aws_lb.load_balancer_web_servers: Still creating... [20s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [30s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [40s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [50s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [1m0s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [1m10s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [1m20s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [1m30s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [1m40s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [1m50s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [2m0s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [2m10s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [2m20s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [2m30s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [2m40s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [2m50s elapsed]
aws_lb.load_balancer_web_servers: Still creating... [3m0s elapsed]
aws_lb.load_balancer_web_servers: Creation complete after 3m4s [id=arn:aws:elasticloadbalancing:eu-west-1:590183894337:loadbalancer/app/TTE-Terraform-LB-WebServers/1896bbe5e9806076]
aws_lb_listener.listener_target_group_lb_webservers_80: Creating...
aws_lb_listener.listener_target_group_lb_webservers_80: Creation complete after 0s [id=arn:aws:elasticloadbalancing:eu-west-1:590183894337:listener/app/TTE-Terraform-LB-WebServers/1896bbe5e9806076/577bfeb47930eb1c]

Apply complete! Resources: 37 added, 0 changed, 0 destroyed.

Outputs:

elb_dns_name = "TTE-Terraform-LB-WebServers-1718995089.eu-west-1.elb.amazonaws.com"

State versions created:

    ShiftTechSecurity/PERSONAL#sv-G5vF8NmXKGe9MQ5B (Nov 25, 2024 15:54:05 pm)

ttristan
ttristan 5 minutes ago
Run confirmed
Comment
Leave feedback or record a decision.

        Support
        Terms
        Privacy
        Security
        Accessibility

© 2024 HashiCorp
