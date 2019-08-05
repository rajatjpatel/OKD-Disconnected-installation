hostnamectl set-hostname node104.lab.local && echo "Step Finish" &&
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
