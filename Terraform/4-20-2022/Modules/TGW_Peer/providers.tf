provider "aws" {
    region = var.regions
}

provider "aws" {
  region = var.peer_regions    
  }