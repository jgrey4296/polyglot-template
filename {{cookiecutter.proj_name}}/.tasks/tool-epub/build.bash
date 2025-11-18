#!/usr/bin/env bash
#  make-ebook -*- mode: sh -*-

TEMPDIR="$POLYGLOT_ROOT/.temp/epub"

mkdir -p "$TEMPDIR"

zip -r "$TEMPDIR/test.zip" "$POLYGLOT_ROOT/src/_epub"/*
ebook-convert "$TEMPDIR/test.zip" "$TEMPDIR/test.epub"
rm "$TEMPDIR/test.zip"
