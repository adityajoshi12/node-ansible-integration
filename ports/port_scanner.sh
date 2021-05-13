#!/bin/bash

PORT1=443
PORT2=6443
PORT3=10251
PORT4=10252
PORT5=10250
PORT6=111
PORT7=2049
PORT8=2379
PORT9=2380
PORT10=8472
PORT11=30000-32767
PUBLICIP=$(dig +short myip.opendns.com @resolver1.opendns.com) 
DELAY=2




echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@ Looking for required ports @@@@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



if [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT1|tail -3|head -1|awk '{print $2}')"  == "closed" ] || [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT1|tail -3|head -1|awk '{print $2}')"  == "open" ] ; then
echo "port 443 avaialable"
else
echo "open the port 443 for futher steps. Port 443 required for Kubernetes setup "
exit 
fi

if [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT2|tail -3|head -1|awk '{print $2}')"  == "closed" ] || [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT2|tail -3|head -1|awk '{print $2}')"  == "open" ] ; then
echo "port 6443 avaialable"
else
echo "open the port 6443 for futher steps.Port  6443 required for Kubernetes API Server "   
exit
fi

if [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT3|tail -3|head -1|awk '{print $2}')"  == "closed" ] || [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT3|tail -3|head -1|awk '{print $2}')"  == "open" ] ; then
echo "port 10251 avaialable"
else
echo "open the port 10251 for futher steps.Port 10251 required for kube-scheduler."   
exit
fi

if [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT4|tail -3|head -1|awk '{print $2}')"  == "closed" ] || [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT4|tail -3|head -1|awk '{print $2}')"  == "open" ] ; then
echo "port 10252 avaialable"
else
echo "open the port 10252 for futher steps.Port 10252 kube-controller-manager."   
exit
fi


if [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT5|tail -3|head -1|awk '{print $2}')"  == "closed" ] || [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT5|tail -3|head -1|awk '{print $2}')"  == "open" ] ; then
echo "port 10250 avaialable"
else
echo "open the port 10250 for futher steps.Port 10250 Kubelet API service."   
fi

if [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT6|tail -3|head -1|awk '{print $2}')"  == "closed" ] || [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT6|tail -3|head -1|awk '{print $2}')"  == "open" ] ; then
echo "port 111 avaialable"
else
echo "open the port 111  for futher steps.Port 111 required for NFS service."   
exit
fi


if [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT7|tail -3|head -1|awk '{print $2}')"  == "closed" ] || [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT7|tail -3|head -1|awk '{print $2}')"  == "open" ] ; then
echo "port 2049 avaialable"
else
echo "open the port 2049 for futher steps.Port 2049 required for etcd server client API."   
exit
fi

if [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT8|tail -3|head -1|awk '{print $2}')"  == "closed" ] || [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT8|tail -3|head -1|awk '{print $2}')"  == "open" ] ; then
echo "port 2379 avaialable"
else
echo "open the port 2379 for futher steps.Port 2379 required for etcd server client API."   
exit
fi



if [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT9|tail -3|head -1|awk '{print $2}')"  == "closed" ] || [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT9|tail -3|head -1|awk '{print $2}')"  == "open" ] ; then
echo "port 2380 avaialable"
else
echo "open the port 2380 for futher steps.Port 2380 required for etcd server client API."   
exit
fi

#if [ "$(sudo nmap -p $PORT10 -sU $PUBLICIP|tail -3|head -1|awk '{print $2}')"  == "closed" ] || [ "$(sudo nmap -p $PORT10 -sU $PUBLICIP|tail -3|head -1|awk '{print $2}')"  == "open" ] ; then
#echo "port 8472 avaialable"
#else
#echo "open the port 8472 for futher steps.Port 8472 required for accessing node port"   
#fi

if [ "$(sudo nmap -p $PORT10 -sU $PUBLICIP|tail -3|head -1|awk '{print $2}')"  == "closed" ] || [ "$(sudo nmap -Pn $PUBLICIP  -p $PORT10|tail -3|head -1|awk '{print $2}')"  == "closed" ] ; then
echo "port 8472 avaialable"
else
echo "open the port 8472 for futher steps.Port 8472 required for accessing node port"   
fi



#if [ "$(nmap -p $PORT11 $PUBLICIP|tail -3|head -1|awk '{print $NF}'" == "closed" ] || [ "$(nmap -p $PORT11 $PUBLICIP|tail -3|head -1|awk '{print $NF}')" == "open" ]; then
#echo "port 30000-32767 avaialable"
#else
#echo "open the port range 30000-32767 for futher steps.Port range 30000-32767 required for NodePort Services"   
#exit
#fi

if [ "$(nmap -p $PORT11 $PUBLICIP|tail -3|head -1|awk '{print $NF}')" == "closed" ] || [ $"(nmap -p $PORT11 $PUBLICIP|tail -3|head -1|awk '{print NF}')" == "open" ]; then
echo "port 30000-32767 avaialable"
else
echo "open the port range 30000-32767 for futher steps.Port range 30000-32767 required for NodePort Services"   
exit
fi
