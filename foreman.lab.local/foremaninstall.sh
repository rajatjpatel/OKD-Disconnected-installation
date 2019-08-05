#!/bin/bash
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`
yum -y localinstall https://fedorapeople.org/groups/katello/releases/yum/3.12/katello/el7/x86_64/katello-repos-latest.rpm 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
yum -y localinstall https://yum.theforeman.org/releases/1.22/el7/x86_64/foreman-release.rpm 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi 
yum -y localinstall https://yum.puppet.com/puppet6-release-el-7.noarch.rpm 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi 
yum -y localinstall https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
yum -y install foreman-release-scl 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
yum -y update 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi 
yum -y install katello 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi 
sed -i "\$ a $1 192.168.56.100\t\t$NEW_HOST foreman.lab.local\t$NEW_HOST" /etc/hosts 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi 
hostnamectl set-hostname foreman.lab.local 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
foreman-installer --scenario katello  --foreman-initial-organization lab --foreman-initial-location UAE  --foreman-initial-admin-username admin --foreman-initial-admin-password password --foreman-compute-ec2-version 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
sleep 60s
wget -c https://www.centos.org/keys/RPM-GPG-KEY-CentOS-7 -O /tmp/RPM-GPG-KEY-CentOS-7 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
wget -c https://centos.org/keys/RPM-GPG-KEY-CentOS-SIG-PaaS -O /tmp/RPM-GPG-KEY-CentOS-SIG-PaaS 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
wget -c https://centos.org/keys/RPM-GPG-KEY-CentOS-SIG-ConfigManagement -O /tmp/RPM-GPG-KEY-CentOS-SIG-ConfigManagemen 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer gpg create --key /tmp/RPM-GPG-KEY-CentOS-7  --name 'GPG-CentOS-7' --organization "lab" 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer gpg create --key /tmp/RPM-GPG-KEY-CentOS-SIG-PaaS  --name 'GPG-CentOS-7-PAAS' --organization "lab" 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer gpg create --key /tmp/RPM-GPG-KEY-CentOS-SIG-ConfigManagemen  --name 'GPG-CentOS-7-CM' --organization "lab" 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer product create --name=CentOS --organization "lab" --description CentOS 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='CentOS 7 - Base - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/os/x86_64/ --gpg-key=GPG-CentOS-7 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='CentOS 7 - Updates - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/updates/x86_64/ --gpg-key=GPG-CentOS-7 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='CentOS 7 - Extras - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/extras/x86_64/ --gpg-key=GPG-CentOS-7 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='CentOS 7 - Fasttrack - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/fasttrack/x86_64/ --gpg-key=GPG-CentOS-7 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='CentOS 7 - Cr - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/cr/x86_64/ --gpg-key=GPG-CentOS-7 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='CentOS 7 - Centosplus - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/centosplus/x86_64/ --gpg-key=GPG-CentOS-7 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='CentOS 7 - Origin311 - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/paas/x86_64/openshift-origin311/ --gpg-key=GPG-CentOS-7-PAAS 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='CentOS 7 - Ansible26 - x86_64' --organization "lab" --product='CentOS' --content-type='yum' --publish-via-http=true --url=http://mirror.centos.org/centos/7/configmanagement/x86_64/ansible26/ --gpg-key=GPG-CentOS-7-CM 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer product synchronize --organization='lab' --name='CentOS' 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer product create --name='Containers' --organization='lab' 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-node' --publish-via-http="true" 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-control-plane' --publish-via-http="true" 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-deployer' --publish-via-http="true" 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-template-service-broker' --publish-via-http="true" 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-pod' --publish-via-http="true" 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-console' --publish-via-http="true" 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-service-catalog' --publish-via-http="true" 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/origin-web-console' --publish-via-http="true" 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='cockpit/kubernetes' --publish-via-http="true" 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://docker.io' --docker-upstream-name='openshift/prometheus-node-exporter' --publish-via-http="true" 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://quay.io' --docker-upstream-name='coreos/kube-rbac-proxy' --publish-via-http="true" 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer repository create --name='centos' --organization='lab' --product='Containers' --content-type='docker' --url='https://quay.io' --docker-upstream-name='coreos/coreos/etcd' --publish-via-http="true" 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
hammer product synchronize --organization='lab' --name='Containers' 
if [ $? == 0 ]
  then 
echo "${green}command executed successfull${reset}"
  else
echo " ${red}command failed to execute${reset}"
fi
