FROM debian:oldstable

RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server

COPY ./tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

ENTRYPOINT [ "./setup.sh" ]