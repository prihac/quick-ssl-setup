# Quick SSL Setup Script
This script is designed to automate the process of issuing and installing SSL certificates using Let's Encrypt for domains using the acme.sh client.
## Installation

Clone the Repository & Run:

```bash
git clone https://github.com/prihac/quick-ssl-setup.git
cd quick-ssl-setup
mv ssl-setup.sh /root/
cd ..
. ssl_setup.sh
```
## Instructions
- Make sure that if you are using Nginx it is stopped to install the certificate and then be sure to enable it again.
```bash
systemctl start nginx
systemctl status nginx
```
### Follow the Prompts:
The script will guide you through the process of updating packages, stopping Nginx, installing required packages, registering an account with Let's Encrypt, and issuing SSL certificates for your domains.


## Script Explanation
The script Quick SSL Setup includes the following functionalities:

- **Certificate Issuance:** The script issues SSL certificates for specified domains using the acme.sh client.

- **Package Management:** It updates and upgrades system packages, stops Nginx, and installs required packages such as curl and socat.

- **Let's Encrypt Integration:** The script sets the default Certificate Authority (CA) to Let's Encrypt and registers an account with Let's Encrypt using the provided email address.

- **Multiple Domains:** It supports the issuance of SSL certificates for multiple domains.

### Follow the Prompts:
* Enter your email address for Let's Encrypt account registration.
* Enter the domain names for which you want to issue SSL certificates.
* If prompted, specify whether you want to issue certificates for additional domains.

### Notes:
* Make sure to run the script with appropriate permissions.
* Ensure that your server environment meets the requirements for Let's Encrypt certificate issuance.

## Related


For more details, refer to the [ Quick-SSL-Setup ](https://github.com/prihac/quick-ssl-setup) repository.





