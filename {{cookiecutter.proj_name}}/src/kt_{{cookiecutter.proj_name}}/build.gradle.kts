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

////-- imports
// by default:
// - org.gradle.api...
// - org.gradle.kotlin.dsl
// - org.gradle.kotlin.dsl.plugins.dsl
// - org.gradle.kotlin.dsl.precompile
// - java.util.concurrent.{Callable, TimeUnit}
// - java.math.{BigDecimal, BigInteger}
// - java.io.File
// - javax.inject.Inject
import java.io.ByteArrayOutputStream

////-- end imports

////-- plugins
plugins {
    id("java")
    id("maven-publish")
    id("org.jetbrains.kotlin.jvm").version("1.9.10")
}

////-- end plugins

////-- dependencies
java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}

repositories {
    mavenCentral()
    maven("https://raw.githubusercontent.com/jacamo-lang/mvn-repo/master")
    maven("https://repo.gradle.org/gradle/libs-releases")
    maven("https://jitpack.io")
    //maven url: "http://jacamo.sourceforge.net/maven2"
    //maven url: "https://jade.tilab.com/maven/"

    flatDir(Pair("dirs",  listOf("lib")))

}


dependencies {
    implementation("org.jacamo:jacamo:1.2")
    // implementation(project(":other"))
}

////-- end dependencies

////-- publishing
publishing {
    publications {
        create<MavenPublication>("maven") {
            from( components["java"] )
        }
    }
}

////-- end publishing

version         = "1.0"
group           = "org.jacamo"
buildDir        = rootProject.buildDir

val proj_name   = "{{cookiecutter.proj_name}}"
val jcm_file    = "{{cookiecutter.proj_name}}.jcm"
val proj_path   = File(".")
val log_props   = "_configs/logging.properties"
val log_dir     = File(buildDir, "logs")
val launcher    = "jacamo.infra.JaCaMoLauncher"

defaultTasks("run")

////-- source sets
sourceSets {
    main {
        java {
            srcDir(File(proj_path, "kotlin"))
            srcDir(File(proj_path, "java"))

        }
        resources {
            srcDir("../_data")
            srcDir(File(proj_path, "_configs"))
            srcDir(File(proj_path, "agts"))
            srcDir(File(proj_path, "environments"))
            srcDir(File(proj_path, "organisations"))
        }
    }
}

////-- end source sets

// //  --------------------------------------------------

tasks.register<JavaExec>("run") {
    dependsOn("classes")
    group = "JaCaMo"
    description = "runs the JaCaMo application"
    mainClass.set(launcher)
    args(File(proj_path, jcm_file), "--log-conf", File(proj_path,  log_props))
    // jvmArgs = "-Xss15m"
    classpath = sourceSets["main"].runtimeClasspath
    // classpath.set(sourceSets.get("main").getRuntimeClasspath())
    doFirst {
        mkdir(log_dir)
    }
}

tasks.register<JavaExec>("buildJCMDeps") {
    dependsOn("classes")
    mainClass.set("jacamo.infra.RunJaCaMoProject")
    args(File(proj_path, jcm_file), "--deps")
    classpath = sourceSets["main"].runtimeClasspath
}

tasks.jar {
    duplicatesStrategy = DuplicatesStrategy.EXCLUDE
    archiveBaseName.set(project.name)

    from (project.projectDir.absolutePath + proj_path) {
        include("**/*.asl")
        include("**/*.xml")
        include("**/*.sai")
        include("**/*.ptl")
        include("**/*.jcm")
        exclude("tests")
    }
    from (project.buildDir.absolutePath + "/classes") {
        include("**/*")
    }
}

tasks.register<Jar>("uberJar") {
    dependsOn("classes")
    group        = "JaCaMo"
    description  = "creates a single runnable jar file with all dependencies"
    archiveClassifier.set("uber")
    duplicatesStrategy = DuplicatesStrategy.EXCLUDE
    archiveBaseName.set("jacamo-" + proj_name) // the name must start with jacamo so that jacamo...jar is found in the classpath
    manifest {
        attributes( mapOf( "Main-Class" to launcher ) )
        }

    from(sourceSets.main.get().output)
    from({
             configurations.runtimeClasspath.get().filter {it.name.endsWith("jar") }.map { zipTree(it) }
         })
    from (project.projectDir.absolutePath) {
        include("**/*.asl")
        include("**/*.xml")
        include("**/*.sai")
        include("**/*.ptl")
        include("**/*.jcm")
        include("*.properties")
    }
    from (project.buildDir.absolutePath + "/jcm") {
        include( "**/*" )
    }


    doFirst {
        copy {
            from("{{cookiecutter.proj_name}}.jcm" )
            rename("{{cookiecutter.proj_name}}.jcm","default.jcm" )
            into( project.buildDir.absolutePath + "/jcm" )
        }
    }
}

tasks.register("testJaCaMo") {
    description      = "runs JaCaMo unit tests"
    var errorOnTests = false
    outputs.upToDateWhen { false } // disable cache
    var stdout = ByteArrayOutputStream()
    var errout = ByteArrayOutputStream()

    doFirst {
        try {
            javaexec {
                mainClass.set(launcher)
                args(File(proj_path, "tests/tests.jcm"), "--log-conf", File(proj_path, log_props))
                classpath = sourceSets.main.get().runtimeClasspath

                standardOutput = stdout
                errorOutput    = errout
            }
        } catch (e : Exception) {
            errorOnTests = true
        }
    }

    doLast {
        // val styler = "black red green yellow blue magenta cyan white"
        //     .split(" ")
        //     .withIndex()
        //     .associate { (key, value) -> Pair(key, { it : String -> "\\033[${value}m${it}\\033[0m" }) }

        stdout.toString().lines().map  { line ->
            println(line)
            // println(line.replace("TESTING","${styler["yellow"]("TESTING")}")
            //             .replace("PASSED","${styler["green"]("PASSED")}")
            //             .replace("FAILED","${styler["red"]("FAILED")}")
            //             .replace("TODO","${styler["magenta"]("TODO")}")
            //             .replace("LAUNCHING","${styler["blue"]("LAUNCHING")}")
            // )
        }

        errout.toString().lines().map { line ->
            println(line)
            // println(line.replace("TESTING","${styler["yellow"]("TESTING")}")
            //             .replace("PASSED","${styler["green"]("PASSED")}")
            //             .replace("FAILED","${styler["red"]("FAILED")}")
            //             .replace("TODO","${styler["magenta"]("TODO")}")
            //             .replace("LAUNCHING","${styler["blue"]("LAUNCHING")}")
            // )
        }

        if (errorOnTests) {
            throw GradleException("JaCaMo unit tests: ERROR!")
        }
    }
}

tasks.test {
    finalizedBy("testJaCaMo")
}

tasks.clean {
    delete(buildDir)
}

