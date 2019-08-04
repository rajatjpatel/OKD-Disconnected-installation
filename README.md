# OKD-Disconnected-installation  
Frequently, portions of a data center might not have access to the Internet, even via proxy servers. You can still install OpenShift Container Platform in these environments, but you must download required software and images and make them available to the disconnected environment.  After the installation components are available to your node hosts, you install OpenShift Container Platform by following the standard installation steps. 
(https://docs.openshift.com/container-platform/3.11/install/disconnected_install.html)

#Foreman has up to 4G memory and up to 2 vCPU. (https://theforeman.org/)
Foreman is a complete lifecycle management tool for physical and virtual servers. We give system administrators the power to easily automate repetitive tasks, quickly deploy applications, and proactively manage servers, on-premise or in the cloud.

There are some System requirements to configure cluster.

#Master node has up to 16G memory and up to 4 vCPU.

#Compute node has up to 8G memory and up to 1 vCPU.

#On all nodes, base OS is CentOS 7

infra1structure Setup: 
*********************

Hostname			                  IP Address	              CPUs	      RAM	      HDD			              OS		    Role
foreman.lab.local              	192.168.56.100            	 2	        2 GB	    /dev/sda (100 GB) 	CentOS7	  Master Node
node101.lab.local              	192.168.56.101            	 2	        2 GB	    /dev/sda (100 GB) 	CentOS7	  Master Node
node102.lab.local             	192.168.56.102            	 2	        2 GB	    /dev/sda (100 GB) 	CentOS7	  Worker Node 
node103.lab.local             	192.168.56.103            	 2	        2 GB	    /dev/sda (100 GB) 	CentOS7	  Worker Node
node104.lab.local             	192.168.56.104	             2	        2 GB	    /dev/sda (100 GB) 	CentOS7	  infra Node
