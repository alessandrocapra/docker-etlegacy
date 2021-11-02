FROM debian:bullseye-slim

LABEL maintainer "Sebastian Danielsson <sebastian.danielsson@protonmail.com>"

RUN apt update && apt install -y curl && rm -rf /var/lib/apt/lists/*

RUN curl https://www.etlegacy.com/download/file/328 | tar xvz; mv etlegacy-*/ /etlegacy;

RUN useradd -Ms /bin/bash etlegacy; chown -R etlegacy:etlegacy /etlegacy

EXPOSE 27960/UDP

WORKDIR /etlegacy

USER etlegacy

ENTRYPOINT ["./etlded"]
CMD ["+set", "fs_game", "legacy", "+set", "fs_homepath", "etmain", "+set", "g_protect", "1", "+exec", "etl_server.cfg"]
