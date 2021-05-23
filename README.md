# keycloak-themes

A list of themes to be used in [Keycloak](https://www.keycloak.org/)

## Development Use

To develop themes, follow the docs instructions and implement your theme under the `themes` directory.

A convenience `run.sh` script is provided to let you launch a local standalone keycloak instance that will use the provided theme name as default. Caching is disabled so you _should_ be able to update your files while the server is running and just refresh the page to see the updates. The script requires Docker to be installed.

Usage:

* Run the script for your desired theme, e.g. `./run.sh alfresco`
* Wait for some warmup time, until the logs indicate e.g. `08:48:58,831 INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0051: Admin console listening on http://127.0.0.1:9990`
* Open up your browser at <http://localhost:8080/auth/admin>
* Test your heart out!

## Production use

To install these in production, you will need to place the desired theme folder(s) into `/opt/jboss/keycloak/themes` of the Keycloak container by either:

* Creating a custom image and perform the copy in your `Dockerfile`
* Mount the folders at runtime.
  * In a Kubernetes environment this could be achieved by mounting an `emptyDir` and creating an `initContainer` that will `git pull` this project at start time into the `emptyDir`.

## References

* [Official Themes Docs](https://www.keycloak.org/docs/latest/server_development/#_themes)
