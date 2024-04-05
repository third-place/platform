set -e

ENV=$1

echo "upgrade argo for $ENV"

helm upgrade --install --namespace argocd -f ./argocd/values.yaml -f ./argocd/values.$ENV.yaml argocd ./argocd
