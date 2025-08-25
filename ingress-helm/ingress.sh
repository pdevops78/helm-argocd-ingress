helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
#helm upgrade --install nginx-ingress ingress-nginx/ingress-nginx -f ingress.yaml
helm upgrade --install nginx-ingress ingress-nginx/ingress-nginx -f ingress.yaml --set controller.enableSslPassthrough=true
kubectl create namespace argocd
kubectl apply -f ingress-dev.yaml -n argocd



#helm upgrade --install nginx-ingress ingress-nginx/ingress-nginx \
#  --namespace ingress-nginx --create-namespace \
#  --set controller.enableSslPassthrough=true

#argocd login argocd.example.com --username admin --password <your-password> --insecure


