FROM busybox:1.28

COPY themes/ /usr/oaf/keycloack/themes/

RUN ls /usr/oaf/keycloack/themes/

CMD ["cp","/usr/oaf/keycloack/themes", " /usr/keycloak/themes"]