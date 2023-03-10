FROM ubuntu:22.04

RUN apt update
RUN apt install -y curl

#https://github.com/cosmos/cosmos-sdk/releases/tag/cosmovisor%2Fv1.3.0
RUN curl -L https://github.com/cosmos/cosmos-sdk/releases/download/cosmovisor%2Fv1.3.0/cosmovisor-v1.3.0-linux-amd64.tar.gz | tar xz && mv cosmovisor /usr/local/bin/cosmovisor
RUN mkdir /entrypoint

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod u+x /usr/local/bin/cosmovisor /usr/local/bin/entrypoint.sh

# rest server
EXPOSE 1317
# grpc
EXPOSE 9090
# tendermint p2p
EXPOSE 26656
# tendermint rpc
EXPOSE 26657

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh"]