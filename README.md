# Terraform AKS with Flux

## Deploy Infrastructure

```bash
cd terraform
terraform init
terraform apply
terraform destroy
```

## AI Tools in VsCode

```bash
IPADDRESS=$(kubectl get svc -n ollama -o jsonpath='{.items[0].status.loadBalancer.ingress[0].ip}')
sudo sh -c "echo \"${IPADDRESS} www.bankexample.com\" >> /etc/hosts"
export OLLAMA_HOST="${IPADDRESS}:11434"

ollama list
```

## View the Ingress IP

```bash
kubectl get ingress -n ollama
kubectl get svc -n ingress-nginx
kubectl get svc -n fortiweb-ingress
```

## Verify API versions

```bash
for kind in `kubectl api-resources | tail +2 | awk '{ print $1 }'`; do kubectl explain $kind; done | grep -e "KIND:" -e "VERSION:"
```

## Flux Commands

```bash
kubectl get helmrepository,helmrelease,gitrepository,kustomization
```
