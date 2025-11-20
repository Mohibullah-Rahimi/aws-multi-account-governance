# 🚀 Enterprise AWS Multi-Account Governance (by Mohibullah-Rahimi)

**Designed & implemented by [Mohibullah-Rahimi](https://mohibullah.dev/)**

## ✨ Project Overview
This repo automates real AWS multi-account governance:
- **Control Tower** setup & landing zone best practices (manual notes if Terraform can't do all, see README)
- **Organizations & OUs** (secure account structure)
- **Service Control Policies (SCPs)**
- **Centralized CloudTrail** with encrypted S3 logging
- **IAM cross-account read-only role**
- **Infrastructure-as-Code with Terraform**
- **CI/CD (Continuous Integration) with GitHub Actions**
- **Demo scripts for verification and compliance**

 see my website: https://mohibullah.dev/).

---

## 🖼️ Architecture

![Multi-Account Architecture](architecture.png)

---

## 🛠️ Prerequisites

- AWS management account with Organizations (Control Tower optional; notes included for integration)
- Terraform v1.5+; AWS CLI installed and configured
- A test/sandbox AWS environment
- Your own GitHub repo (start from this repo or [template here](https://github.com/Mohibullah-Rahimi/aws-multi-account-governance))

---

## 🚩 Repo Structure

```
aws-multi-account-governance/
├─ README.md
├─ architecture.png
├─ terraform/
│  ├─ versions.tf
│  ├─ providers.tf
│  └─ modules/
│      ├─ organization/
│      ├─ ou/
│      ├─ scp/
│      ├─ cloudtrail/
│      ├─ s3/
│      └─ iam-cross-account/
│  └─ environments/
│      ├─ management/
│      ├─ logging/
│      └─ security/
├─ .github/
│   └─ workflows/
│        └─ terraform.yml
├─ demo/
│   ├─ verify.sh
│   └─ example-deny-test.sh
```

---

## 🏁 How to Deploy (Step-by-Step)

1. **Clone this Repo**
   ```bash
   git clone https://github.com/Mohibullah-Rahimi/aws-multi-account-governance.git
   cd aws-multi-account-governance/terraform/environments/management
   terraform init
   ```

2. **Configure AWS Credentials**
   ```bash
   aws configure --profile mgmt
   export AWS_PROFILE=mgmt
   ```

3. **Plan & Apply Infrastructure**
   ```bash
   terraform plan -out=tfplan
   terraform apply tfplan
   ```
   _Note: This creates real resources. Review plan output carefully before apply._

4. **Verify Setup**
   ```bash
   bash ../../demo/verify.sh
   ```
   Check AWS Organizations, SCP attachments, IAM roles, CloudTrail logs, S3 bucket in your AWS Console.

5. **Demo SCP Deny**
   _From a member account under an SCP’d OU:_
   ```bash
   bash ../../demo/example-deny-test.sh
   ```

6. **Push to GitHub, Enable Actions**
   - Commit and push:  
     ```bash
     git add . && git commit -m "AWS Governance infra by Mohibullah-Rahimi" && git push origin main
     ```
   - Configure GitHub Actions secrets (or OIDC) for Terraform Cloud runs
   - Watch CI/CD runs on PRs and pushes

---

## 💡 Features

- Automated multi-account org structure
- SCP guardrails
- Central CloudTrail audit logs
- Cross-account auditing IAM role (see code: `mohibullah-readonly`)
- Verification & denial test scripts
- CI/CD for infra reproducibility
- All authoring credited to Mohibullah-Rahimi

---

## 📚 References

- [AWS Control Tower Docs](https://docs.aws.amazon.com/controltower/latest/userguide/what-is-control-tower.html)
- [AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- My website: [mohibullah.dev](https://mohibullah.dev/)

---

## 📷 Showcasing

- Add console & architecture screenshots, sample logs (see `/demo`)
- Share on LinkedIn (tag #aws #terraform #devops #cloudsecurity)
- Blog your journey at [mohibullah.dev](https://mohibullah.dev/)

---

**Built by Mohibullah-Rahimi — securing cloud organizations, one Terraform repo at a time.**