package org.control.tag

import org.control.tag.EstadoTag
import org.springframework.dao.DataIntegrityViolationException

/**
 * EstadoTagController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class EstadoTagController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [estadoTagInstanceList: EstadoTag.list(params), estadoTagInstanceTotal: EstadoTag.count()]
    }

    def create() {
        [estadoTagInstance: new EstadoTag(params)]
    }

    def save() {
        def estadoTagInstance = new EstadoTag(params)
        if (!estadoTagInstance.save(flush: true)) {
            render(view: "create", model: [estadoTagInstance: estadoTagInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'estadoTag.label', default: 'EstadoTag'), estadoTagInstance.id])
        redirect(action: "show", id: estadoTagInstance.id)
    }

    def show() {
        def estadoTagInstance = EstadoTag.get(params.id)
        if (!estadoTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoTag.label', default: 'EstadoTag'), params.id])
            redirect(action: "list")
            return
        }

        [estadoTagInstance: estadoTagInstance]
    }

    def edit() {
        def estadoTagInstance = EstadoTag.get(params.id)
        if (!estadoTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoTag.label', default: 'EstadoTag'), params.id])
            redirect(action: "list")
            return
        }

        [estadoTagInstance: estadoTagInstance]
    }

    def update() {
        def estadoTagInstance = EstadoTag.get(params.id)
        if (!estadoTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoTag.label', default: 'EstadoTag'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (estadoTagInstance.version > version) {
                estadoTagInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'estadoTag.label', default: 'EstadoTag')] as Object[],
                        "Another user has updated this EstadoTag while you were editing")
                render(view: "edit", model: [estadoTagInstance: estadoTagInstance])
                return
            }
        }

        estadoTagInstance.properties = params

        if (!estadoTagInstance.save(flush: true)) {
            render(view: "edit", model: [estadoTagInstance: estadoTagInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'estadoTag.label', default: 'EstadoTag'), estadoTagInstance.id])
        redirect(action: "show", id: estadoTagInstance.id)
    }

    def delete() {
        def estadoTagInstance = EstadoTag.get(params.id)
        if (!estadoTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoTag.label', default: 'EstadoTag'), params.id])
            redirect(action: "list")
            return
        }

        try {
            estadoTagInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'estadoTag.label', default: 'EstadoTag'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'estadoTag.label', default: 'EstadoTag'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
