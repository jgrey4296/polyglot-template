#!/usr/bin/env bash
# Install scripts for various tooling for polyglot


function install_dotnet () {
    # https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual#scripted-install
    if [[ -n "$DOTNET_ROOT" ]] && [[ -d "$DOTNET_ROOT" ]]; then
        echo "Dotnet installed"
    else
        header "Installing Dotnet"
        mkdir -p .temp/dotnet
        wget https://dot.net/v1/dotnet-install.sh -O "$PROJ_ROOT/.temp/dotnet/dotnet-install.sh"
        chmod +x "$PROJ_ROOT/.temp/dotnet/dotnet-install.sh"
        "$PROJ_ROOT/.temp/dotnet/dotnet-install.sh" --install-dir "$HOME/.local/dotnet"
        sep
    fi
}

function install_jvm () {
    # https://sdkman.io/install/
    if [[ -n "$SDKMAN_DIR" ]] && [[ -d  "$SDKMAN_DIR" ]]; then
        # shellcheck disable=SC1091
        source "$SDKMAN_DIR/bin/sdkman-init.sh"
    else
        header "Installing SDKMAN"
        curl -s "https://get.sdkman.io" | bash
        # shellcheck disable=SC1091
        source "$SDKMAN_DIR/bin/sdkman-init.sh"
        sep
    fi
}

function install_rocq () {
    header "TODO: install rocq"
}
