FROM debian:bullseye-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl wget jq unzip

ADD ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
