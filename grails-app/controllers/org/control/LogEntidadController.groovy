package org.control

import org.springframework.dao.DataIntegrityViolationException

/**
 * LogEntidadController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class LogEntidadController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [logEntidadInstanceList: LogEntidad.list(params), logEntidadInstanceTotal: LogEntidad.count()]
    }

    def create() {
        [logEntidadInstance: new LogEntidad(params)]
    }

    def save() {
        def logEntidadInstance = new LogEntidad(params)
        if (!logEntidadInstance.save(flush: true)) {
            render(view: "create", model: [logEntidadInstance: logEntidadInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'logEntidad.label', default: 'LogEntidad'), logEntidadInstance.id])
        redirect(action: "show", id: logEntidadInstance.id)
    }

    def show() {
        def logEntidadInstance = LogEntidad.get(params.id)
        if (!logEntidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logEntidad.label', default: 'LogEntidad'), params.id])
            redirect(action: "list")
            return
        }

        [logEntidadInstance: logEntidadInstance]
    }

    def edit() {
        def logEntidadInstance = LogEntidad.get(params.id)
        if (!logEntidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logEntidad.label', default: 'LogEntidad'), params.id])
            redirect(action: "list")
            return
        }

        [logEntidadInstance: logEntidadInstance]
    }

    def update() {
        def logEntidadInstance = LogEntidad.get(params.id)
        if (!logEntidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logEntidad.label', default: 'LogEntidad'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (logEntidadInstance.version > version) {
                logEntidadInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'logEntidad.label', default: 'LogEntidad')] as Object[],
                        "Another user has updated this LogEntidad while you were editing")
                render(view: "edit", model: [logEntidadInstance: logEntidadInstance])
                return
            }
        }

        logEntidadInstance.properties = params

        if (!logEntidadInstance.save(flush: true)) {
            render(view: "edit", model: [logEntidadInstance: logEntidadInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'logEntidad.label', default: 'LogEntidad'), logEntidadInstance.id])
        redirect(action: "show", id: logEntidadInstance.id)
    }

    def delete() {
        def logEntidadInstance = LogEntidad.get(params.id)
        if (!logEntidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logEntidad.label', default: 'LogEntidad'), params.id])
            redirect(action: "list")
            return
        }

        try {
            logEntidadInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'logEntidad.label', default: 'LogEntidad'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'logEntidad.label', default: 'LogEntidad'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
