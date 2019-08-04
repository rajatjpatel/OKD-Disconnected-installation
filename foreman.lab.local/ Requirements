Hardware Requirements
Katello may be installed onto a baremetal host or on a virtual guest. The minimum requirements are:

Two Logical CPUs
8 GB of memory (12 GB highly recommended)
The filesystem holding /var/lib/pulp needs to be large, but may vary depending on how many different Operating Systems you wish to syncronize:
Allocate 30 GB of space for each operating system. Even though an operating system may not take up this much space now, this allows space for future updates that will be syncronized later.
The path /var/spool/squid/ is used as a temporary location for some types of repository syncs and may grow to consume 10s of GB of space before the files are migrated to /var/lib/pulp. You may wish to put this on the same partition as /var/lib/pulp.
The filesystem holding /var/lib/mongodb needs at least 4 GB to install, but will vary depending on how many different Operating Systems you wish to syncronize:
Allocate around 40% of the capacity that has been given to the /var/lib/pulp filesystem
The root filesystem needs at least 20 GB of Disk Space
Required Ports
The following ports need to be open to external connections:

80 TCP - HTTP, used for provisioning purposes
443 TCP - HTTPS, used for web access and api communication
5647 TCP - qdrouterd - used for client and Smart Proxy actions
9090 TCP - HTTPS - used for communication with the Smart Proxy
Production
Katello provides a puppet based installer for deploying production installations. Production installations are supported on the following OSes:

OS	
CentOS 7	X
RHEL 7	X
Katello can only run on an x86_64 operating systems.
