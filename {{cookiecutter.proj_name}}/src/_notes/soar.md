<!--  soar.md -*- mode: gfm-mode -*-  -->
<!--
Summary:

Tags:
-->
Directory Prefix: "soar_"
File Suffixes: ".soar" ".vsa"


# [Soar](https://github.com/SoarGroup/Soar)
- [Manual](https://soar.eecs.umich.edu/soar_manual/)

# Running Soar
```sh
soar -s {file} run
```

# A Simple Project file:
```soar
stop
echo -- Loading
pushd src
load file simple.soar
popd
echo -- Setting WM
wm add S1 ^val start
```

# A Simple Agent File:
```soar
echo \n -- -- Loading simple.soar

sp {hello-world
   (state <s> ^val start)
   -->
   (write |Hello Blah| (crlf))
   (halt)
}
```

# Agent manipulation
- `create {agent}`
- `switch`
- `list`
- `delete`
- `production`
- `print --all`

# WM Manipulation
- `wm add...`
- `print {pattern}`
