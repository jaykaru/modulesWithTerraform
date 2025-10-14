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
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

// File provisioner to copy a file from local to remote EC2 instance
  provisioner "file" {
    source = ("${path.module}/../../scripts/app.py")  //${path.module} ensures the path is resolved relative to the module, not the root working directory
    destination = "/home/ubuntu/app.py" // path on the remote instance
    
  }

// Remote-exec provisioner to run commands on the remote EC2 instance
  provisioner "remote-exec" {
   inline = [
      "set -e",
      "test -f /home/ubuntu/app.py || { echo 'app.py missing'; exit 1; }", # Check if app.py exists
      "echo 'Hello from the remote instance'",
      "sudo apt update -y",  # Update package lists (for ubuntu)
      "sudo apt install python3-pip -y",  # Example package installation
      # "sudo pip3 install flask", new version prevents pip from installing packages because Python environments is mannaged by the OS
      "sudo apt install python3-flask -y", # This installs Flask via Ubuntu’s package manager
      "sudo touch /home/ubuntu/app.log && sudo chown ubuntu:ubuntu /home/ubuntu/app.log", # Create log file and set ownership
      "bash -c 'cd /home/ubuntu && nohup setsid sudo python3 app.py > /home/ubuntu/app.log 2>&1 & disown'"
    ]
    
  }
}

# -------------------------------
# Key Pair
# -------------------------------

resource "aws_key_pair" "deployer" {
  key_name   = var.key_pair_name
  public_key = file(var.public_key_path)
}
