resource "aws_ecr_repository" "mlflow" {
  name                 = var.image
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "null_resource" "build" {
  provisioner "local-exec" {
    command = "docker build -t ${var.image} ./Docker/"
  }
  depends_on = [
    aws_ecr_repository.mlflow
  ]
}

resource "null_resource" "tag" {
  provisioner "local-exec" {
    command = "docker tag ${var.image}:latest ${local.aws_ecr_url}/${var.image}:latest"
  }
  depends_on = [
    null_resource.build
  ]
}

resource "null_resource" "docker_login" {
  provisioner "local-exec" {
    command = "aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.aws_ecr_url}"
  }
}

resource "null_resource" "push" {
  provisioner "local-exec" {
    command = "docker push ${local.aws_ecr_url}/${var.image}:latest"
  }
  depends_on = [
    null_resource.docker_login, null_resource.tag
  ]
}