#!/bin/sh
set -e

# Устанавливаем gettext (содержит envsubst) если его нет
if ! command -v envsubst > /dev/null 2>&1; then
    echo "Installing envsubst..."
    apt-get update && apt-get install -y gettext-base
fi

# Подставляем переменные из окружения в конфиг
if [ -f /etc/alertmanager/alertmanager.template.yaml ]; then
    echo "Generating alertmanager.yaml from template..."
    envsubst < /etc/alertmanager/alertmanager.template.yaml > /etc/alertmanager/alertmanager.yaml
fi

# Запускаем оригинальный alertmanager
exec /bin/alertmanager --config.file=/etc/alertmanager/alertmanager.yaml "$@"
