{{- define "name" }}
{{ printf "%s-%s" .Release.Name "consumer" }}
{{ end -}}