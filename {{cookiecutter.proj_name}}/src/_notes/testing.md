<!--  testing.md -*- mode: gfm-mode -*-  -->
<!--
Summary:

Tags:
-->
Test Directory Name: "__tests"

# Testing

## Python

[Pytest](https://docs.pytest.org/en/stable/index.html)

Test Files are of the format "{}_tests.py"
Configured in `pyproject.toml`

## Prolog

## Elixir
```mix test```


[ExUnit](https://hexdocs.pm/ex_unit/1.19.3/ExUnit.html)
`mix.exs` project files set `test_paths` to "__tests".

## Godot

Using [GUT](https://gut.readthedocs.io/en/v9.5.0/).
Run Tests as `godot --no-header --headless -d -s --path "$PWD" addons/gut/gut_cmdln.gd -gexit __tests`
Or throught asdf: `asdf cmd godot test __tests`

## Kotlin
```gradle test```
[JUnit](https://junit.org/junit5/)

## OPA

## Octave

## Rust

## Supercollider

## Rocq

## Dotnet