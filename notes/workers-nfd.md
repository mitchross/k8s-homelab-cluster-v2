
kubectl get nodes -o yaml | yq '.items[].metadata.labels'
kubectl label node k3s-master-nuc-2 intel=true


kubectl label node k3s-worker-nuc-1 node-role.kubernetes.io/worker=true
kubectl label node k3s-worker-pve-1 node-role.kubernetes.io/worker=true
kubectl label node k3s-worker-pve-2 node-role.kubernetes.io/worker=true
kubectl label node k3s-gpu-worker-pve3-1 node-role.kubernetes.io/worker=true
kubectl label node k3s-worker-pve3-2 node-role.kubernetes.io/worker=true
kubectl label node k3s-worker-dell-1 node-role.kubernetes.io/worker=true
kubectl label node k3s-worker-dell-2 node-role.kubernetes.io/worker=true
kubectl label node k3s-worker-dell-3 node-role.kubernetes.io/worker=true
kubectl label node k3s-worker-nuc-1 node-role.kubernetes.io/intel=true

kubectl label node k3s-gpu-worker-pve3-1 node-role.kubernetes.io/worker=true

kubectl label nodes k3s-worker-nuc-1 node.longhorn.io/create-default-disk=true
kubectl label nodes k3s-worker-pve-1  node.longhorn.io/create-default-disk=true
kubectl label nodes k3s-gpu-worker-pve3-1  node.longhorn.io/create-default-disk=true
kubectl label nodes k3s-worker-nuc-1 node.longhorn.io/storage=true
kubectl label nodes k3s-worker-pve-1  node.longhorn.io/storage=true
kubectl label nodes k3s-worker-pve3-1  node.longhorn.io/storage=true


kubectl label nodes k3s-master-pve-1  longhorn=ssd
kubectl label nodes k3s-worker-nuc-1 longhorn=ssd

kubectl label nodes k3s-worker-pve3-1  feature.node.kubernetes.io/pci-10de.present=true