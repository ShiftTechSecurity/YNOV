## Partie 1 : Créations des VPCs

- Ci-dessous le tableau des VPC à créer sur AWS

| Nom du VPC | VPC CIDR      | Public Subnet | Private Subnet |
| ---------- | ------------- | ------------- | -------------- |
| TRI_VPC1   | 10.20.0.0/16  | 10.20.1.0/24  | 10.20.2.0/24   |
| TRI_VPC2   | 10.120.0.0/16 | 10.120.1.0/24 | 10.120.2.0/24  |

- Confirmation de la création de la VPC "TTE-VPC1", et les subnets "TTE-VPC1-PublicSubnet" et "TTE-VPC1-PrivateSubnet"
![Alt text](Images/Pasted%20image%2020241107160105.png)

- Confirmation de la création de la VPC "TTE-VPC2", et les subnets "TTE-VPC2-PublicSubnet" et "TTE-VPC2-PrivateSubnet"
![Alt text](Images/Pasted%20image%2020241107160136.png)

- Confirmation de la création des Internet Gateway "TTE-InternetGateway-VPC1" et "TTE-InternetGateway-VPC2"
![Alt text](Images/Pasted%20image%2020241108091418.png)

- Confirmation de la création de la Route Table "TTE-RouteTable-VPC1" et l'association avec la InternetGateway "TTE-InternetGateway-VPC1"
![Alt text](Images/Pasted%20image%2020241108093723.png)

- Confirmation de la création de la Route Table "TTE-RouteTable-VPC2" et l'association avec la InternetGateway "TTE-InternetGateway-VPC2"
![Alt text](Images/Pasted%20image%2020241108093735.png)

- Confirmation de l'attribution de la Route Table "TTE-RouteTable-VPC1" au subnet "TTE-VPC1-PrivateSubnet" et "TTE-VPC1-PublicSubnet" 
![Alt text](Images/Pasted%20image%2020241108102710.png)

- Confirmation de l'attribution de la Route Table "TTE-RouteTable-VPC1" au subnet "TTE-VPC2-PrivateSubnet" et "TTE-VPC2-PublicSubnet" 
![Alt text](Images/Pasted%20image%2020241108102726.png)

## Partie 2 : Création des instances et des bastions

1. Créer deux instances TRI_InstanceVPC1 et TRI_InstanceVPC2 (une dans chaque VPC sur le sous-réseau privé). Utiliser une AMI avec Apache HTTPD d’actif (cf TP1) pour gagner du temps par la suite.

- Confirmation de la création de l'instance "TTE-InstanceVPC1" dans la subnet "TTE-VPC1-PrivateSubnet"
![Alt text](Images/Pasted%20image%2020241108083702.png)

- Confirmation de la création de l'instance "TTE-InstanceVPC2" dans la subnet "TTE-VPC2-PrivateSubnet"
![Alt text](Images/Pasted%20image%2020241108095851.png)

2. Créer deux autres instances TRI_BastionVPC1 et TRI_BastionVPC2 (une dans chaque VPC sur le sous-réseau public). Ces deux instances possèdent une adresse IP Publique.

- Confirmation de la création des Elastic IP (Adresse IP Publique) "TTE-ElasticIP-PublicSubnet-VPC1" et "TTE-ElasticIP-PublicSubnet-VPC2"
![Alt text](Images/Pasted%20image%2020241108090322.png)

- Confirmation de la création de l'instance "TTE-BastionVPC1"
![Alt text](Images/Pasted%20image%2020241108091824.png)

- Confirmation de la création de l'instance "TTE-BastionVPC2"
![Alt text](Images/Pasted%20image%2020241108091855.png)

- Confirmation de l'attribution des Elastic IP aux instances "TTE-BastionVPC1" et "TTE-BastionVPC2"
![Alt text](Images/Pasted%20image%2020241108091629.png)

