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
