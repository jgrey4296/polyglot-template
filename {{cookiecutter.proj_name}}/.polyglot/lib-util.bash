#!/usr/bin/env bash
# Utilities for polyglot

function debug () {
    if [ "${VERBOSE:-0}" -eq 1 ]; then
        echo "$@"
    fi
}

function fail () {
    echo "Failed: $*"
    exit 1
}

function header () {
    echo "-------------------------"
    echo "* $1"
    echo "-------------------------"
}

function subhead () {
    echo "---------- $1"
}

function tdot () {
    echo "... $1"
}

function sep () {
    echo "-------------------------"
}

# init --------------------------------------------------

function init_tex () {
    if [[ -f "$PROJ_ROOT/tex.reqs" ]]; then
        tdot "Initialising Tex"
        mkdir -p "$TEX_OUT"
        asdf cmd texlive deps "$PROJ_ROOT/tex.reqs" > /dev/null
    fi
}

function init_asdf () {
    local words
    # asdf plugin add
    if [[ -e "$ASDF_PLUGIN_LIST" ]]; then
        tdot "Initialising extra asdf plugins"
        while read -r pname url; do
            if [[ -n "$pname" ]]; then
                asdf plugin add "${pname}" "${url}" 2> /dev/null
            fi
        done < "$ASDF_PLUGIN_LIST"
    fi
    asdf install 2> /dev/null
}

function init_py () {
    if [[ -d "$TEMP_DIR/venv" ]]; then
        return
    fi

    tdot "Initialising Python"
    uv venv
    uv sync --all-groups
}

function init_precommit () {
    if [[ -e "$PROJ_ROOT/.pre-commit-config.yaml" ]]; then
        tdot "Installing pre-commit hooks"
        pre-commit install
    fi
}

function init_polyglot () {
    header "Initialising Polyglot Project"
    mkdir -p "$TEMP_DIR"
    init_asdf
    init_py
    init_tex
    init_precommit
    echo "done."
}

# export --------------------------------------------------
function export_asdf () {
    tdot "Exporting ASDF plugins"
    asdf plugin list --urls > "$ASDF_PLUGIN_LIST"
}

function export_tex () {
    tdot "Exporting Tex libraries"
    asdf cmd texlive reqs
}
