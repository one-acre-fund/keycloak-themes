#!/bin/sh

echo After warmup, please login at http://localhost:8080/admin/master/console and login with admin/admin
echo Then select the themes to test at http://localhost:8080/admin/master/console/#/master/realm-settings/themes
echo ================

docker run -it -p 8080:8080 \
  -e KEYCLOAK_DATABASE_VENDOR=dev-file \
  -e KEYCLOAK_ADMIN=admin \
  -e KEYCLOAK_ADMIN_PASSWORD=admin \
  -v $(pwd)/themes:/opt/bitnami/keycloak/themes \
  bitnami/keycloak:21.1.2
