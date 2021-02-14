#!/bin/bash

apt-get install -y zsh && \
    chsh -s $(which zsh) && \
    su coder << EOF
cd ~ && \
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh && \
    [ -f "~/.zshrc" ] &&  cp ~/.zshrc ~/.zshrc.orig || \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
    cat ~/.zshrc |grep -q "source  ~/.profile" || echo "source  ~/.profile" >> ~/.zshrc && \
    cat ~/.zshrc |grep -q ":/usr/local/go/bin" || echo "export PATH=\$PATH:/usr/local/go/bin" >>~/.zshrc
EOF
su coder << EOF
pushd ~/.local/share/code-server/User >/dev/null
cp settings.json settings.json.tmp
cat settings.json.tmp |
    jq 'to_entries |
    map(if .key == "terminal.integrated.shell.linux"
        then . + {"value":"/usr/bin/zsh"}
        else .
        end
        ) |
    from_entries' > settings.json
popd
EOF
