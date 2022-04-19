resource "local_file" "name" {
    filename = "/root/user-data"
    sensitive_content = "password: S3cr3tP@ssw0rd"

    count = 3
}


variable "users" {
    type = list
}
variable "content" {
    default = "password: S3cr3tP@ssw0rd"
  
}

#################################################

variable "users" {
    type = list(string)
    default = ["/root/user-data"]
}
variable "content" {
    default = "password: S3cr3tP@ssw0rd"
  
}


resource "local_file" "name" {
    filename = var.users[count.index]
    sensitive_content = var.content

    count = length(var.users)
}
#################################################

variable "users" {
    type = list(string)
    default = [ "/root/user10", "/root/user11", "/root/user12", "/root/user10"]
}
variable "content" {
    default = "password: S3cr3tP@ssw0rd"
  
}

resource "local_file" "name" {
    filename = "/root/user-data"
    sensitive_content = var.content
    
    for_each = toset(var.users)
}


