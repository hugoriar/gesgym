package org.control

import org.apache.commons.logging.LogFactory



class CambiarEstadosJob {
    def userService

    static triggers = {
      simple repeatInterval: 3600000 // 1hr
    }

    def execute() {
        // execute job
        def resp = userService.cambiaEstadoAuto()
    }
}
