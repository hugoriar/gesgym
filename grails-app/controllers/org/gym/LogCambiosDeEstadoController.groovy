package org.gym

import org.springframework.dao.DataIntegrityViolationException

/**
 * LogCambiosDeEstadoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class LogCambiosDeEstadoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        if (!params.order) {
            params.sort = "fechaDeOperacion"
            params.order = "desc"
        }
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [logCambiosDeEstadoInstanceList: LogCambiosDeEstado.list(params), logCambiosDeEstadoInstanceTotal: LogCambiosDeEstado.count()]
    }

    def create() {
        [logCambiosDeEstadoInstance: new LogCambiosDeEstado(params)]
    }

    def save() {
        def logCambiosDeEstadoInstance = new LogCambiosDeEstado(params)
        if (!logCambiosDeEstadoInstance.save(flush: true)) {
            render(view: "create", model: [logCambiosDeEstadoInstance: logCambiosDeEstadoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'logCambiosDeEstado.label', default: 'LogCambiosDeEstado'), logCambiosDeEstadoInstance.id])
        redirect(action: "show", id: logCambiosDeEstadoInstance.id)
    }

    def show() {
        def logCambiosDeEstadoInstance = LogCambiosDeEstado.get(params.id)
        if (!logCambiosDeEstadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logCambiosDeEstado.label', default: 'LogCambiosDeEstado'), params.id])
            redirect(action: "list")
            return
        }

        [logCambiosDeEstadoInstance: logCambiosDeEstadoInstance]
    }

    def edit() {
        def logCambiosDeEstadoInstance = LogCambiosDeEstado.get(params.id)
        if (!logCambiosDeEstadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logCambiosDeEstado.label', default: 'LogCambiosDeEstado'), params.id])
            redirect(action: "list")
            return
        }

        [logCambiosDeEstadoInstance: logCambiosDeEstadoInstance]
    }

    def update() {
        def logCambiosDeEstadoInstance = LogCambiosDeEstado.get(params.id)
        if (!logCambiosDeEstadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logCambiosDeEstado.label', default: 'LogCambiosDeEstado'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (logCambiosDeEstadoInstance.version > version) {
                logCambiosDeEstadoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'logCambiosDeEstado.label', default: 'LogCambiosDeEstado')] as Object[],
                        "Another user has updated this LogCambiosDeEstado while you were editing")
                render(view: "edit", model: [logCambiosDeEstadoInstance: logCambiosDeEstadoInstance])
                return
            }
        }

        logCambiosDeEstadoInstance.properties = params

        if (!logCambiosDeEstadoInstance.save(flush: true)) {
            render(view: "edit", model: [logCambiosDeEstadoInstance: logCambiosDeEstadoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'logCambiosDeEstado.label', default: 'LogCambiosDeEstado'), logCambiosDeEstadoInstance.id])
        redirect(action: "show", id: logCambiosDeEstadoInstance.id)
    }

    def delete() {
        def logCambiosDeEstadoInstance = LogCambiosDeEstado.get(params.id)
        if (!logCambiosDeEstadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logCambiosDeEstado.label', default: 'LogCambiosDeEstado'), params.id])
            redirect(action: "list")
            return
        }

        try {
            logCambiosDeEstadoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'logCambiosDeEstado.label', default: 'LogCambiosDeEstado'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'logCambiosDeEstado.label', default: 'LogCambiosDeEstado'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
