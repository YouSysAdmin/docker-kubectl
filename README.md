# docker-kubectl
![kubectl build status](https://tc.sysalex.com/app/rest/builds/buildType:(id:buildtools_DockerKubectl)/statusIcon) ![docker hub pull](https://img.shields.io/docker/pulls/yousysadmin/docker-kubectl.svg)  

Using `kubectl` in CI / CD with authentication  by token


## Get the credentials:

get cert:
```
kubectl get secret deploy-token-xxxx -o jsonpath='{.data.ca\.crt}' && echo
```
get token:
```
kubectl get secret deploy-token-xxxx -o jsonpath='{.data.token}' | base64 --decode && echo
```

## Environment:
`NAMESPACE` - set namespace for command execution  
`KUBERNETES_SERVER` - Kubernetes API endpoint url  
`KUBERNETES_CERT` - CA cert `base64` _(Default using the cert from file inside container (kubernetes) `/run/secrets/kubernetes.io/serviceaccount/ca.crt`)_  
`KUBERNETES_TOKEN` - service account token _(Default using the token from file inside container (kubernetes) `/run/secrets/kubernetes.io/serviceaccount/token`)_  

## Using script/command inside CI/CD config:
Image: `yousysadmin/docker-kubectl:1.18.14`
```
kubectl get pod -n ${NAMESPACE}
```
