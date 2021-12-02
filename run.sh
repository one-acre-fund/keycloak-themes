#!/bin/sh

if [ "$1" == "" ]; then
  echo Usage: $0 THEME_NAME
  echo Available themes:
  ls -b themes
  exit 1
fi

if ! [ -d "themes/$1" ]; then
  echo Invalid theme: $1
  echo Available themes:
  ls -b themes
  exit 1
fi

echo Testing theme $1
echo After warmup, please login at http://localhost:8080/auth/admin/ and login with admin/admin
echo ================

docker run -it -p 8080:8080 \
  -e KEYCLOAK_DEFAULT_THEME="$1" \
  -e KEYCLOAK_USER=admin \
  -e KEYCLOAK_PASSWORD=admin \
  -v "$(pwd)/themes/$1":/opt/jboss/keycloak/themes/$1 \
  -v "$(pwd)/resources/standalone.xml":/opt/jboss/keycloak/standalone/configuration/standalone.xml \
  jboss/keycloak
