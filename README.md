# Terraform oefeningen 01-05

Vijf oefeningen waarin ik Terraform leer gebruiken: van een eerste lokaal bestand tot een echte VM op Proxmox VE.

**Student:** Ilias El Abdellaoui
**Opleiding:** Netwerk- en Systeembeheer, Thomas More
**Vak:** Application Management

## Omgeving

| Onderdeel | Waarde |
|---|---|
| Werk-VM | DietPi v10.7 (x86_64) op Proxmox |
| Terraform | v1.16.5, geïnstalleerd via Homebrew (`hashicorp/tap`) |
| Proxmox node | `mister-blue` |

## Oefeningen

| # | Map | Wat ik leerde |
|---|---|---|
| 01 | `01_local_file` | De workflow: `init` → `plan` → `apply` → `destroy` |
| 02 | `02_project_structure` | Config opsplitsen in `providers.tf` en `main.tf`, providerversie vastleggen met `~> 2.5` |
| 03 | `03_variables_outputs` | Variabelen (`variables.tf`) en outputs (`outputs.tf`), waarden overschrijven met `-var` |
| 04 | `04_tfvars` | Eén configuratie voor vijf omgevingen via `.tfvars`-bestanden en een `locals`-heredoc |
| 05 | `05_proxmox` | Een echte VM klonen van een template op Proxmox met de `telmate/proxmox`-provider |

## Gebruik

Ga altijd eerst naar de map van de oefening:

```bash
cd 01_local_file
terraform init
terraform plan
terraform apply
terraform destroy
```

Oefening 04 met een omgeving:

```bash
cd 04_tfvars
terraform apply -var-file="production.tfvars"
terraform destroy -var-file="production.tfvars"
```

Oefening 05 heeft een `terraform.tfvars` nodig met deze variabelen (staat **niet** in Git):

```hcl
pm_api_url          = "https://<proxmox-ip>:8006/api2/json"
pm_api_token_id     = "<user>@pam!terraform-token"
pm_api_token_secret = "<secret>"
vm_node             = "mister-blue"
vm_template         = "dietpi-template"
vm_name             = "dietpi-terraform"
```

## Wat er niet in Git staat (`.gitignore`)

- `.terraform/`: gedownloade providers
- `*.tfstate`: de state, het geheugen van Terraform
- `terraform.tfvars`: bevat de API-token secret
- `*.txt`: bestanden die door `apply` gemaakt worden

De `.terraform.lock.hcl`-bestanden staan er wél in, zodat iedereen dezelfde providerversie gebruikt.

## Problemen en oplossingen

| Probleem | Oplossing |
|---|---|
| `brew install` → *No developer tools installed* | `sudo apt-get install -y build-essential` |
| `401 Authentication failed` (oefening 05) | Token ID moet exact overeenkomen, hoofdlettergevoelig: `admin@pam!terraform-token` |
| *Qemu Guest Agent is enabled but not working* | `qemu-guest-agent` is niet geïnstalleerd in DietPi; de VM werkt wel |
| `ssh-keygen: command not found` | DietPi gebruikt Dropbear; `sudo apt-get install -y openssh-client` |
