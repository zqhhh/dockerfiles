FROM codercom/code-server

WORKDIR /myinit
COPY favicon.ico init.sh ./
RUN sudo bash init.sh

COPY init_coder.sh .
RUN bash init_coder.sh

RUN curl -sSL sh.sadeye.cn/go.sh | sudo bash && \
    code-server --install-extension golang.go

# set python
RUN sudo apt-get install -y python3-pip && \
    sudo pip3 install --system virtualenv && \
    pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple/ && \
    sudo pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple/ && \
    cd /tmp && curl -L -o ms-python-release.vsix  https://github.com/microsoft/vscode-python/releases/download/2020.11.358366026/ms-python-release.vsix && \
    code-server --install-extension  ms-python-release.vsix && \
    rm -rf ms-python-release.vsix

COPY install_ohmyzsh.sh .
RUN sudo bash install_ohmyzsh.sh

# install node
RUN curl -sSL sh.sadeye.cn/node.sh | sudo bash

# reset
WORKDIR /workspace
RUN sudo chown coder:coder /workspace

# after do
RUN sudo  rm -rf /tmp/* && \
    sudo rm -rf /var/cache/* && \
    sudo ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime