# -------------------------------
# EC2 Instance Configuration
# -------------------------------
resource "aws_instance" "web_server" {
  ami           = var.ami_value
  instance_type = var.instance_type_value
  key_name      = var.key_pair_name
  subnet_id     = var.sub_id
  vpc_security_group_ids = var.sg_ids
  tags = merge(var.global_tags,var.instance_webserver_tag)
  # associate_public_ip_address = true

 // Instructions for connecting to the instance
  connection {
    type        = "ssh"
    user        = var.ssh_user_ubuntu
    private_key = file(var.key_pair_name)
    host        = self.public_ip
  }

// File provisioner to copy a file from local to remote EC2 instance
  provisioner "file" {
    source      = "../scripts/app.py"  // path to the local file
    destination = "/home/ubuntu/app.py" // path on the remote instance
    
  }

// Remote-exec provisioner to run commands on the remote EC2 instance
  # provisioner "remote-exec" {
  #   inline = [
  #     "echo 'Hello from the remote machine!'",
  #     "sudo apt update -y", # Update package lists for Ubuntu
  #     "sudo apt install python3-pip -y", # Install Python3
  #     "cd /home/ubuntu", # Change to the directory where app.py is located
  #     "sudo pip3 install flask", # Install Flask
  #     "sudo python3 app.py &" # Run the Python script in the background(&)
  #   ]
    
  # }
}

# -------------------------------
# Key Pair
# -------------------------------

resource "aws_key_pair" "deployer" {
  key_name   = var.key_pair_name
  public_key = file(var.public_key_path)
}
