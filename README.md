# helm-argocd-ingress



apiVersion: apps/v1
kind: Deployment
metadata:
name: {{ .Values.component }}
namespace: argocd
labels:
appName: {{ .Values.labels.appName }}
project_Name: {{ .Chart.Name }}
spec:
replicas: 2
selector:
matchLabels:
appName: {{ .Values.labels.appName }}
project_Name: {{ .Chart.Name }}
template:
metadata:
labels:
appName: {{ .Values.labels.appName }}
project_Name: {{ .Chart.Name }}
spec:
{{- if .Values.initContainers.enabled }}
volumes:
- name: secrets
emptyDir:
sizeLimit: 5Mi
initContainers:
- name: vault-secrets
image: pavanidevops78/kubernetes:{{ .Values.initContainers.imageVersion }}
env:
- name: VAULT_ADDR
value: "https://vault-internal.pdevops78.online:8200"
- name: VAULT_TOKEN
valueFrom:
secretKeyRef:
name: vault-token
key: token
- name: SECRET_NAME
value: common/{{ .Values.labels.project_name }}-{{ .Values.component }}
- name: VAULT_SKIP_VERIFY
value: "TRUE"
volumeMounts:
- name: secrets
mountPath: /data

      - name: schema
        image: pavanidevops78/kubernetes:{{ .Values.schema.schema_imageVersion }}
        volumeMounts:
          - name: secrets
            mountPath: /data
    {{- end }}

    containers:
      - name: {{ .Values.component }}
        image: pavanidevops78/kubernetes:{{ .Values.containers.cont_imageVersion }}
    {{- if .Values.initContainers.enabled }}
    volumeMounts:
      - name: secrets
        mountPath: /data
    {{- end }}




[//]: # ()
cluster details:
=================
API server endpoint
https://907EA84208E1E40DA23DF58E518C9933.gr7.us-east-1.eks.amazonaws.com
Certificate authority

LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJZERFa25HTDZHVWt3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TlRBNU1EVXdOak01TlRGYUZ3MHpOVEE1TURNd05qUTBOVEZhTUJVeApFekFSQmdOVkJBTVRDbXQxWW1WeWJtVjBaWE13Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLCkFvSUJBUURTbjRUQjZTODhRWFR5bFFsdVVpNlorVzhsOFZBL1ZsbVJEMXA5eWVUYzBNLzd6SFF2ZzhQcGlRVDYKYVJmU1JEbVkwQkF1NVYvdUdiQy9ZT21Xd1Z1L1FEYVJaYlRCSmxKdGVGT3dKRmxhelR6MU5mN0liVzFwclh1SAovY0wrZUNiNFQvK3BUSGRNd0JyM1RleUxYSVFXS2dXNm9Gdk4rd01udERhRDc3RHcvV01EODJRcHhZZjI0SGwvCkMvc2VWd3lKNEtIN05ZNmY5dzM4YmhScjk2dGdpRTVQamU5MTJaL1ZBd1V1cXRQZEtkN1lraGdta0wxdGxDSVkKWEI4bUswbGdJK3RYbTU3d3RHRVVRNDg1dGtRSjFSdjdkRU9KTzhUb0hCS2ltNGUxLzFaVFVOd2RDUFpJS2pwSQpPUU9LYUkxamxJZHNDc2RrRENaSzFpL2Z0Zk16QWdNQkFBR2pXVEJYTUE0R0ExVWREd0VCL3dRRUF3SUNwREFQCkJnTlZIUk1CQWY4RUJUQURBUUgvTUIwR0ExVWREZ1FXQkJRZU9QbzB6ZmUreHI3SzBmUEFtR1lEbmFpRnpUQVYKQmdOVkhSRUVEakFNZ2dwcmRXSmxjbTVsZEdWek1BMEdDU3FHU0liM0RRRUJDd1VBQTRJQkFRQytpSjd0WFZnQQo0Q3ptVEl0TXlkZi9HWjNwV1ZjRWprLzZjaStJY28xZGkzVlkwV2ZFL0lERkVuaGNlRExGdGhrSi9DOEluYXJzClNSTWtoRmlzVTJ0ZnRlRmFDRXlSNTVXVTZNOGc3NmtXdjY3Y2R1R1pqSlhYeEUyNHN0SnN1dGFrZmltMnpQSFAKczRtRzRYQ2hxTG5FeVoydCtFc3JHeG9kcFFUblFzd1VOUkgzM0JUTkxnUVRWTTRvWHREcncwOWc2aWR4aGw5WgoxM1ZQVTIrOEowaVNQZDBhRVVFQTR5TitjeTREZXEwRnlIeTlMSVoxT2h6NHNzZnQxU1NadkJsbzVicG0veDA1ClA5QW9vSjNrSC9FQlkyZzhvdWpnSkFIYnRybW02czhiVVhuNkVDckY5d3loOFlxSklhcDIzNEF6b3hpSCt2UjcKaEZvOEtLQWJxZFBxCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
OpenID Connect provider URL
https://oidc.eks.us-east-1.amazonaws.com/id/907EA84208E1E40DA23DF58E518C9933
Cluster IAM role ARN
arn:aws:iam::041445559784:role/eks-cluster-role
View in IAM
Created
an hour ago
Cluster ARN
arn:aws:eks:us-east-1:041445559784:cluster/eks-cluster-dev
Platform version
Info
eks.12