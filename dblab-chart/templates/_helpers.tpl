{{- define "dblab.serverConfig" -}}
version: 2
server:
  port: {{ .Values.dblab.port }}
  listen: {{.Values.dblab.listen}}
pool:
  name: {{ .Values.dblab.pool }}
  disk: {{ .Values.dblab.disk }}
database:
  primary:
    conn_string: "{{ .Values.dblab.connectionString }}"
  template:
    name: db_template
  template_protection_enabled: true
ssl:
  enabled: false
logs:
  level: info
{{- end }}
