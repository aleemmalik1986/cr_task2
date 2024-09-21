# Aws secret manager

This package contains teraform module to create secrets on smaas

## Directory Structure
```
├── README.md
├── deploy
│   └── secrets
│       └── terragrunt.hcl
├── modules
│   └── smaas
│       ├── main.tf
│       └── variables.tf
└── scripts
    ├── create-secrets.sh
    └── secret-manager.sh
```

## Prerequisites

- make sure tofu and terragrunt is installed

## How to Run

- there are two ways to create the secret

  1. change dir to scripts dir and run
     `./create-secrets.sh apply`
  2. To run interactively
     `./secret-manager.sh`
   ```
     Choose the task: 
      1. List all secrets 
      2. Enter secret to view 
      3. Create a secret 
      4. Quit
     Choose an option [1-4]:
   ```
