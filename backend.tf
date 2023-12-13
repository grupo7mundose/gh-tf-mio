terraform {
  backend "s3"{
    bucket                 = "grupo7bucket"
    region                 = "us-east-1"
    key                    = "pin2/backend.tfstate"
    dynamodb_table         = "grupo7terraformstatelock"
  }
}
