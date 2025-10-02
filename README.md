# k8s-multi-nodes

A Kubernetes multi-node cluster setup on macOS using Lima VMs for learning and development purposes.

## Overview

This repository is forked from [louhisuo/k8s-on-macos](https://github.com/louhisuo/k8s-on-macos) and adapted for educational purposes. It provides a complete setup for building and managing a multi-node Kubernetes cluster on macOS using Lima (Linux virtual machines).

## Features

- **Multi-node cluster**: Control plane and worker nodes
- **Lima-based**: Lightweight Linux VMs on macOS
- **Production-like**: Uses kubeadm, CNI, CSI, and other standard components
- **Modern networking**: Cilium CNI with eBPF and L2 load balancing
- **Gateway API**: Modern ingress with automatic TLS
- **Persistent storage**: Local path provisioner with external storage
- **Task automation**: Task runner for easy cluster management

## Architecture

### Cluster Topologies

The project supports multiple cluster topologies:

- **topo-1-1**: 1 Control Plane + 1 Worker Node
- **topo-1-2**: 1 Control Plane + 2 Worker Nodes  
- **topo-2-3**: 2 Control Planes + 3 Worker Nodes (HA)

### Networking

The cluster uses Lima's shared network with static IP assignments:

| Node         | IP Address      | Role                |
| ------------ | --------------- | ------------------- |
| kube-vip VIP | 192.168.105.100 | API Server endpoint |
| cp-1         | 192.168.105.101 | Control Plane 1     |
| cp-2         | 192.168.105.102 | Control Plane 2     |
| worker-1     | 192.168.105.104 | Worker Node 1       |
| worker-2     | 192.168.105.105 | Worker Node 2       |
| worker-3     | 192.168.105.106 | Worker Node 3       |

**Cilium Load Balancer Pool**: `192.168.105.240-192.168.105.254`

### Components

- **Control Plane**: kubeadm + kube-vip for HA
- **CNI**: Cilium with eBPF dataplane
- **CSI**: Local Path Provisioner for persistent volumes
- **Load Balancer**: Cilium L2 announcements
- **Ingress**: Gateway API with Cilium gateway
- **TLS**: cert-manager for automatic certificate management
- **GitOps**: Flux operator for continuous delivery

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Acknowledgments

- Original project by [louhisuo](https://github.com/louhisuo/k8s-on-macos)
- Lima project for macOS virtualization
- Cilium project for eBPF networking
- Kubernetes community for the ecosystem

---

**Note**: This setup is intended for learning and development purposes. For production use, consider managed Kubernetes services or dedicated infrastructure.
