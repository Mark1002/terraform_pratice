# terraform pratice
this is my terraform pratice on GCP

## create terraform gcs backend
```
$ vim backend.conf
```
貼上以下變數設定並存檔
```
bucket  = "tf-state-<gcp project id>"
prefix  = "terraform/state"
```
init terraform
```
$ terraform init -backend-config=backend.conf
```

## task
1. import vm module
```
$ terraform import module.instances.google_compute_instance.tf-instance-1 <instance-id>
```