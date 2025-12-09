<!-- docs.md -*- mode: gfm-mode -*- -->
<!--
Summary:

Tags:
-->

# Documentation Generation

## [Sphinx](https://www.sphinx-doc.org/)

Configured in src/_sphinx/conf.py,
Converts .rst files.
Makes use of src/data/[templates, static, theme]

## [MdBook](https://rust-lang.github.io/mdBook/)

Configured in /book.toml,
Converts .md files in /src/_book

## [RustDoc](https://doc.rust-lang.org/rustdoc/what-is-rustdoc.html)


## [docfx](https://dotnet.github.io/docfx)

Configured in /docfx.json
Converts .md files in src/_docfx

## [Doxygen](http://www.doxygen.nl/manual/)
## [Dokka](https://kotlinlang.org/docs/dokka-cli.html)
## [Exdoc](https://elixir-lang.org/)
# Deployment

## [Readthedocs](https://docs.readthedocs.io/en/stable/)

Configured in .readthedocs.yaml
Uses polyglot docs to build sphinx site.

## [github pages](https://github.com/actions/configure-pages)

Configured in .github/workflows/pages.yml
Uses polyglot docs to build sphinx site

# Other
## [TexLive](https://www.tug.org/texlive) / [LuaLatex](https://www.luatex.org/)

Configured using tex.reqs and init.tex.lua
Polyglot docs builds tex files in src/_tex/main.tex

## [Epub]

src/_epub is structured as an epub.
polyglot docs zips it and converts to .epub using calibre.

## [Changelog]

configured in towncrier.toml,
changes are recorded in src/_changes
polyglot release builds the chanagelog into CHANGELOG.md

## Checklist
