# 2-Tier-Project


### Description
- Created infrastructure Resources in AWS using Terraform tool
- Here, we created 2 EC2 instances [web instance , Mysql_RDS instance]
- The web instance in a public-subnet and can be reached over internet
- The mysql-RDS instance in 2 private subnets

     
- By using the Terraform tool you could create a VPC, subnets, security-group, internet-gateway and EC2 instance in AWS.
- Benefit of that project: 
 -- You save time by automating the creation of your infrastructure using Terraform
 -- You can reuse that code in different cloud providers such as GCP, AWS, Azure, Oracle, etc.. and create an infrastructure just by changing the  resources name
	
## :warning:  NOTE:
- This Project is depends on 3 Modules
    - the modules are hosted on a github Repo here is the link   
    -   **https://github.com/DinaSol/2-Tier-Subnets-Module.git**
    -   **https://github.com/DinaSol/2-Tier-Web-Module.git**
    -   **https://github.com/DinaSol/2-Tier-RDS-Module.git**

    - the project is in this current Repo so I referred to the modules in the code that exist in **main.tf**
-  Here I used **Paris Region**.
- Also in the EC2 code, I used **operating system image in that Region also** so if you changed the Region you must set an image of that region .


------------


#### 📝 The Resources that will be created are:

- **Subnets :**
   - 2 private subnets 
   - Public subnet that associated to Internet-gateway so it can be accessed over internet
- **Internet-gateway**
  
- **SecurityGroups :**
	- security-group for web instance that allow ports [80 and 443]
  - security-group for RDS instance that allow ports [3306]

- **EC2-Instances :**
	- Before you start ensure that:
   - ImageId is the operating system image id, ***you must be sure that the image is in the same region you use***. 
	 - KeyName must be the keyPair you use or you can create a new one.


 #### - About the web instance created in Public subnet so it can be reachable over internet
    - the public subnet take Range of network 10.0.4.0/24
  ##### - requirments to create web instance:  
    - create security group that allow inbound traffic from ports "80" & "443"
  ##### - requirments to create public subnet:
        - Has the VPC_id 
        - create an internet-gateway 
        - Edit the Route-table and add a route that redirect the trrafic to internet-gateway so the instances in that public-subnet can receive and send traffic from/to the internet
 #### - About the RDS instance attached to 2 private subnets
    - the 2 private subnets Ranges of network are [10.0.5.0/24] and [10.0.6.0/24]
  ##### - requirments to create RDS instance:
          - we will need to create group-subnets, that we need the instance to be created in.
          - create the instance of type that allowed to be in multi-availability-zones as I mentiond in the code ==>  **multi_az = true** 
          - create security group that allow inbound traffic from port "3306"
  ##### - requirments to create Private subnet:
          - Has the VPC_id 


   
------------
### How to use the Project

**first run these 2 commands**
1.  -  $ terraform init
2.  -  $ terraform plan

to **create this infrastructure** use this command : 
    - $ terraform apply

to **delete this infrastructure** use this command: 
    -  $ terraform destroy

------------

**Happy ending** ... :sunglasses: :relaxed:

