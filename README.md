1 - Install git     
apt-install git

2 - Clone the repo     
git clone https://github.com/rk280392/terraform-deploy-aws.git


3 - Install python3-pip     
apt install python3-pip

4 - Install configure awscli     
pip3 install awscli

Look for any warnings, it might show the [ath where awscli is installed and instructing to add it. In my case it was installed in /home/vagrant/.local/bin, so had to add it to /etc/environment

5 - vim /etc/environment  
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/vagrant/.local/bin"


After editing, save and close, then do 

source /etc/environment   

6 - aws configure --profile learning  

Put your access_key and secret_access_key with default region when asked.

[learning]
aws_access_key_id = REDACTED  
aws_secret_access_key = REDACTED

[default]  
[profile learning]  
region = us-east-2  
output = json  

7 - Test the setup

export AWS_DEFAULT_PROFILE=learning   
export AWS_PROFILE=learning   
aws sts get-caller-identity   
aws ec2 describe-instances   

8 - Install terraform
https://www.terraform.io/downloads.html

wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip    
unzip terraform_0.12.24_linux_amd64.zip  
sudo v terraform /usr/bin   

9 - place your aws .pem file in project directory and make changes the the key-pair script. Replace your kubernetes.pem with your file.pem name.

10 - Run key-pair.sh

It will create a key pair and install it on your aws server 

11 - run add-env.sh

12 - terraform init

13 - run terraform plan

14 - terraform apply

