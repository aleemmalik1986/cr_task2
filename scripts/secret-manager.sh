#!/bin/bash

while true; do
    # Prompt the user to choose a task
    read -p "Choose the task:
        1. List all secrets
        2. Enter secret to view
        3. Create a secret
        4. Quit
Choose an option [1-4]: " TASK

    # Perform the selected task
    case $TASK in
        1)
            # List all secrets
            echo "Listing all secrets..."
            aws secretsmanager list-secrets --output json | jq -r '.SecretList[] | .Name'
            ;;
        2)
            # Enter a specific secret name to view its details
            read -p "Enter the name of the secret to view: " SECRET_NAME
            if [ -z "$SECRET_NAME" ]; then
                echo "You must enter a secret name."
            else
                echo "Retrieving secret $SECRET_NAME..."
                SECRET_VALUE=$(aws secretsmanager get-secret-value --secret-id "$SECRET_NAME" --query SecretString --output text)
                
                if echo "$SECRET_VALUE" | jq -e '.password?' >/dev/null ; then
                    echo "undecoded password: $SECRET_VALUE"
                    USERNAME=$(echo "$SECRET_VALUE" | jq -r '.name')
                    PASSWORD=$(echo "$SECRET_VALUE" | jq -r '.password')
                    DECODED_PASSWORD=$(echo "$PASSWORD" | base64 --decode)
                    echo "Username: $USERNAME"
                    echo "Decoded Password: $DECODED_PASSWORD"
                else
                    echo $SECRET_VALUE
                fi
            fi
            ;;
        3)
            # Create a new secret
            ./create-secret.sh apply
            ;;
        4)
            # Quit the script
            echo "Quitting..."
            exit 0
            ;;
        *)
            # Handle invalid input
            echo "Invalid option. Please choose between 1-4."
            ;;
    esac
done