ami_id                = "ami-0583d8c7a9c35822c"
instance_type         = "t2.micro"
subnet_id             = "subnet-0923d3bb7bf7d807c"
key_name              = "wordpress"
ebs_volume_size       = 20
ebs_volume_type       = "gp2"
ebs_delete_on_termination = true
vpc_security_group_ids = "sg-0e5cbebf519c9699c"
