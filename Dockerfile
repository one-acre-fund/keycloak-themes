FROM busybox:1.28

COPY themes/alfresco /usr/oaf/keycloack/themes/
RUN mkdir -p /usr/keycloak/themes

RUN ls /usr/oaf/keycloack/themes

CMD ["cp","-r", "/usr/oaf/keycloack/themes/.", "/usr/keycloak/themes"]