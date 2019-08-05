#!/bin/bash
yum -y localinstall https://fedorapeople.org/groups/katello/releases/yum/3.12/katello/el7/x86_64/katello-repos-latest.rpm && echo "Step Finish" &&
yum -y localinstall https://yum.theforeman.org/releases/1.22/el7/x86_64/foreman-release.rpm && echo "Step Finish" && 
yum -y localinstall https://yum.puppet.com/puppet6-release-el-7.noarch.rpm && echo "Step Finish" && 
yum -y localinstall https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && echo "Step Finish" &&
yum -y install foreman-release-scl && echo "Step Finish" &&
yum -y update && echo "Step Finish" && 
yum -y install katello && echo "Step Finish" && 
sed -i "\$ a $1 192.168.56.100\t\t$NEW_HOST foreman.lab.local\t$NEW_HOST" /etc/hosts && echo "Step Finish" && 
hostnamectl set-hostname foreman.lab.local && echo "Step Finish" &&
foreman-installer --scenario katello  --foreman-initial-organization lab --foreman-initial-location UAE  --foreman-initial-admin-username admin --foreman-initial-admin-password password --foreman-compute-ec2-version && echo "Step Finish" &&
sleep 60s
wget -c https://www.centos.org/keys/RPM-GPG-KEY-CentOS-7 -O /tmp/RPM-GPG-KEY-CentOS-7 && echo "Step Finish" &&
wget -c https://centos.org/keys/RPM-GPG-KEY-CentOS-SIG-PaaS -O /tmp/RPM-GPG-KEY-CentOS-SIG-PaaS && echo "Step Finish" &&
wget -c https://centos.org/keys/RPM-GPG-KEY-CentOS-SIG-ConfigManagement -O /tmp/RPM-GPG-KEY-CentOS-SIG-ConfigManagemen && echo "Step Finish" &&
hammer gpg create --key /tmp/RPM-GPG-KEY-CentOS-7  --name 'GPG-CentOS-7' --organization "lab" && echo "Step Finish" &&
hammer gpg create --key /tmp/RPM-GPG-KEY-CentOS-SIG-PaaS  --name 'GPG-CentOS-7-PAAS' --organization "lab" && echo "Step Finish" &&
hammer gpg create --key /tmp/RPM-GPG-KEY-CentOS-SIG-ConfigManagemen  --name 'GPG-CentOS-7-CM' --organization "lab" && echo "Step Finish" &&
hammer product create --name=CentOS --organization "lab" --description CentOS && echo "Step Finish" &&
hammer repository create --name='CentOS 7 - Base - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/os/x86_64/ --gpg-key=GPG-CentOS-7 && echo "Step Finish" &&
hammer repository create --name='CentOS 7 - Updates - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/updates/x86_64/ --gpg-key=GPG-CentOS-7 && echo "Step Finish" &&
hammer repository create --name='CentOS 7 - Extras - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/extras/x86_64/ --gpg-key=GPG-CentOS-7 && echo "Step Finish" &&
hammer repository create --name='CentOS 7 - Fasttrack - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/fasttrack/x86_64/ --gpg-key=GPG-CentOS-7 && echo "Step Finish" &&
hammer repository create --name='CentOS 7 - Cr - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/cr/x86_64/ --gpg-key=GPG-CentOS-7 && echo "Step Finish" &&
hammer repository create --name='CentOS 7 - Centosplus - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/centosplus/x86_64/ --gpg-key=GPG-CentOS-7 && echo "Step Finish" &&
hammer repository create --name='CentOS 7 - Origin311 - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/paas/x86_64/openshift-origin311/ --gpg-key=GPG-CentOS-7-PAAS && echo "Step Finish" &&
hammer repository create --name='CentOS 7 - Ansible26 - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/configmanagement/x86_64/ansible26/ --gpg-key=GPG-CentOS-7-CM && echo "Step Finish" &&
hammer product synchronize --organization='lab' --name='CentOS' && echo "Step Finish" &&
hammer product create --name='Containers' --organization='lab' && echo "Step Finish" &&
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-node' --publish-via-http="true" && echo "Step Finish" &&
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-control-plane' --publish-via-http="true" && echo "Step Finish" &&
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-deployer' --publish-via-http="true" && echo "Step Finish" &&
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-template-service-broker' --publish-via-http="true" && echo "Step Finish" &&
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-pod' --publish-via-http="true" && echo "Step Finish" &&
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-console' --publish-via-http="true" && echo "Step Finish" &&
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-service-catalog' --publish-via-http="true" && echo "Step Finish" &&
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-web-console' --publish-via-http="true" && echo "Step Finish" &&
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='cockpit/kubernetes' --publish-via-http="true" && echo "Step Finish" &&
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/prometheus-node-exporter' --publish-via-http="true" && echo "Step Finish" &&
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://quay.io' --docker-upstream-name='coreos/kube-rbac-proxy' --publish-via-http="true" && echo "Step Finish" &&
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://quay.io' --docker-upstream-name='coreos/coreos/etcd' --publish-via-http="true" && echo "Step Finish" &&
hammer product synchronize --organization='lab' --name='Containers' && echo "Step Finish" &&
