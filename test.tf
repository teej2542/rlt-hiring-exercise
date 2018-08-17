// Credentials
provider "aws" {
  access_key = ""
  secret_key = ""
  region     = ""
}

// Security group
resource "aws_security_group" "testgroup" {

  ingress {
    from_port = 22
    protocol = "TCP"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    protocol = "TCP"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}


// Create instances
resource "aws_instance" "test_nginx" {
  ami = "ami-759bc50a"
  instance_type = "t2.micro"
  key_name = "test"
  security_groups = ["${aws_security_group.testgroup.name}"]
  subnet_id = ""

  tags {
    name = "test_nginx"
  }

  provisioner "remote-exec" {

    connection {
      user     = "ubuntu"
      private_key = "${file("~/key/test.pem")}"
      host = "${aws_instance.test_nginx.public_ip}"
    }

    inline = [
      "sudo apt-get update",
      "sudo apt-get install nginx -y",
      "sudo ufw allow 'Nginx HTTP'",
      "sudo chown -R ubuntu:ubuntu /var/www/",
      "sudo echo \"1.0.6\" >> /var/www/html/version.txt"
    ]
  }
}

// Creating db instance
resource "aws_db_instance" "test_db" {
  instance_class = "db.t2.micro"
  storage_type = "gp2"
  engine = "MySQL"
  engine_version = "5.7.22"
  username = "master"
  password = "test1test"
  name = "test"
  allocated_storage = 10
}
