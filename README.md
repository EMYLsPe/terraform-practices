# terraform-practices
Lynda learning course practices

### 1. Configure AWS CLI
###### prerequisites : AWS account and installed AWS CLI
- 1. use `aws configure` command on the terminal
- 2. configure 
```
                aws access key Id : your aws key
                aws secret access key : your secret access key
                default region name : any region eg:us-west2
                default output format : eg:json
```

### 2. Create the connection
###### prerequisites : add terraform plugin into the working IDE(intellij idea)

- 1. create **_connection.tf_** file
- 2. add provider details
```
                provider "aws" {
                    region = "us-west-2"
                }
```
- 3. execute `terraform init` on the terminal to initialize the connection.

###### post requisites : add .gitignore to the following feilds
```
                .DS_Store
                .idea 
``` 


### 3. Create the basic network in aws (vpc)

- 1. create **_resources.tf_** file
- 2. create basic aws vpc
:pencil2:  you can change these values => **_environment-example-two, 10.0.0.0/16, terraform-vpc-example-two_** 
```
                resource "aws_vpc" "environment-example-two" {
                  cidr_block = "10.0.0.0/16"
                  enable_dns_hostnames = true
                  enable_dns_support = true
                  tags {
                    Name = "terraform-vpc-example-two"
                  }
                }
```

- 3. execute `terraform plan` to check whether if there is any same resources exist in the aws account and any conflicts
 
- 4. execute `terraform apply` to apply the diff to the particular platforms. Then confirm it by typing`yes`.

> after the execution you should delete the resource file. else it will execute again for the `terraform apply`


### 4. Adding subnets
- 1. add following code to the resources.tf file
:pencil2:  you can change these values => **_subnet1, cider block name, vpc id, availability zone_** 
```aidl
                resource "aws_subnet" "subnet1" {
                  cidr_block = "${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 3 , 1)}"
                  vpc_id = "${aws_vpc.environment-example-two.id}"
                  availability_zone = "us-west-2a"
                }
```

- 2. execute `terraform plan` the execute `terraform apply` like we did in the previous task

> after the execution you should delete the resource file. else it will execute again for the `terraform apply`


### 5. Create Security group
- 1. add following code to the resources.tf file
:pencil2:  you can change these values => **_subnetsecurity, cider block name, vpc id, from_port, to_port, protocol_** 
```aidl
                resource "aws_security_group"  "subnetsecurity" {
                  vpc_id = "${aws_vpc.environment-example-two.id}"
                  ingress {
                    cidr_blocks = [
                      "${aws_vpc.environment-example-two.cidr_block}"
                    ]
                
                    from_port = 80
                    protocol = "tcp"
                    to_port = 80
                  }
                }
```

> after the execution you should delete the resource file. else it will execute again for the `terraform apply`


- 2. execute `terraform plan` the execute `terraform apply` like we did in the previous task


### 6. Create a server

- 1. create **_servers.tf_** file
- 2. add following code with server requirement
:pencil2:  you can change these values
```
                data "aws_ami" "ubuntu" {
                  most_recent = true
                
                  filter {
                    name = "name"
                    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
                  }
                
                  filter {
                    name = "virtualization-type"
                    values = ["hvm"]
                  }
                
                  owners = ["643687687674563"]
                }

                resource "aws_instance" "firstserver" {
                  ami = "${data.aws_ami.ubuntu.id}"
                  instance_type = "t2.micro"
                
                  tags {
                    Name = "identifiretag"
                  }

                  subnet_id = "${aws_subnet.subnet2.id}"
                }
```

- 3. execute `terraform plan` the execute `terraform apply` and type `yes` like we did in the previous task


### 6. Delete all the resources that we have applied

- 1. execute the command `terraform destroy` 


### 7. Important Commands
- 1. `terraform validate` : it validates the code that you have written
- 2. `terraform fmt` : it format the code in to nice arrangement

### 8. Variables
