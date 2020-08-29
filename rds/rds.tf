provider "aws" {
    region = "ap-south-1"
    profile = "nishant"
}

resource "aws_db_instance" "mydb" {
       storage_type   =   "gp2"
       allocated_storage = 10
       engine  =  "mysql"
       engine_version  =  "5.7"
       instance_class   =  "db.t2.micro"
       name   =  "RDS"
       username  =  "nishantsingh"
       password   =  "redhat123"
       port = "3306"
       parameter_group_name  =  "default.mysql5.7"
       iam_database_authentication_enabled = true
       publicly_accessible = true
       skip_final_snapshot = true
   
       tags = {
              Name = "mydb"
       }
}
