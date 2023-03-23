---------------------------------------- Kubeadm Installation ------------------------------------------ 

-------------------------------------- Both Master & Worker Node ---------------------------------------

sudo apt update -y
sudo apt install docker.io -y

sudo systemctl start docker
sudo systemctl enable docker

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt update -y
sudo apt install kubeadm=1.20.0-00 kubectl=1.20.0-00 kubelet=1.20.0-00 -y

--------------------------------------------- Master Node -------------------------------------------------- 
sudo su
kubeadm init

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
  
------------------------------------------- Worker Node ------------------------------------------------ 
sudo su
-----> Paste the Join command on worker node 

---------------------------------------Deploy CNI on Master Node-----------------------------------------

kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

kubectl get nodes 


# worker
# kubeadm join 172.31.84.66:6443 --token n4tfb4.grmew1s1unug0get     --discovery-token-ca-cert-hash sha256:c3fda2eaf5960bed4320d8175dc6a73b1556795b1b7f5aadc07642ed85c51069 --v=5
# kubeadm reset pre-flight checks
