FROM debian:bullseye-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl wget jq unzip

RUN curl https://raw.githubusercontent.com/bherbruck/install-balena-cli/main/install-balena-cli | bash

ADD ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
