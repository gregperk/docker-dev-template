FROM python:3.7

ARG release=1.696-vsc1.33.0
RUN wget https://github.com/codercom/code-server/releases/download/$release/code-server$release-linux-x64.tar.gz \
    && tar -xzvf code-server$release-linux-x64.tar.gz \
    && chmod +x code-server$release-linux-x64/code-server \
    && mv code-server$release-linux-x64/code-server /usr/local/bin \
    && rm -rf code-server$release-linux-x64*

COPY imgfiles/docker-entrypoint.sh /usr/local/bin/
RUN mkdir /root/bin
COPY imgfiles/git-reup /root/bin

COPY ./src /src
COPY ./vsdata /vsdata

RUN mkdir /root/.bash_scripts

ENTRYPOINT ["docker-entrypoint.sh"]