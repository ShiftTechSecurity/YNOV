<<<<<<< HEAD
=======

![Alt text](Images/Pasted%20image%2020241107113744.png)

>>>>>>> e8075d96c778d935dcb46f7e5525608c99e6b376
## Partie 1 : Création d'un Load Balancer (LB)

1. Créer un Target Group “TRI_TargetGroup”. Par la suite, vous ajouterez les instances EC2 dans ce Target Group

- Confirmation de la création de la Target Group "TTE-TargetGroup"
![Alt text](Images/Pasted%20image%2020241107113744.png)

1. Créer un Load Balancer “TRI_LoadBalancer” de type Application Load Balancer qui utilise le Target Group créé précédemment

- Confirmation de la création du Load Balancer "TTE-LoadBalancer"
![Alt text](Images/Pasted%20image%2020241107122048.png)

3. Créer un Security Group “TRI_SecurityGroup_LB” et appliquer ce groupe de sécurité sur le Load Balancer créé précédemment.

- Confirmation de la création de la Security Group "TTE-SecurityGroup-LB"
![Alt text](Images/Pasted%20image%2020241107114151.png)

- Confirmation de l'application de la Security Group "TTE-SecurityGroup-LB" sur le Load Balancer "TTE-LoadBalancer"
![Alt text](Images/Pasted%20image%2020241107114225.png)

## Partie 2 : Création d’une Amazon Machine Image (AMI)

1. Lancer une instance EC2 de base : Utilisez une AMI standard, telle qu'Amazon Linux 2.

- Confirmation de la création de l'instance "TTE-AmazonLinux2"
![Alt text](Images/Pasted%20image%2020241107114316.png)

2. Installer un serveur web

- Commande pour la connexion au serveur web depuis PowerShell
```
ssh -i "TTE-KeyPair.pem" ec2-user@ec2-34-244-251-111.eu-west-1.compute.amazonaws.com
```

- Confirmation de la connexion SSH au serveur
![Alt text](Images/Pasted%20image%2020241107114428.png)

- Commande pour l'installation du serveur Web
```
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
```

- Confirmation de l'installation du serveur Web
![Alt text](Images/Pasted%20image%2020241107114529.png)

3. Créer un script pour récupérer et afficher les métadonnées

- Commandes pour la création du script de récupération des métadonnées
```
## Création et modification du script metadata.sh
sudo nano /var/www/html/metadata.sh

## Texte à insérer dans metadata.sh
#!/bin/bash
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token"
-H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id > /var/www/html/index.html

## Rendre le script metadata.sh executable
sudo chmod +x /var/www/html/metadata.sh
```

- Confirmation de l'ajout du contenu du script metadata.sh
![Alt text](Images/Pasted%20image%2020241107123811.png)

- Confirmation de l'exécution de commande chmod pour rendre exécutable le script metadata.sh
![Alt text](Images/Pasted%20image%2020241107114623.png)

4. Automatiser l'exécution du script au démarrage

- Commandes pour l'Installation de crontab
```
sudo yum install cronie -y
sudo systemctl enable crond.service
sudo systemctl start crond.service
sudo systemctl status crond.service
```

- Confirmation de l'installation de crontab
![Alt text](Images/Pasted%20image%2020241107114705.png)

- Commandes pour changer le mot de passe root et se connecter avec le compte root pour permettre l'accès à crontab
```
## Change root password via sudo
sudo passwd root
# Insert Password here

## Connect with root user
su root
# Insert Password here
```

- Confirmation du modification du mot de passe root, et connexion avec l'utilisateur root
![Alt text](Images/Pasted%20image%2020241107114751.png)

- Commandes pour la création d'une crontab pour l'exécution du script au démarrage
```
## Exécution de crontab
crontab -e
## Ligne à insérer dans crontab
@reboot /var/www/html/metadata.sh
## Comment quitter crontab
# Echap + :x + Entrée
```

