#!/bin/bash
    update_repo()
    {
    sudo apt-get update && sudo apt-get install  ca-certificates  curl  gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    }
    docker_install()
    {
        sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io
        sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl
        sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
        echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
    }

    install_kubectl()
    {
        sudo apt-get update
        sudo apt-get install -y kubelet=1.21.0-00 kubeadm=1.21.0-00 kubectl=1.21.0-00
        sudo apt-mark hold kubelet kubeadm kubectl
    }
    cluster_init()
    {
        kubeadm init | tail -2 - > kube
        mkdir -p /home/ubuntu/.kube && cp -i /etc/kubernetes/admin.conf /home/ubuntu/.kube/config
        chown ubuntu:ubuntu /home/ubuntu/.kube/config

        curl https://projectcalico.docs.tigera.io/manifests/calico.yaml -O
        kubectl apply -f calico.yaml
        echo "copy kube output and paste it to worker node"
    }

    update_repo
    docker_install
    install_kubectl
    cluster_init
