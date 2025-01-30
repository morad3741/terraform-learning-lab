
// Listener
resource "aws_lb_listener" "my_alb_listener" {
 load_balancer_arn = aws_lb.my_alb.arn
 port              = "80"
 protocol          = "HTTP"

 default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.webServers_tg.arn
 }
}


// ALB
resource "aws_lb" "my_alb" {
 name               = "my-alb"
 internal           = false
 load_balancer_type = "application"
 security_groups    = [ aws_security_group.myWebSG.id ]

 subnets = [
    for subnet in data.terraform_remote_state.network_state.outputs.public_subnets_obj : subnet.id
  ]
}

resource "aws_lb_target_group" "webServers_tg" { 
 name     = "webServers-target-group"
 port     = 80
 protocol = "HTTP"
 vpc_id   = data.terraform_remote_state.network_state.outputs.vpc_id
}

// Target group attachment
resource "aws_lb_target_group_attachment" "tg_attachment" {
 count      = length(aws_instance.myUbuntuServer)
 target_group_arn = aws_lb_target_group.webServers_tg.arn
 target_id        = element(aws_instance.myUbuntuServer, count.index).id
 port             = 80

 depends_on = [ aws_instance.myUbuntuServer ] # not sure its neccessary
}