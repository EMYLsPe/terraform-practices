# terraform-practices
Lynda learning course practices

##### 1. Configure AWS CLI
###### prerequisites : AWS account and installed AWS CLI
- 1. use `aws configure` command on the terminal
- 2. configure 
```
                aws access key Id : your aws key
                aws secret access key : your secret access key
                default region name : any region eg:us-west2
                default output format : eg:json
```

##### 2. Create the connection
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


##### 3. Create the basic network in aws (vpc)

- 1. create **_resources.tf_** file
- 2. create basic aws vpc
        - :pencil2: **you can change these values => _environment-example-two, 10.0.0.0/16, terraform-vpc-example-two_** 
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


##### 4. Adding subnets