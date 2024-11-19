## ngrok Kubernetes Operator

The ngrok-operator is the best way to use ngrok if your applications run in Kubernetes environments.

By default, the ngrok-operator runs in a demo mode.
Please provide the required credentials before running in production.

Please ensure that secret exists in your cluster. Below is an example you can use to configure the secret.

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: ngrok-operator-credentials
  namespace: ngrok-operator
stringData:
  API_KEY: "YOUR-API-KEY"
  AUTHTOKEN: "YOUR-AUTHTOKEN"
```

For more information, please see our ingress [controller documentation](https://ngrok.com/docs/k8s/deployment-guide/#creating-the-secret).

### External access to your services

To use the ngrok-operator for your applications all you have to do is apply a YAML file like the one below to handle Ingress.

NOTE: You must reserve a Domain in the [ngrok Dashboard](https://dashboard.ngrok.com/cloud-edge/domains) and substitute it for the host in the example for it to work.

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: service-name-ingress
spec:
  ingressClassName: ngrok
  rules:
    - host: REPLACE-ME-WITH-YOUR-FULL-NGROK-DOMAIN
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: service-name
                port:
                  number: 80
```

This will allow public access to the service running on port 80 in your cluster to the whole world at the domain you specified. For more information about controlling access to your service, please see our [ingress controller annotations documentation](https://ngrok.com/docs/k8s/user-guide/route-modules/).

If you run into any issues or have a feature request, please open an issue in our [ngrok Kubernetes Operator Repo](https://github.com/ngrok/ngrok-operator).
