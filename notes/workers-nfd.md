kubectl label node k3s-node-1 node-role.kubernetes.io/worker=true
kubectl label node k3s-node-2 node-role.kubernetes.io/worker=true

  kubectl get nodes -o yaml | yq '.items[].metadata.labels'
