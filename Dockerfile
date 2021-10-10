FROM busybox:1.28

# COPY themes/. /usr/oaf/keycloack/themes/
# RUN mkdir -p /usr/keycloak/themes

# RUN ls /usr/oaf/keycloack/themes/oaf

# CMD ["cp","-r", "/usr/oaf/keycloack/themes/.", "/usr/keycloak/themes"]

COPY themes/. /usr/keycloak/themes
RUN ls /usr/keycloak/themes