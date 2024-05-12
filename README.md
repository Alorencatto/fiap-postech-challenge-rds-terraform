# Terraform EKS AWS Academy

This project deploy an RDS Database in AWS Academy account using terraform and github actions for academic proposes.

## Update terraform credentials

Write an `academy` profile into the `~/.aws/credentials` file

```sh
# ~/.aws/credentials
[academy]
aws_access_key_id="your_aws_access_key_id"
aws_secret_access_key="your_aws_secret_access_key"
aws_session_token="your_aws_session_token"
```

## GitHub Actions

Add secrets to your github repository at `settings` > `actions` > `secrets`

- `AWS_SECRET_ACCESS_KEY`
- `AWS_ACCESS_KEY_ID`
- `AWS_SESSION_TOKEN`
- `AWS_REGION`
- `AWS_BUCKET_KEY_NAME`
- `AWS_BUCKET_NAME`

## Terraform

- **Go into the infrastructure directory**:

```sh
cd infrastructure
```

1. **Backend**:

First comment the backend block at `./provider.tf`

```hcl
backend "s3" {
    ...
}
```

2. **Init Terraform**:

```sh
terraform init
```

3. **Check plan**:

```sh
terraform plan
```

4. **Apply plan**:

```sh
terraform apply --auto-approve
```

5.  **Backend**:

Uncomment the backend block at `infrastructure/provider.tf`

```hcl
backend "s3" {
    ...
}
```

and repeat the steps from **2** to **4**

## Resources

