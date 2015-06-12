package org.control

import org.springframework.dao.DataIntegrityViolationException

/**
 * LogAtributoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class LogAtributoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [logAtributoInstanceList: LogAtributo.list(params), logAtributoInstanceTotal: LogAtributo.count()]
    }

    def create() {
        [logAtributoInstance: new LogAtributo(params)]
    }

    def save() {
        def logAtributoInstance = new LogAtributo(params)
        if (!logAtributoInstance.save(flush: true)) {
            render(view: "create", model: [logAtributoInstance: logAtributoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'logAtributo.label', default: 'LogAtributo'), logAtributoInstance.id])
        redirect(action: "show", id: logAtributoInstance.id)
    }

    def show() {
        def logAtributoInstance = LogAtributo.get(params.id)
        if (!logAtributoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logAtributo.label', default: 'LogAtributo'), params.id])
            redirect(action: "list")
            return
        }

        [logAtributoInstance: logAtributoInstance]
    }

    def edit() {
        def logAtributoInstance = LogAtributo.get(params.id)
        if (!logAtributoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logAtributo.label', default: 'LogAtributo'), params.id])
            redirect(action: "list")
            return
        }

        [logAtributoInstance: logAtributoInstance]
    }

    def update() {
        def logAtributoInstance = LogAtributo.get(params.id)
        if (!logAtributoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logAtributo.label', default: 'LogAtributo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (logAtributoInstance.version > version) {
                logAtributoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'logAtributo.label', default: 'LogAtributo')] as Object[],
                        "Another user has updated this LogAtributo while you were editing")
                render(view: "edit", model: [logAtributoInstance: logAtributoInstance])
                return
            }
        }

        logAtributoInstance.properties = params

        if (!logAtributoInstance.save(flush: true)) {
            render(view: "edit", model: [logAtributoInstance: logAtributoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'logAtributo.label', default: 'LogAtributo'), logAtributoInstance.id])
        redirect(action: "show", id: logAtributoInstance.id)
    }

    def delete() {
        def logAtributoInstance = LogAtributo.get(params.id)
        if (!logAtributoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logAtributo.label', default: 'LogAtributo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            logAtributoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'logAtributo.label', default: 'LogAtributo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'logAtributo.label', default: 'LogAtributo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
