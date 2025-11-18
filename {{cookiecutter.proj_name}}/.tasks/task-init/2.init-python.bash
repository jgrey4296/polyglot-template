#!/usr/bin/env bash

tdot "Initialising Python"
uv venv
uv sync --all-groups
