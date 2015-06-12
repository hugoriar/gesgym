package org.control

import org.springframework.dao.DataIntegrityViolationException

/**
 * LogTipoOperacionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class LogTipoOperacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [logTipoOperacionInstanceList: LogTipoOperacion.list(params), logTipoOperacionInstanceTotal: LogTipoOperacion.count()]
    }

    def create() {
        [logTipoOperacionInstance: new LogTipoOperacion(params)]
    }

    def save() {
        def logTipoOperacionInstance = new LogTipoOperacion(params)
        if (!logTipoOperacionInstance.save(flush: true)) {
            render(view: "create", model: [logTipoOperacionInstance: logTipoOperacionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'logTipoOperacion.label', default: 'LogTipoOperacion'), logTipoOperacionInstance.id])
        redirect(action: "show", id: logTipoOperacionInstance.id)
    }

    def show() {
        def logTipoOperacionInstance = LogTipoOperacion.get(params.id)
        if (!logTipoOperacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logTipoOperacion.label', default: 'LogTipoOperacion'), params.id])
            redirect(action: "list")
            return
        }

        [logTipoOperacionInstance: logTipoOperacionInstance]
    }

    def edit() {
        def logTipoOperacionInstance = LogTipoOperacion.get(params.id)
        if (!logTipoOperacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logTipoOperacion.label', default: 'LogTipoOperacion'), params.id])
            redirect(action: "list")
            return
        }

        [logTipoOperacionInstance: logTipoOperacionInstance]
    }

    def update() {
        def logTipoOperacionInstance = LogTipoOperacion.get(params.id)
        if (!logTipoOperacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logTipoOperacion.label', default: 'LogTipoOperacion'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (logTipoOperacionInstance.version > version) {
                logTipoOperacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'logTipoOperacion.label', default: 'LogTipoOperacion')] as Object[],
                        "Another user has updated this LogTipoOperacion while you were editing")
                render(view: "edit", model: [logTipoOperacionInstance: logTipoOperacionInstance])
                return
            }
        }

        logTipoOperacionInstance.properties = params

        if (!logTipoOperacionInstance.save(flush: true)) {
            render(view: "edit", model: [logTipoOperacionInstance: logTipoOperacionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'logTipoOperacion.label', default: 'LogTipoOperacion'), logTipoOperacionInstance.id])
        redirect(action: "show", id: logTipoOperacionInstance.id)
    }

    def delete() {
        def logTipoOperacionInstance = LogTipoOperacion.get(params.id)
        if (!logTipoOperacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logTipoOperacion.label', default: 'LogTipoOperacion'), params.id])
            redirect(action: "list")
            return
        }

        try {
            logTipoOperacionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'logTipoOperacion.label', default: 'LogTipoOperacion'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'logTipoOperacion.label', default: 'LogTipoOperacion'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
