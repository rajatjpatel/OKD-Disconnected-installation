hostnamectl set-hostname node101.lab.local
sed -i "\$ a $1 192.168.56.101\t\t$NEW_HOST node101.lab.local\t$NEW_HOST" /etc/hosts
sed -i "\$ a $1 192.168.56.102\t\t$NEW_HOST node102.lab.local\t$NEW_HOST" /etc/hosts
sed -i "\$ a $1 192.168.56.103\t\t$NEW_HOST node103.lab.local\t$NEW_HOST" /etc/hosts
sed -i "\$ a $1 192.168.56.104\t\t$NEW_HOST node104.lab.local\t$NEW_HOST" /etc/hosts
yum update -y
yum install -y wget git  nano net-tools docker-1.13.1 bind-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct openssl-devel httpd-tools NetworkManager python-cryptography python-devel python-passlib java-1.8.0-openjdk-headless "@Development Tools"
yum -y install centos-release-openshift-origin311 epel-release docker git pyOpenSSL
systemctl start NetworkManager
systemctl enable NetworkManager
systemctl status NetworkManager
ssh-keygen -f ~/.ssh/id_rsa -N '' 
 cat <<EOF >~/.ssh/config
 Host node101
    Hostname node101.lab.local
    User root
Host node102
    Hostname node102.lab.local
    User root
Host node103
    Hostname node103.lab.local
    User root
EOF
chmod 600 ~/.ssh/config

for host in node101.lab.local node102.lab.local node103.lab.local ; do ssh-copy-id -i ~/.ssh/id_rsa.pub $host; done

yum -y install openshift-ansible

cat <<EOF > ~/inentory.ini
# Create an OSEv3 group that contains the masters, nodes, and etcd groups
[OSEv3:children]
masters
nodes
etcd

# Set variables common for all OSEv3 hosts
[OSEv3:vars]
# SSH user, this user should allow ssh based auth without requiring a password
ansible_ssh_user=root

# If ansible_ssh_user is not root, ansible_become must be set to true
ansible_become=true

openshift_deployment_type=openshift-enterprise

# uncomment the following to enable htpasswd authentication; defaults to DenyAllPasswordIdentityProvider
#openshift_master_identity_providers=[{'name': 'htpasswd_auth', 'login': 'true', 'challenge': 'true', 'kind': 'HTPasswdPasswordIdentityProvider'}]

# host group for masters
[masters]
node101.lab.local

# host group for etcd
[etcd]
node101.lab.local

# host group for nodes, includes region info
[nodes]
node101.lab.local openshift_node_group_name='node-config-master'
node102.lab.local openshift_node_group_name='node-config-compute'
node103.lab.local openshift_node_group_name='node-config-compute'
node104.lab.local openshift_node_group_name='node-config-infra'

EOF
ansible-playbook -i inentory.ini /usr/share/ansible/openshift-ansible/playbooks/prerequisites.yml 
ansible-playbook -i inentory.ini /usr/share/ansible/openshift-ansible/playbooks/deploy_cluster.yml 
