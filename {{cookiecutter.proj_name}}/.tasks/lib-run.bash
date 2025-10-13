#!/usr/bin/env bash
# Scripts for running aspects of the polyglot project

function run_godot () {
    header "TODO: Run Godot"
}

function run_godot_export () {
    # 1 param. the name of the exported aab.
    header "Exporting to Android"
    godot4 --export-debug Android "$TEMP_DIR/android/${1:-polyglot}.aab"
}

function run_prolog () {
    header "TODO: Run prolog"
}

function run_ansprolog () {
    header "TODO: run ansprolog"
}

function run_rocq () {
    header "TODO: run rocq"
}

function run_dispy () {
    # 1 or 2 args: target, and out
    header "TODO: Python Disassembly"
    local DIS_TARGET="$1"
    shift
    local DIS_OUT="$1"

    [[ -e "$DIS_TARGET" ]] || fail "Python Disassembly Target doesn't exist: $DIS_TARGET"

    if [[ -n "$DIS_OUT" ]]; then
        python -m dis "$DIS_TARGET"
    else
        python -m dis "$DIS_TARGET" > "$DIS_OUT"
    fi
}


# linting --------------------------------------------------


# --------------------------------------------------


# Docs --------------------------------------------------
function run_sphinx () {
    echo "---- Building Sphinx ----"
    local CONF_DIR="$SRC_DIR/_docs"
    local SPHINX_OUT="$DOC_OUT/sphinx"

    sphinx-build \
        --conf-dir "$DOC_DIR" \
        --doctree-dir "$SPHINX_OUT/.doctrees" \
        --warning-file "$LOG_DIR/sphinx.log" \
        --builder "$SPHINX_BUILDER" \
        "$SRC_DIR" \
        "$SPHINX_OUT" || fail "Sphinx Failed"
}

function run_mdbook () {
    echo "---- Building Mkdbook ----"
    mdbook build \
        --dest-dir "$DOC_OUT/mdbook"
}

function run_rustdoc () {
    echo "---- Building Rustdoc ----"
    cargo doc \
        --workspace \
        --target-dir "$DOC_OUT/rustdoc"
}

# android keystore --------------------------------------------
function run_keystore () {
    # up to 2 args. 'new' and the name of the keystore file
    case $1 in
        new)
            KEYSTORE_NAME="${2:-polyglot}"
            header "Generating Android Keystore File: $KEYSTORE_NAME"
            keytool \
                -v \
                -genkey \
                -keystore "${PROJ_ROOT}/${KEYSTORE_NAME}.keystore" \
                -alias "${KEYSTORE_NAME}" \
                -keyalg RSA \
                -validity 10000
        ;;
        *) ;;
    esac
}

# Release --------------------------------------------------
function run_release () {
    # one arg: the level of the version to bump
    local LEVEL="${1:-minor}"
    local CURR_VERSION
    local NEW_VERSION
    if [[ -n $(git --no-pager diff) ]]; then
        fail "There are unstaged changes."
    fi
    towncrier check || fail "There are no fragment changes. Add descriptions of this release."

    header "Running $LEVEL Release"
    CURR_VERSION=$(version version)
    version "$LEVEL" "set" "+"
    NEW_VERSION=$(version version)
    echo "Project Version $CURR_VERSION -> $NEW_VERSION"

    echo "Generating Changelog"
    towncrier build --yes
    pg_export

    git add --all
    git commit -m "[Release]: ${NEW_VERSION}"
    git tag "${NEW_VERSION}"
    }

# Misc Updates --------------------------------------------------
function run_dotnet_update () {
    if [[ -n "$DOTNET_ROOT" ]] && [[ -d "$DOTNET_ROOT" ]]; then
        dotnet new sln
        dotnet sln add ./src/cs_*
    fi
}

# Tex  --------------------------------------------------
function run_tex () {
    header "Tex Compilation"
    for i in $(seq 1 "$PASSES"); do
        _luatex_pass "$i"
    done
    case "$TEX_USE_BIBTEX" in
        1)
            _bibtex_pass $((++i))
            _luatex_pass $((++i))
            _luatex_pass $((++i))
            ;;
        *)
            ;;

    esac
    header "Finished Tex Compilation to $TEX_OUT"
    exit 0
}

function _luatex_pass () {
    # Takes 1 arg: The pass number. the rest arg global args
    header "Pass $1: LuaLaTeX Compiling $TEX_TARGET in $TEX_TARGET_DIR"
    pushd "$TEX_TARGET_DIR" || fail "lualatex pass failed to pushd"
    declare -a ARGS=(
    "--lua=$TEX_LUA_FILE"
    "-interaction=nonstopmode"
    "--output-directory=$TEX_OUT"
    )

    case "$VERBOSE" in
        0)
            echo "..."
            lualatex "${ARGS[@]}" "${TEX_TARGET}.tex" > /dev/null || echo "Pass Exit Value: $?"
            ;;
        *)
            lualatex "${ARGS[@]}" "${TEX_TARGET}.tex" || echo "Pass Exit Value: $?"
            ;;
    esac
    popd || fail "lualatex pass failed to popd"
}

function _bibtex_pass () {
    header "Pass $1: Bibtex $TEX_TARGET in $TEX_OUT"
    pushd "$TEX_OUT" || fail "bibtex pass failed to pushd"
    case "$VERBOSE" in
        0)
            BIBINPUTS="$TARGET_DIR:$DATA_DIR:${BIBINPUTS:-}" bibtex "$TEX_TARGET" > /dev/null
            ;;
        *)
            BIBINPUTS="$TARGET_DIR:${BIBINPUTS:-}" bibtex "$TEX_TARGET"
            ;;
    esac
    popd || fail "bibtex pass failed to popd"
}

function find_tex_file () {
    # Takes 1 or 0 args
    local tex_target_base
    local tex_rel_dir

    TEX_TARGET_FILE=$(fdfind \
        --full-path \
        --extension ".tex" \
        --base-directory "$SRC_DIR" \
        --max-results 1 \
        "${1:-main.tex}" )

    if [[ -z "$TEX_TARGET_FILE" ]]; then
        fail "Could not find a tex target file"
    fi
    tex_rel_base=$(dirname "$TEX_TARGET_FILE")
    tex_target_base=$(basename "$TARGET_FILE" ".tex")
    TEX_TARGET_DIR="$SRC_DIR/$tex_rel_base"
}
