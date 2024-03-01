set -e

# this only exposes the web-ui, and not any services
k3d cluster create -p 9000:80@loadbalancer

helm repo add argocd https://argoproj.github.io/argo-helm
helm dependency update argocd

helm upgrade --install --namespace argocd --create-namespace -f argocd/values.yaml argocd ./argocd

# helm upgrade --install -f env/dev/values.yaml dev ./env/dev
# helm upgrade --install -f env/prod/values.yaml prod ./env/prod
