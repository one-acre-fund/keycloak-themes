FROM busybox:1.28

COPY themes/. /usr/oaf/keycloack/themes/
RUN mkdir -p /usr/keycloak/themes

CMD ["cp","-r", "/usr/oaf/keycloack/themes/.", "/usr/keycloak/themes"]
