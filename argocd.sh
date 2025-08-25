kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
 argocd login ${kubectl get ingress -A| grep argocd | awk '{print $4}' | tail -1} --username admin --password $(argocd admin initial-password -n argocd | head -1) --insecure --grpc-web
   for app in frontend backend; do
   argocd app create ${app} --repo https://github.com/pdevops78/expense-helm-argocd.git --path chart --upsert --dest-server https://kubernetes.default.svc --dest-namespace default --insecure  --grpc-web --values values/${app}.yaml
   done