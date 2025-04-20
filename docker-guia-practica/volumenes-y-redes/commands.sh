#!/bin/bash

docker run --name mariadb \
-dp 3306:3306 \
--env MARIADB_USER=example-user \
--env MARIADB_PASSWORD=password \
--env MARIADB_ROOT_PASSWORD=root-secret-password \
--env MARIADB_DATABASE=world-db \
--volume world-db:/var/lib/mysql \
--network world-app \
mariadb:11.2.4-jammy


docker run \
--name phpmyadmin -d \
-e PMA_ARBITRARY=1 \
-p 8080:80 \
--network world-app \
phpmyadmin
