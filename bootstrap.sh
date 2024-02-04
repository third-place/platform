set -e

helm repo add argocd https://argoproj.github.io/argo-helm
helm dependency update argocd
helm upgrade --install --namespace argocd --create-namespace -f argocd/values.yaml argocd ./argocd

helm upgrade --install --namespace system --create-namespace -f system/values.yaml system ./system
