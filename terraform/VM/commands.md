### Initialize terraform

        terraform init

### validate syntax

        terraform validate

### To create terraform plan

        terraform plan

    If we decide to keep the plan then,
    
        terraform plan -out tfplan

### Apply the created plan
        
        terraform apply tfplan

### To get the private key

        terraform output -raw tls_private_key > azureuser_id_rsa

### connect to VM

      ssh -i azureuser_id_rsa azureuser@<public-ip>
