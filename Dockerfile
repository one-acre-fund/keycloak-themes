FROM busybox:1.28

COPY themes/ /usr/oaf/keycloack/
RUN mkdir -p /usr/keycloak/themes

RUN ls /usr/oaf/keycloack
RUN ls /usr/oaf/keycloack/themes

CMD ["cp","-r", "/usr/oaf/keycloack/themes", "/usr/keycloak"]