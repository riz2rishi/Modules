# AWS EC2 Linux Instance

/*
 Note: Configure connection for the aws instance and also for provisioner.
*/

resource "aws_instance" "test" {
  ami           = "ami-0c2d06d50ce30b442"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.lb_subnet[0].id
  

/*
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2",
      "sudo service start apache2",
      "chkonfig apace2 on",
      
    ]
  }

  */
  
}
