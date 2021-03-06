resource "null_resource" "wait" {
  triggers = {
    run_id = var.run_id
  }
  provisioner "local-exec" {
    command = "sleep ${var.sleep_time}"
  }
}

variable "run_id" {
  default = "run_id_2"
  sensitive = true
}
variable "sleep_time" {
  default = 610
}
