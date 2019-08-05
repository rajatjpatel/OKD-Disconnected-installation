hostnamectl set-hostname node101.lab.local && echo "Step Finish" &&
sed -i "\$ a $1 192.168.56.100\t\t$NEW_HOST foreman.lab.local\t$NEW_HOST" /etc/hosts && echo "Step Finish" &&
sed -i "\$ a $1 192.168.56.101\t\t$NEW_HOST node101.lab.local\t$NEW_HOST" /etc/hosts && echo "Step Finish" &&
sed -i "\$ a $1 192.168.56.102\t\t$NEW_HOST node102.lab.local\t$NEW_HOST" /etc/hosts && echo "Step Finish" &&
sed -i "\$ a $1 192.168.56.103\t\t$NEW_HOST node103.lab.local\t$NEW_HOST" /etc/hosts && echo "Step Finish" &&
sed -i "\$ a $1 192.168.56.104\t\t$NEW_HOST node104.lab.local\t$NEW_HOST" /etc/hosts && echo "Step Finish" &&
mkdir -p /etc/docker/certs.d/foreman.lab.local:5000 && echo "Step Finish" &&
curl http://foreman.lab.local/pub/katello-server-ca.crt > /etc/docker/certs.d/foreman.lab.local\:5000/katello-server-ca.crt && echo "Step Finish" &&
scp root@foreman.lab.local:/etc/pki/tls/certs/localhost.crt /etc/docker/certs.d/foreman.lab.local\:5000/ca.crt   && echo "Step Finish" &&
systemctl restart docker && echo "Step Finish" &&

yum update -y && echo "Step Finish" &&
yum install -y wget git  nano net-tools docker-1.13.1 bind-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct openssl-devel httpd-tools NetworkManager python-cryptography python-devel python-passlib java-1.8.0-openjdk-headless "@Development Tools" && echo "Step Finish" &&
yum -y install centos-release-openshift-origin311 epel-release docker git pyOpenSSL && echo "Step Finish" &&
systemctl start NetworkManager && echo "Step Finish" &&
systemctl enable NetworkManager && echo "Step Finish" &&
systemctl status NetworkManager && echo "Step Finish" &&
ssh-keygen -f ~/.ssh/id_rsa -N ''  && echo "Step Finish" &&
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
EOF && echo "Step Finish" &&
chmod 600 ~/.ssh/config && echo "Step Finish" &&

for host in node101.lab.local node102.lab.local node103.lab.local ; do ssh-copy-id -i ~/.ssh/id_rsa.pub $host; done && echo "Step Finish" &&

yum -y install openshift-ansible && echo "Step Finish" &&

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

EOF && echo "Step Finish" &&
ansible-playbook -i inentory.ini /usr/share/ansible/openshift-ansible/playbooks/prerequisites.yml && echo "Step Finish" &&
ansible-playbook -i inentory.ini /usr/share/ansible/openshift-ansible/playbooks/deploy_cluster.yml 
