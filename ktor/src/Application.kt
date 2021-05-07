package com.example

import io.ktor.application.*
import io.ktor.response.*
import io.ktor.features.*
import io.ktor.http.*
import io.ktor.routing.*
import org.slf4j.event.Level

fun main(args: Array<String>): Unit = io.ktor.server.netty.EngineMain.main(args)

@Suppress("unused") // Referenced in application.conf
@kotlin.jvm.JvmOverloads
fun Application.module() {
    install(CallLogging) {
        level = Level.INFO
    }

    routing {
        route("/api") {
            route("/random") {
                post {
                    try {
                        call.respond(
                            HttpStatusCode.OK,
                            "Ok"
                        )

                    } catch (e: Exception) {
                        call.respond(
                            HttpStatusCode.InternalServerError,
                            "Error"
                        )

                    }
                }
            }
        }
    }

}

