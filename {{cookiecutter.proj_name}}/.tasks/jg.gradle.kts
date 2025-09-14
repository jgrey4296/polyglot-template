// //  jg.gradle.kts<3> -*- mode: Kotlin -*-

class JGScriptPlugin: Plugin<Project> {
    override fun apply(project: Project) {
        project.task("jg") {
            group = "JG"
            val myname: String? by project
            val myval = "blah"

            fun simpleFunction () {
                println("simple function")
            }

            doFirst {
                println("Starting")
            }

            doLast {
                println("Finishing ${myname ?: "not provided"}")
                project.exec {
                    commandLine("echo", myval)
                }
                simpleFunction()
            }

        }
    }
}
apply<JGScriptPlugin>()
