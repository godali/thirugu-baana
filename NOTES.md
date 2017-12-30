# Kubernetes notes: minikube

* minikube start && kubectl version
* kubectl cluster-info -- Gets all cluster info
* kubectl get nodes -- Gets all nodes of the cluster
*  kubectl run thirugu-baana --image=abhijith/thirugu-baana:latest --port 8080 --image-pull-policy=Never -- Creates a new deployment which inturn creates a pod and replica set
* kubectl expose deployment/thirugu-baana --type="NodePort" --port 8080 -- Creates a service by exposing port at 8080
* minikube ip gives ip of the vm locally.
* Kubernetes assigns port for exposed service dynamically.  You can get it using
export NODE_PORT=$(kubectl get services/thirugu-baana -o go-template='{{(index .spec.ports 0).nodePort}}')
* curl $(minikube ip):$NODE_PORT/greeting
* Get pod name using export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
* kubectl label pod $POD_NAME app=v1 -- adds label to given pod
* To delete service kubectl delete service -l run=thirugu-baana. Note that run=thirugu-baana was assigned automatically by k8s
* kubectl scale deployments/thirugu-baana --replicas 4  -- this scales deployments to 4 aka 4 replica sets

Kubernetes 101 notes

* kubectl create -f thirugu-baana.yml -- Creates based on yaml definition
*  kubectl exec -it thirugu-baana -- /bin/sh -- Gets you into running container in pod