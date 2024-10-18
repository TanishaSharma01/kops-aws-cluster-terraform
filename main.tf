resource "null_resource" "create_cluster" {
  provisioner "local-exec" {
    command = <<EOT
      sleep 30 && \
      kops create cluster \
        --name=${var.cluster_name} \
        --state=s3://${aws_s3_bucket.kops_state_store.bucket} \
        --zones=${var.aws_region}a \
        --master-size=${var.master_instance_type} \
        --node-size=${var.worker_instance_type} \
        --node-count=${var.worker_count} \
        --master-count=${var.master_count} \
        --yes
    EOT
  }
}

resource "null_resource" "apply_cluster" {
  depends_on = [null_resource.create_cluster]
  provisioner "local-exec" {
    command = "kops update cluster --yes --state=s3://${aws_s3_bucket.kops_state_store.bucket}"
  }
}

