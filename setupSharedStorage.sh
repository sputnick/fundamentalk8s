# setup shared storage with Rook
cd /tmp
git clone https://github.com/rook/rook.git
cd rook/demo/kubernetes

kubectl apply -f rook-operator.yaml
sleep 60
kubectl apply -f rook-cluster.yaml
sleep 60
# will only have mon0 and mon1 if you only have 2 hosts
export MONS=$(kubectl -n rook get pod mon0 mon1 mon2 -o json|jq ".items[].status.podIP"|tr -d "\""|sed -e 's/$/:6790/'|paste -s -d, -)
sed 's#INSERT_HERE#'$MONS'#' rook-storageclass.yaml | kubectl create -f -
