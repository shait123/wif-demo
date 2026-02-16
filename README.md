# Terraform Infrastructure Deployment on Google Cloud using GitHub Actions and Workload Identity Federation

## Overview

This project demonstrates how to securely deploy infrastructure on Google Cloud using Terraform and GitHub Actions without using service account keys.

Authentication is handled using Workload Identity Federation (OIDC), which is the recommended and secure method.

This setup follows enterprise DevOps best practices.

---

## Architecture

GitHub Actions
→ OIDC Token
→ Workload Identity Pool
→ Workload Identity Provider
→ Service Account Impersonation
→ Terraform
→ Google Cloud Infrastructure

---

## Features

* Secure authentication using Workload Identity Federation
* No service account keys required
* Remote Terraform state stored in Google Cloud Storage
* Fully automated infrastructure deployment
* Separate workflows for apply and destroy
* Enterprise-grade secure CI/CD pipeline

---

## Repository Structure

```
.
├── main.tf
├── provider.tf
├── backend.tf
├── variables.tf
├── .github/
│   └── workflows/
│       ├── terraform.yml
│       └── terraform-destroy.yml
└── README.md
```

---

## Prerequisites

* Google Cloud Project
* Terraform installed locally (optional)
* GitHub repository
* Workload Identity Federation configured
* Service account with required permissions

Required roles for service account:

* storage.admin
* iam.workloadIdentityUser

---

## Backend Configuration

Terraform state is stored in a Google Cloud Storage bucket.

Example:

```
terraform {
  backend "gcs" {
    bucket  = "your-terraform-state-bucket"
    prefix  = "terraform/state"
  }
}
```

The backend bucket must be created manually before running Terraform.

---

## Deployment

Terraform runs automatically using GitHub Actions when code is pushed to the main branch.

Workflow file:

```
.github/workflows/terraform.yml
```

Steps executed:

* Authenticate using Workload Identity Federation
* Initialize Terraform
* Plan infrastructure
* Apply infrastructure

---

## Destroy Infrastructure

To destroy infrastructure manually:

Go to:

GitHub → Actions → Terraform Destroy → Run Workflow

This will safely remove all Terraform-managed resources.

---

## Security

This project uses secure authentication:

* No service account keys
* No secrets stored in repository
* Uses short-lived OIDC tokens
* Follows Google Cloud security best practices

---

## Technologies Used

* Terraform
* Google Cloud Platform
* GitHub Actions
* Workload Identity Federation
* Google Cloud Storage

---

## Author

DevOps Infrastructure Project

---
