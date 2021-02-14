#!/bin/bash

mkdir -p ~/.local/share/code-server/User
[ -f "~/.local/share/code-server/User/settings.json" ] || touch ~/.local/share/code-server/User/settings.json
cat << EOF > ~/.local/share/code-server/User/settings.json
{
    "terminal.integrated.shell.linux": "/bin/bash",
    "workbench.colorTheme": "Default Dark+",
    "editor.fontSize": 16
}
EOF
chmod a+w ~/.local/share/code-server/User/settings.json
code-server --install-extension zhuangtongfa.material-theme  && \
    code-server --install-extension MS-CEINTL.vscode-language-pack-zh-hans && \
    code-server --install-extension vscode-icons-team.vscode-icons && \
    code-server --install-extension k--kato.intellij-idea-keybindings && \
    code-server --install-extension eamodio.gitlens
if [ $? -eq 0 ]
then
    pushd ~/.local/share/code-server/User >/dev/null
    python3 -<<EOF
import json
with open("settings.json", "r+") as f:
        j = json.load(f)
        f.seek(0)
        j['workbench.colorTheme'] = "One Dark Pro"
        j['workbench.iconTheme'] = "vscode-icons"
        j['extensions.autoCheckUpdates'] = False
        j['extensions.autoUpdate'] = False
        json.dump(j, f, indent=4)
EOF
    [ -d "argv.json" ] || cat  <<EOF > argv.json
{
    "locale": "en"
}
EOF
    cp argv.json argv.json.tmp && \
        jq '.locale = "zh-cn"' argv.json.tmp > argv.json
    popd
fi