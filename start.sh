#!/bin/bash

set -e

echo "Loading secrets from tg_password.var..."

if [ ! -f tg_password.var ]; then
  echo "ERROR: tg_password.var not found!"
  exit 1
fi

# экспорт переменных
export $(grep -v '^#' tg_password.var | xargs)

# проверка
if [ -z "$BOT_TOKEN" ] || [ -z "$CHAT_ID" ]; then
  echo "BOT_TOKEN or CHAT_ID is empty!"
  exit 1
fi

echo "Generating alertmanager.yaml from template..."

envsubst < alertmanager/alertmanager.template.yaml > alertmanager/alertmanager.yaml

echo "Starting docker compose..."

docker compose up -d

echo "Done!"
