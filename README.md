# A quest in the clouds | Completed by Justin Andersen

### Q. What is this quest ?
#####  It is a fun way to assess your cloud skills in an attempt to catch Rearc's attention.

### Q. What skills does it exemplify ?
#####  AWS. Cloud concepts. Docker (containerization). IAC (Infrastructure as code). HTTP/HTTPS. Linux/Unix.

### Q. How do I test it ?
#####   1) Install Terraform (if you haven't already)
#####   2) Install AWS CLI and configure your credentials (if you haven't already)
#####   3) Run ``terraform init``
#####   4) Run ``terraform apply``, enter the name of your locally saved key_pair pem, and review and agree to the plan
#####   5) Run ``aws elbv2 describe-load-balancers`` and find, copy, and paste the DNSName that begins with "rearc-quest-terraform-lb-" into your search bar
#####   6) Feel the force!
#####   7) Run ``terraform destroy`` to shut down and delete the server and resources
#####   8) Visit ``zenithese.com`` to experience true tls (contact me if you are unable to visit the site as I may have shut down the server to save some money and resources)