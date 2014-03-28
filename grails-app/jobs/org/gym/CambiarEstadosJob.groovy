package org.gym

import org.apache.commons.logging.LogFactory



class CambiarEstadosJob {
    def userService
    private static final log = LogFactory.getLog(this)

    static triggers = {
      log.debug "Entrando a CambiarEstadosJob..."
      simple repeatInterval: 3600000 // 1hr
      log.debug "...y saliendo"
    }

    def execute() {
        // execute job
        log.info "Entrando a quartz execute()..."
        def resp = userService.cambiaEstadoAuto()
        log.info "Saliendo de quartz execute()... " + resp
    }
}
