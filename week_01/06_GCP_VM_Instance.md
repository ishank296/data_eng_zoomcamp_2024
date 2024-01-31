### Generate ssh keys
https://cloud.google.com/compute/docs/connect/create-ssh-keys
### Add public ssh keys to GCP VMs metadata


### Create VM instance from GCP console

### login to VM instance using ssh keys
`ssh -i gcp ishank@vm_public_ip`

### Install Anaconda over VM instance
wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh

### create config file in local ssh client


    Host de-zoomcamp
         HostName <<public ip address>>
         User <<user name>>
         IdentityFile <<private ssh key filepath>>


### Install docker on vm instance

`sudo apt-get install docker.io`

### Run Docker without sudo

`sudo groupadd docker`

`sudo gpasswd -a $USER docker`

`sudo service docker restart`

`newgrp docker`

