
kubectl get nodes -o yaml | yq '.items[].metadata.labels'
kubectl label node k3s-master-nuc-2 intel=true


kubectl label node k3s-worker-nuc-1 node-role.kubernetes.io/worker=true
kubectl label node k3s-worker-pve-1 node-role.kubernetes.io/worker=true
kubectl label node k3s-worker-pve-2 node-role.kubernetes.io/worker=true
kubectl label node k3s-worker-pve3-1 node-role.kubernetes.io/worker=true
kubectl label node k3s-worker-pve3-2 node-role.kubernetes.io/worker=true
