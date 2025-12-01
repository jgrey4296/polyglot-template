<!--  sclang.md -*- mode: markdown-mode -*- -->
<!--
Summary:

Tags:

-->
Directory Prefix: "sc_"
File Suffix: ".scd" / ".sc"

# [Supercollider](https://supercollider.github.io/)

## Enabling real time processing
`dpkg-reconfigure -p high supercollider`

## Starting on Linux
Needs JACK to be set to use JACK-dbus,
and device to be changed from 'default' to the correct device.

## Downloaded Quarks
Use a `$XDG_CONFIG_HOME/SuperCollider/sclang_conf.yaml` file:

```yaml
includePaths:
    - /home/john/.local/share/SuperCollider/downloaded-quarks/scel
excludePaths:
    []
postInlineWarnings: false
excludeDefaultPaths: false
```

## Links
- [SC Docs](https://docs.supercollider.online/)
- [SC Book Code](https://github.com/supercollider/scbookcode)
