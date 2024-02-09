set -e

NAMESPACE=$1
SECRET_NAME=$2
SECRET_VALUE=$3

kubeseal --fetch-cert --controller-namespace sealed-secrets --controller-name sealed-secrets > public-key-cert.pem
echo -n "$SECRET_VALUE" | kubeseal --controller-namespace sealed-secrets --controller-name sealed-secrets --cert=public-key-cert.pem --raw --name $SECRET_NAME --namespace $NAMESPACE --scope namespace-wide
rm public-key-cert.pem