<!-- ABOUT THE PROJECT -->
## Project
### Notify:

```sh
redis.yaml: база данных, в которой будут храниться оповещения / найденные события.
001-service-account-k8s-event-watcher.yaml: учетная запись службы, которая позволяет Overseer наблюдать за событиями Kubernetes.
overseer-k8s-event-watcher.yaml: рабочий-надзиратель, который будет следить за новыми событиями Kubernetes.
overseer-bridge-webhook-n17.yaml: система уведомлений о найденных событиях.
```
### 
#### Config Overseer

```sh
kubectl apply -f https://raw.githubusercontent.com/cmaster11/overseer/3f8ee2bbc1e5452d292e14c8b3e78960385b7ac9/example-kubernetes/000-namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/cmaster11/overseer/3f8ee2bbc1e5452d292e14c8b3e78960385b7ac9/example-kubernetes/redis.yaml
kubectl apply -f https://raw.githubusercontent.com/cmaster11/overseer/3f8ee2bbc1e5452d292e14c8b3e78960385b7ac9/example-kubernetes/001-service-account-k8s-event-watcher.yaml
kubectl apply -f https://raw.githubusercontent.com/cmaster11/overseer/3f8ee2bbc1e5452d292e14c8b3e78960385b7ac9/example-kubernetes/overseer-k8s-event-watcher.yaml
```
#### Notify template

```sh
label: Overseer
title: "Overseer [{{if .error}}ERR{{if .isDedup}}-DUP{{end}}{{else}}{{if .recovered}}RECOVERED{{else}}OK{{end}}{{end}}] ({{.tag}}): {{.input}}"
content: |-
  {{if .error -}}
  {{if eq .type "k8s-event"}}Event{{else}}Error{{end}}
  {{- if .isDedup}} (duplicated){{end}}: {{.error}}{{end}}
  Tag: {{.tag}}
  Input: {{.input}}
  Target: {{ .target }}
  Type: {{ .type }}
  Time: {{ .time | ParseUnixTime }}
```

#### Webhook config

```sh
https://github.com/cmaster11/overseer/blob/3f8ee2bbc1e5452d292e14c8b3e78960385b7ac9/example-kubernetes/overseer-bridge-webhook-n17.yaml 
to a local directory and replace REPLACE_TEMPLATE_API_KEY with your notification template API key. Then apply the file with kubectl apply -f FILE_PATH.
```
#### Test

```sh
kubectl apply -f https://raw.githubusercontent.com/cmaster11/overseer/master/example-kubernetes/example-failing-job/job-fail.yaml
```
