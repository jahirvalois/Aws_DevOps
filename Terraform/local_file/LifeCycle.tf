#with lifecycle instruction, the new resource is create before destoy

resource "local_file" "test" {
    filename = "any_path"
    content =  "any_content"

    lifecycle {
        create_before_destroy = true
    }
  
}


#with lifecycle instruction, the new resource is prevent the destroy in changes

resource "local_file" "test" {
    filename = "any_path"
    content =  "any_content"

    lifecycle {
        prevent_destroy = true
    }
  
}


#with lifecycle instruction, the new resource is prevent the changes

resource "local_file" "test" {
    filename = "any_path"
    content =  "any_content"
    tag = {
        Name = "ProjectA"
    }

    lifecycle {
        #ignore_chnages = all
        ignore_chnages = [
            tags
        ]
    }
  
}