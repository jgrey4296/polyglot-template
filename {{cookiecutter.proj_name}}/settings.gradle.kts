// //  settings.gradle.kts -*- mode: Kotlin -*-
// https://docs.gradle.org/current/userguide/settings_file_basics.html

rootProject.name = "{{cookiecutter.proj_name}}"

// path separator ':'
include(":kt_{{cookiecutter.proj_name}}")

project(":kt_{{cookiecutter.proj_name}}").projectDir = File("src/kt_{{cookiecutter.proj_name}}")

buildcache {
    local {
        directory = File(rootDir, ".temp/gradle-cache/local")
    }
}