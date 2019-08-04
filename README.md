# OKD-Disconnected-installation
Frequently, portions of a data center might not have access to the Internet, even via proxy servers. You can still install OpenShift Container Platform in these environments, but you must download required software and images and make them available to the disconnected environment.  After the installation components are available to your node hosts, you install OpenShift Container Platform by following the standard installation steps.

There are some System requirements to configure cluster.
 Master node has up to 16G memory and up to 4 vCPU.
Compute node has up to 8G memory and up to 1 vCPU.
On all nodes, base OS is RHEL(CentOS) 7.4