- Confirmation de l'ajout de la ligne dans crontab
![Alt text](Images/Pasted%20image%2020241107114815.png)

5. Créer une AMI personnalisée

- Confirmation de la création de l'AMI personnalisée "TTE-MyFirstAMI"
![Alt text](Images/Pasted%20image%2020241107114858.png)

## Partie 3 : Création de la première instance EC2 et configuration des security groups

1. Créer un Security Group “TRI_SecurityGroup_EC2” et ajouter votre instance créée précédemment à ce Security Group

- Confirmation de la création de la Security Group "TTE-SecurityGroup-EC2"
![Alt text](Images/Pasted%20image%2020241107122536.png)

- Confirmation de l'ajout de la Security Group à l'instance "TTE-LinuxAmazon2"
![Alt text](Images/Pasted%20image%2020241107115242.png)

2. Créer une instance EC2 “TRI_Instance1” qui utilise le Security Group “TRI_SecurityGroup_EC2” et l’AMI créée précédemment.

- Confirmation de la création de l'instance "TTE-Instance1"
![Alt text](Images/Pasted%20image%2020241107120340.png)

- Confirmation de la configuration de la Security Group "TTE-SecurityGroup-EC2" sur l'instance "TTE-Instance1"
![Alt text](Images/Pasted%20image%2020241107120422.png)

3. Vérifier qu’en utilisant l’adresse de votre LoadBalancer dans un navigateur, vous accédez bien au serveur web et aux métadonnées de votre instance EC2

- Confirmation de la bonne santé de la cible d'instance "TTE-Instance1"
![Alt text](Images/Pasted%20image%2020241107122825.png)

- Confirmation de l'accès à l'instance "TTE-Instance1" via le Load Balancer "TTE-LoadBalancer"
![Alt text](Images/Pasted%20image%2020241107133547.png)

## Partie 4 : Installation de l'AWS CLI et ajout d’une seconde instance

1. Installer et configurer l’AWS CLI sur votre ordinateur

- Commandes pour l'installation de AWS CLI sur Windows
```
## Installation 
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi

## Vérification de la version de AWS CLI en confirmation de l'installation
aws --version
```

- Confirmation de l'installation de AWS CLI
![Alt text](Images/Pasted%20image%2020241107134005.png)

- Confirmation de la création d'une access key pour l'accès via AWS CLI
![Alt text](Images/Pasted%20image%2020241107135553.png)

- Commande pour la configuration de AWS CLI via l'invité de commande
```
aws configure
```

- Confirmation de la configuration de AWS CLI via l'invité de commande
![Alt text](Images/Pasted%20image%2020241107135730.png)

- Commande pour vérifier la connexion à AWS via AWS CLI
```
aws sts get-caller-identity
```

- Confirmation de la connexion à AWS via AWS CLI
![Alt text](Images/Pasted%20image%2020241107140000.png)

2. Utiliser l’AWS CLI pour créer une seconde instance similaire à la première nommée “TRI_Instance 2”

- Commandes pour la création de la nouvelle instance "TTE-Instance2"
```
aws ec2 run-instances \
--image-id ami-071704f4b7d386ed9 \
--instance-type t2.micro \
--subnet-id subnet-0655f72c900baddc5 \
--security-group-ids sg-041717cd0ac551e87 \
--key-name TTE-KeyPair \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=TTE-Instance2}]"
```

