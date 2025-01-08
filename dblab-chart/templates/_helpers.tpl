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

  portPool:
    from: 6000
    to: 6099

databaseContainer:
  containerName: "dblab"


logs:
  level: {{ .Values.dblab.logLevel }}
{{- end }}
