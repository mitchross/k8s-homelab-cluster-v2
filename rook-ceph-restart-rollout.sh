for deployment in $(kubectl get deployments -n rook-ceph -o jsonpath='{.items[*].metadata.name}')
do
  kubectl rollout restart deployment/$deployment -n rook-ceph
done
