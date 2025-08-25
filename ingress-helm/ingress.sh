helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
#helm show values ingress-nginx/ingress-nginx > custom-values.yaml
helm upgrade --install nginx-ingress ingress-nginx/ingress-nginx -f ingress.yaml
 echo ${kubectl get svc nginx-ingress-ingress-nginx-controller | awk '{print $4}' | tail -1}