- Confirmation de la connexion SSH depuis l'adresse IP publique de YNOV vers l'instance "TTE-BastionVPC1"
![Alt text](Images/Pasted%20image%2020241108093844.png)

- Confirmation de la connexion SSH depuis l'adresse IP publique de YNOV vers l'instance "TTE-BastionVPC2"
![Alt text](Images/Pasted%20image%2020241108093952.png)

3. Modifier votre configuration du client SSH afin de se connecter aux instances privées en effectuant un rebond sur l’instance publique.

- Confirmation de la création d'une règle en entrée sur la Security Group "TTE-SecurityGroup-EC2-VPC1" depuis la Security Group "TTE-SecuritGroup-Bastion-VPC1"
![Alt text](Images/Pasted%20image%2020241108095759.png)

- Confirmation de la création d'une règle en entrée sur la Security Group "TTE-SecurityGroup-EC2-VPC2" depuis la Security Group "TTE-SecuritGroup-Bastion-VPC2"
![Alt text](Images/Pasted%20image%2020241108095734.png)

4. Tester et valider la connexion aux instances présente sur les réseaux privés. Si votre AMI ne contenait pas de serveur Apache HTTPD démarré, profitez-en pour installer et démarrer un serveur Web sur les deux instances.

- Confirmation de la connexion SSH entre l'instance "TTE-BastionVPC1" et l'instance "TTE-InstanceVPC1"
![Alt text](Images/Pasted%20image%2020241108100013.png)

- Confirmation de la connexion SSH entre l'instance "TTE-BastionVPC2" et l'instance "TTE-InstanceVPC2"
![Alt text](Images/Pasted%20image%2020241108100037.png)


## Partie 3 : Appairage des VPCs, Configuration du routage et tests

1. Configurer l’appairage entre vos deux VPCs.

- Confirmation de la création du VPC Peering "TTE-Peering-VPC1-to-VPC2"
![Alt text](Images/Pasted%20image%2020241108104034.png)

2. Mettre à jour les tables de routage pour que les adresses du CIDR du subnet privé du VPC 1 soit accessible depuis le subnet privé du VPC 2 et inversement.

- Confirmation de la configuration de la Route Table  "TTE-RouteTable-VPC1" pour permettre le trafic vers la VPC "TTE-VPC2" via le VPC Peering "TTE-Peering-VPC1-to-VPC2"
![Alt text](Images/Pasted%20image%2020241108104431.png)

- Confirmation de la configuration de la Route Table  "TTE-RouteTable-VPC2" pour permettre le trafic vers la VPC "TTE-VPC1" via le VPC Peering "TTE-Peering-VPC1-to-VPC2"
![Alt text](Images/Pasted%20image%2020241108104306.png)

3. Si nécessaire, modifier les groupes de sécurité pour permettre aux instances de communiquer entre elles sur le port 80.

- Confirmation de l'ajout d'une règle entrant sur la Security Group "TTE-SecurityGroup-EC2-VPC1" pour le trafic HTTP depuis la subnet "10.120.0.0/16"
![Alt text](Images/Pasted%20image%2020241108104819.png)

- Confirmation de l'ajout d'une règle entrant sur la Security Group "TTE-SecurityGroup-EC2-VPC2" pour le trafic HTTP depuis la subnet "10.20.0.0/16"
![Alt text](Images/Pasted%20image%2020241108104907.png)

4. Valider que les connexions HTTP sont possibles en se connectant en SSH sur l’instance privé du VPC 1 (avec un rebond sur le bastion) et faire une requête sur l’IP de l’instance privée du VPC 2 (et inversement).

- Confirmation de la connexion en HTTP avec curl depuis l'instance "TTE-Instance1" vers l'instance "TTE-Instance2"
![Alt text](Images/Pasted%20image%2020241108105013.png)

- Confirmation de la connexion en HTTP avec curl depuis l'instance "TTE-Instance2" vers l'instance "TTE-Instance1"
![Alt text](Images/Pasted%20image%2020241108105029.png)
