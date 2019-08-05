# OKD-Disconnected-installation  
Frequently, portions of a data center might not have access to the Internet, even via proxy servers. You can still install OpenShift Container Platform in these environments, but you must download required software and images and make them available to the disconnected environment.  After the installation components are available to your node hosts, you install OpenShift Container Platform by following the standard installation steps. 
(https://docs.openshift.com/container-platform/3.11/install/disconnected_install.html)

OKD installation Red Hat Tested Integrations KB (https://access.redhat.com/articles/2176281) We need to match Ansible and Docker version.

#Foreman has up to 4G memory and up to 2 vCPU. (https://theforeman.org/)
Foreman is a complete lifecycle management tool for physical and virtual servers. We give system administrators the power to easily automate repetitive tasks, quickly deploy applications, and proactively manage servers, on-premise or in the cloud.

There are some System requirements to configure cluster.

#Master node has up to 16G memory and up to 4 vCPU.

#Compute node has up to 8G memory and up to 1 vCPU.

#On all nodes, base OS is CentOS 7

Once "Foreman Server" got all required products add and sync completed "CentOS Base/Update/Extras/Fasttracke/Centos-Ansible/Openshift311/CentosPlus" & Docker images which required offline install for OpenShift(OKD) V3.11.0.


