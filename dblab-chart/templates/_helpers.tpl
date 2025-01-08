{{- define "dblab.serverConfig" -}}
version: 2
server:
  port: {{ .Values.dblab.webPort }}
  listen: {{ .Values.dblab.listen }}

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

provision:
  useSudo: true

logs:
  level: {{ .Values.dblab.logLevel }}
{{- end }}
