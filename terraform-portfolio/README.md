# Open Source Portfolio Website Infrastructure with Terraform

This project is an open source, end-to-end Terraform configuration to deploy a static portfolio website on AWS S3 with public access. It is designed as a template for anyone to use, contribute to, or extend.

## Features
- Creates an S3 bucket for static website hosting
- Uploads your portfolio website files to the bucket
- Outputs the public website URL
- Open source and community-friendly

## Contributing
Contributions, issues, and feature requests are welcome! Feel free to fork the repo and submit pull requests.

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) >= 1.0.0
- [AWS CLI](https://aws.amazon.com/cli/) configured with your credentials
- An AWS account
- Your static portfolio website files in a folder named `portfolio-website` at the root of this repo

## Setup Instructions

1. **Clone this repository and navigate to the Terraform directory:**
   ```bash
   git clone https://github.com/your-username/terraform-portfolio-template.git
   cd terraform-portfolio
   ```

2. **Prepare your website files:**
   - Place your static website files (index.html, etc.) in a folder named `portfolio-website` at the root of the repo (i.e., `../portfolio-website` relative to this directory).

3. **Initialize Terraform:**
   ```bash
   terraform init
   ```

4. **Review the plan:**
   ```bash
   terraform plan
   ```

5. **Apply the configuration:**
   ```bash
   terraform apply
   ```
   - Type `yes` when prompted.

6. **Access your website:**
   - After apply, Terraform will output the S3 website endpoint URL. Open it in your browser.

## File Structure

- `main.tf` - Main Terraform configuration
- `versions.tf` - Provider and Terraform version constraints
- `README.md` - This documentation

## Clean Up
To remove all resources created by this project:
```bash
terraform destroy
```

## Notes
- The S3 bucket name must be globally unique. You may need to change the bucket name in `main.tf`.
- This setup is for static sites only. For dynamic sites, consider using AWS Lambda, API Gateway, etc.
- For custom domains and HTTPS, you can extend this project with AWS Route53 and ACM.

---

**Author:** Open Source Community
