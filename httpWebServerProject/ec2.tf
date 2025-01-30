data "aws_ami" "latest_ubuntu24_ami" {
  owners = [ "099720109477" ]
  most_recent = true
  include_deprecated = false
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  
}


resource "aws_instance" "myUbuntuServer" {
  count      = length(data.terraform_remote_state.network_state.outputs.public_subnets_obj)
  subnet_id = element(data.terraform_remote_state.network_state.outputs.public_subnets_obj, count.index).id

  ami =  data.aws_ami.latest_ubuntu24_ami.id
  instance_type = "t3.nano"
  vpc_security_group_ids = [ aws_security_group.myWebSG.id ]
  key_name = "terraformKeypair"
  
  user_data = templatefile("user_data.sh", {
    instance_id = "Instance ${count.index + 1}"
  })

 tags = {
    Name = "Public Instance ${count.index + 1}"
  }
  user_data_replace_on_change = true
  lifecycle {
    prevent_destroy = false
    create_before_destroy = true
  }
}