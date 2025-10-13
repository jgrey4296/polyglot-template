## godot.md -*- mode: gfm-mode -*-
<!--
Summary:

Tags:
-->

# project.godot


# Android Setup
- [[https://developer.android.com/games/engines/godot/godot-configure]]
- [[https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html]]

Generating a keystore: `cargo polyglot keystore new {name}`.

Set godot editor's:
android sdk path = "$ANDROID_HOME"
java sdk path    = "$JAVA_HOME"
    
Export templates:
android.options.keystore.[release,release user, release password]
    

