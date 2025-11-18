#!/usr/bin/env bash
set -euo pipefail

tdot "Exporting Tex libraries"
asdf cmd texlive reqs
