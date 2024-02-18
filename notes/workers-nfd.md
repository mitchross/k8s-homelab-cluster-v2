
kubectl get nodes -o yaml | yq '.items[].metadata.labels'



kubectl label node k3s-worker-nuc-1 node-role.kubernetes.io/worker=true
kubectl label node k3s-worker-nuc-1 node-role.kubernetes.io/intel=true
kubectl label --overwrite node k3s-worker-nuc-1 node.longhorn.io/create-default-disk="true"

kubectl label node k3s-gpu-worker-pve3-1 node-role.kubernetes.io/worker=true
kubectl label --overwrite node k3s-worker-nuc-1 node.longhorn.io/create-default-disk="true"
kubectl label --overwrite node k3s-gpu-worker-pve3-1 node.longhorn.io/create-default-disk="true"

kubectl label node k3s-worker-dell-1 node-role.kubernetes.io/worker=true
kubectl label --overwrite node k3s-worker-dell-1 node.longhorn.io/create-default-disk="true"
kubectl label --overwrite node k3s-master-dell-1 node.longhorn.io/create-default-disk="true"
kubectl label --overwrite node k3s-master-pve3-1  node.longhorn.io/create-default-disk="true"
kubectl label --overwrite node k3s-worker-dell-2 node.longhorn.io/create-default-disk="true"


k3s-gpu-worker-pve3-1   Ready    <none>                      29m   v1.29.0+k3s1   192.168.1.205
k3s-master-dell-1       Ready    control-plane,etcd,master   31m   v1.29.0+k3s1   192.168.1.199
k3s-master-pve-1        Ready    control-plane,etcd,master   29m   v1.29.0+k3s1   192.168.1.200
k3s-master-pve3-1       Ready    control-plane,etcd,master   29m   v1.29.0+k3s1   192.168.1.201
k3s-worker-dell-1       Ready    <none>                      29m   v1.29.0+k3s1   192.168.1.198
k3s-worker-nuc-1        Ready    <none>                      29m   v1.29.0+k3s1   192.168.1.202

 kubectl label --overwrite node k3s-worker-dell-2 google.feature.node.kubernetes.io/coral: "true"
  hr-restart:
    desc: Restart all failed Helm Releases
    cmds:
      - kubectl get hr --all-namespaces | grep False | awk '{print $2, $1}' | xargs -L1 bash -c 'flux suspend hr $0 -n $1'
      - kubectl get hr --all-namespaces | grep False | awk '{print $2, $1}' | xargs -L1 bash -c 'flux resume hr $0 -n $1'
