//  build.gradle.kts -*- mode: Kotlin -*-
/*
 {{cookiecutter.proj_name}}

 Gradle build file for JaCaMo Applications
 October 18, 2023 - 00:59:47

 https://docs.gradle.org/current/kotlin-dsl/
 https://docs.gradle.org/current/userguide/kotlin_dsl.html

 Compiled during *configuration phase*.

 Blocks:
 - artifacts
 - ConfigurationContainer
 - dependencies
 - dependencies.constraints
 - plugins
 - buildscript
 - tasks
 -



*/

////-- plugins
plugins {
    id("java")
    id("maven-publish")
    id("org.jetbrains.kotlin.jvm").version("1.9.10")
    id("com.android.application").version("8..13..0")
    id("com.android.library").version("8.13.0")
    id("org.jetbrains.kotlin.android").version("2.1.20")
}

////-- end plugins

apply(from=".tasks/jg.gradle.kts")

// defaultTasks(":kt_{{cookiecutter.proj_name}}:run")

layout.buildDirectory = File(".temp/kotlin")

tasks.clean {
    delete(layout.buildDirectory)
}
