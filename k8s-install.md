Go to the lab Master machine:

STEP 1: On Master Node Only:

Execute below commands to Configure Docker Daemon: 

sudo su –
 
sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/kubernetes/0-install/daemon.json -P /etc/docker

   sudo systemctl restart docker.service
   
   sudo service docker status
## Initialize kubernetes Master Node
 
   sudo kubeadm init 
 
To fix the problem of The connection to the server localhost:8080 was refused - did you specify the right host or port?
 
 Run the below commands 
 
   sudo mkdir -p $HOME/.kube
   
   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
   
   sudo chown $(id -u):$(id -g) $HOME/.kube/config
 
   ## install networking driver -- Weave/flannel/canal/calico etc... 
 
    sudo kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/calico.yaml
    
   
   # Validate:  kubectl get nodes


Step 2: ON ALL Worker Nodes


Configure Docker Daemon: 

sudo su - 

hostname WORKER1

sudo su -

   sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/kubernetes/0-install/daemon.json -P /etc/docker
   
   sudo systemctl restart docker.service
   
   sudo service docker status
   
## Run Below on Master Node to get join token 
 
sudo kubeadm token create --print-join-command 

 
    copy the kubeadm join token from master & run it on all nodes
 
    Ex: sudo kubeadm join 10.128.15.231:6443 --token mks3y2.v03tyyru0gy12mbt \
           --discovery-token-ca-cert-hash sha256:3de23d42c7002be0893339fbe558ee75e14399e11f22e3f0b34351077b7c4b56
 
Validate on master node

kubectl get nodes

kubectl get nodes -o wide


If nodes are with status as NotReady, then delete the node and join it again in the cluster
===================================

Execute below steps:

On Master Node:
==================

kubectl delete node nodename

 kubectl get nodes
 
On the same Worker node that we have to delete:
============================================
 
 kubeadm reset --force
 
On master Node:
======================================
 
generate the token again, execute below command:
  
sudo kubeadm token create --print-join-command 
 
 Copy the token
 
On Worker Node:
===========================
 
 Copy the token, the node will join the master node
 
On Master Node:
 ==================
 
 kubectl get nodes
 
 
 If Master and worker Nodes are Not Ready, try these 2 solutions:
 ==================================================


I set it as below and restarted lab.. its fix issue and all node in ready state.. 

sudo hostnamectl set-hostname master
sudo hostnamectl set-hostname worker1
sudo hostnamectl set-hostname worker2


OR

all 3 nodes recovered: 

Master Node: 

kubeadm reset --force

rm -rf /var/lib/kubelet /etc/kubernetes /var/lib/etcd $HOME/.kube

sudo kubeadm init 

sudo mkdir -p $HOME/.kube

   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
   
   sudo chown $(id -u):$(id -g) $HOME/.kube/config
   
kubectl get nodes

sudo kubeadm token create --print-join-command 

Then on worker nodes we just need to: 

kubeadm reset --force
sudo kubeadm join ...... the value collected from Master Node
no need to install the network again
