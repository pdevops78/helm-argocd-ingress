helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm show values ingress-nginx/ingress-nginx > custom-values.yaml
helm upgrade --install nginx-ingress ingress-nginx/ingress-nginx -f custom-values.yaml