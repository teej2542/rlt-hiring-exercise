Infrastructure Coding Test
==========================

The server and MySQL databased is created via Terraform. 

In the Terraform file (test.tf) there is a credential section where you will put your access and secrete keys. Then there are 3 resources that will be created. 

**NOTE:** Before starting make sure you have the AWS IAM access and secrete keys with the appropriate permissions. Also set the default region. Install Terraform (https://www.terraform.io/downloads.html)

**Resources**

**Security Group:** to allow access to the instance through ports 22 (SSH) and port 80 (http) to serve the pages. 

**Instance:**  An Ubuntu instance.

**DB Instance (RDS):** A instance for the MySQL database.

**Instructions** (From the root directory):

**Run the following to initialize Terraform and download any need components:** <code>terraform init</code>

**Run following to view the resources that will be created:** <code>terraform plan</code> <br/>

**Run the following to create the resources:** <code>terraform apply</code>

_Once this stage is completed. Run the following bash script (**./getdata.sh**) to get the IP and url to check the server._

_To check periodically if the server is running, run the following bash script (**./check_server.sh**)_

**Run the following to destroy the resources:** <code>terraform destroy</code>


