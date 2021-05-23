#!/bin/sh

echo Updating deafult styles from last image...

docker run -it \
  -v $(pwd)/defaults:/tmp/defaults \
  --entrypoint sh \
  jboss/keycloak \
  -c "cp -R /opt/jboss/keycloak/themes/* /tmp/defaults/"
