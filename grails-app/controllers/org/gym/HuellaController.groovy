package org.gym

import org.springframework.dao.DataIntegrityViolationException

/**
 * HuellaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class HuellaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [huellaInstanceList: Huella.list(params), huellaInstanceTotal: Huella.count()]
    }

    def create() {
        [huellaInstance: new Huella(params)]
    }

    def save() {
        def huellaInstance = new Huella(params)
        if (!huellaInstance.save(flush: true)) {
            render(view: "create", model: [huellaInstance: huellaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'huella.label', default: 'Huella'), huellaInstance.id])
        redirect(action: "show", id: huellaInstance.id)
    }

    def show() {
        def huellaInstance = Huella.get(params.id)
        if (!huellaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'huella.label', default: 'Huella'), params.id])
            redirect(action: "list")
            return
        }

        [huellaInstance: huellaInstance]
    }

    def edit() {
        def huellaInstance = Huella.get(params.id)
        if (!huellaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'huella.label', default: 'Huella'), params.id])
            redirect(action: "list")
            return
        }

        [huellaInstance: huellaInstance]
    }

    def update() {
        def huellaInstance = Huella.get(params.id)
        if (!huellaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'huella.label', default: 'Huella'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (huellaInstance.version > version) {
                huellaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'huella.label', default: 'Huella')] as Object[],
                        "Another user has updated this Huella while you were editing")
                render(view: "edit", model: [huellaInstance: huellaInstance])
                return
            }
        }

        huellaInstance.properties = params

        if (!huellaInstance.save(flush: true)) {
            render(view: "edit", model: [huellaInstance: huellaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'huella.label', default: 'Huella'), huellaInstance.id])
        redirect(action: "show", id: huellaInstance.id)
    }

    def delete() {
        def huellaInstance = Huella.get(params.id)
        if (!huellaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'huella.label', default: 'Huella'), params.id])
            redirect(action: "list")
            return
        }

        try {
            huellaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'huella.label', default: 'Huella'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'huella.label', default: 'Huella'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
