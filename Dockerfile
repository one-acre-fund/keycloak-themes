FROM busybox:1.28

COPY themes/ /usr/oaf/keycloack/themes/
RUN mkdir -p /usr/keycloak/


CMD ["cp","-r", "/usr/oaf/keycloack/themes", "/usr/keycloak"]