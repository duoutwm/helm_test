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
  useSudo: false

  portPool:
    from: 6000
    to: 6099

databaseContainer:
  dockerImage: "postgres:15"  # Образ PostgreSQL для клонирования
  containerConfig:
    "shm-size": 1gb           # Настройка shared memory
  environment:
    POSTGRES_PASSWORD: "strs5348"
    POSTGRES_USER: "postgres"
    POSTGRES_DB: "postgres"

logs:
  level: {{ .Values.dblab.logLevel }}
{{- end }}