- Résultat de la commande de création d'instance 
```
{
    "ReservationId": "r-0dbeb10c8287470f3",
    "OwnerId": "149028371915",
    "Groups": [],
    "Instances": [
        {
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "3e14f992-183d-430d-bf0d-298fcd5ff57e",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2024-11-07T13:03:35+00:00",
                        "AttachmentId": "eni-attach-0231cb2adba1e005c",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupId": "sg-041717cd0ac551e87",
                            "GroupName": "TTE-SecurityGroup-EC2"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:b2:26:6f:52:59",
                    "NetworkInterfaceId": "eni-036fa92aa11c0a3ab",
                    "OwnerId": "149028371915",
                    "PrivateDnsName": "ip-172-31-30-133.eu-west-1.compute.internal",
                    "PrivateIpAddress": "172.31.30.133",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-30-133.eu-west-1.compute.internal",
                            "PrivateIpAddress": "172.31.30.133"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0655f72c900baddc5",
                    "VpcId": "vpc-0035b5ae8bbbefd3f",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-041717cd0ac551e87",
                    "GroupName": "TTE-SecurityGroup-EC2"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "TTE-Instance2"
                }
            ],
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            },
            "MetadataOptions": {
                "State": "pending",
                "HttpTokens": "required",
                "HttpPutResponseHopLimit": 2,
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "BootMode": "uefi-preferred",
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            },
            "CurrentInstanceBootMode": "legacy-bios",
            "InstanceId": "i-0ffe5ba936aa758bb",
            "ImageId": "ami-071704f4b7d386ed9",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "PrivateDnsName": "ip-172-31-30-133.eu-west-1.compute.internal",
            "PublicDnsName": "",
            "StateTransitionReason": "",
            "KeyName": "TTE-KeyPair",
            "AmiLaunchIndex": 0,
            "ProductCodes": [],
            "InstanceType": "t2.micro",
            "LaunchTime": "2024-11-07T13:03:35+00:00",
            "Placement": {
                "GroupName": "",
                "Tenancy": "default",
                "AvailabilityZone": "eu-west-1c"
            },
            "Monitoring": {
                "State": "disabled"
            },
            "SubnetId": "subnet-0655f72c900baddc5",
            "VpcId": "vpc-0035b5ae8bbbefd3f",
            "PrivateIpAddress": "172.31.30.133"
        }
    ]
}
```

- Confirmation de la création de l'instance via le GUI de AWS
![Alt text](Images/Pasted%20image%2020241107140723.png)

3. Utiliser l’AWS CLI pour ajouter cette instance au Target Group créé dans la partie 1 du TP


- Commande pour ajouter la nouvelle instance "TTE-Instance2" dans la target group "TTE-TargetGroup" avec une recherche par tag
```
## Recherche de l'instance ID de "TTE-Intance2"
for /f %i in ('aws ec2 describe-instances --filters "Name=tag:Name,Values=TTE-Instance2" --query "Reservations[*].Instances[*].InstanceId" --output text') do set INSTANCE_ID=%i

## Ajout de l'instance "TTE-Instance2" dans la Target Group "TTE-TargetGroup"
aws elbv2 register-targets --target-group-arn arn:aws:elasticloadbalancing:eu-west-1:149028371915:targetgroup/TTE-TargetGroup/86aa1b9bb967b533 --targets Id=%INSTANCE_ID%
```

- Confirmation de l'exécution des commandes pour l'ajout au Target Group "TTE-TargetGroup"
![Alt text](Images/Pasted%20image%2020241107141152.png)

- Confirmation de l'ajout de l'instance "TTE-Instance2" dans la Target Group "TTE-TargetGroup"
![Alt text](Images/Pasted%20image%2020241107141744.png)

- Vérification de la Ressource Map du Load Balancer "TTE-LoadBalancer"
![Alt text](Images/Pasted%20image%2020241107141939.png)

4. En utilisant l’adresse de votre Load Balancer, en rafraîchissant et en supprimant le cache de votre navigateur (ou en utilisant le mode privé du navigateur), vous devez observer la répartition de vos requêtes s’opérer.

- Confirmation du bon fonctionnement du Load Balancer via navigateur internet
![Alt text](Images/Pasted%20image%2020241107141844.png)

- Monitoring du Load Balancer "TTE-LoadBalancer"
![Alt text](Images/Pasted%20image%2020241107143201.png)
