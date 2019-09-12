# terraform-practices
Lynda learning course practices

##### 1. Configure AWS CLI
###### prerequesities : install AWS CLI
- 1. use `aws configure` command on the terminal
- 2. configure 
```
                aws access key Id : your aws key
                aws secret access key : your secret access key
                default region name : any region eg:us-west2
                default output format : eg:json
```

##### 2. Create the connection

- 1. create **_connection.tf_** file
- 2. add provider details
```
                provider "aws" {
                    region = "us-west-2"
                }
```
- 3. type `terraform init` on the terminal to initialize the connection.
