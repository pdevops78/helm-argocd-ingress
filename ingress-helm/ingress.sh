helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm upgrade --install nginx-ingress ingress-nginx/ingress-nginx -f ingress.yaml
kubectl create namespace argocd
kubectl apply -f ingress-dev.yaml -n argocd


