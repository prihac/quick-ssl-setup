#!/bin/bash

# Function to issue certificate for a domain
issue_certificate() {
    local domain="$1"

    # Issue certificate for the domain
    ~/.acme.sh/acme.sh --issue -d "$domain" --standalone

    # Install certificate
    ~/.acme.sh/acme.sh --installcert -d "$domain" \
        --key-file "/root/${domain}_private.key" \
        --fullchain-file "/root/${domain}_cert.crt"

    echo "SSL certificate issued and installed for $domain."
}

# Main function
main() {
    # Update and upgrade packages
    apt update && apt upgrade -y
    # Perform autoremove
    apt autoremove -y

    # Stop Nginx
    systemctl stop nginx

    # Install required packages
    apt install curl socat -y

    # Install acme.sh if not already installed
    if ! command -v ~/.acme.sh/acme.sh &> /dev/null; then
        curl https://get.acme.sh | sh
    fi

    # Set default CA to Let's Encrypt
    ~/.acme.sh/acme.sh --set-default-ca --server letsencrypt

    # Register an account
    read -p "Enter your email address: " email
    ~/.acme.sh/acme.sh --register-account -m "$email"

    # Issue certificate for the first domain
    read -p "Enter your first domain name: " domain1
    issue_certificate "$domain1"

    # Ask for the second domain
    read -p "Do you want to issue a certificate for another domain? (yes/no): " response
    if [[ "$response" == "yes" ]]; then
        read -p "Enter your second domain name: " domain2
        issue_certificate "$domain2"
    fi
    
    # Display SSL files
    echo "SSL files created:"
    ls /root/*.crt /root/*.key
}

# Execute the main function
main
