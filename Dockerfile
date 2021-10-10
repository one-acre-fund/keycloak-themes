FROM busybox:1.28

COPY themes/ /usr/keycloak/themes

CMD ["sleep","360"]