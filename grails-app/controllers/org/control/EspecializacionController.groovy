package org.control

import org.control.Especializacion
import org.springframework.dao.DataIntegrityViolationException

/**
 * EspecializacionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class EspecializacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [especializacionInstanceList: Especializacion.list(params), especializacionInstanceTotal: Especializacion.count()]
    }

    def create() {
        [especializacionInstance: new Especializacion(params)]
    }

    def save() {
        def especializacionInstance = new Especializacion(params)
        if (!especializacionInstance.save(flush: true)) {
            render(view: "create", model: [especializacionInstance: especializacionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'especializacion.label', default: 'Especializacion'), especializacionInstance.id])
        redirect(action: "show", id: especializacionInstance.id)
    }

    def show() {
        def especializacionInstance = Especializacion.get(params.id)
        if (!especializacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'especializacion.label', default: 'Especializacion'), params.id])
            redirect(action: "list")
            return
        }

        [especializacionInstance: especializacionInstance]
    }

    def edit() {
        def especializacionInstance = Especializacion.get(params.id)
        if (!especializacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'especializacion.label', default: 'Especializacion'), params.id])
            redirect(action: "list")
            return
        }

        [especializacionInstance: especializacionInstance]
    }

    def update() {
        def especializacionInstance = Especializacion.get(params.id)
        if (!especializacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'especializacion.label', default: 'Especializacion'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (especializacionInstance.version > version) {
                especializacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'especializacion.label', default: 'Especializacion')] as Object[],
                        "Another user has updated this Especializacion while you were editing")
                render(view: "edit", model: [especializacionInstance: especializacionInstance])
                return
            }
        }

        especializacionInstance.properties = params

        if (!especializacionInstance.save(flush: true)) {
            render(view: "edit", model: [especializacionInstance: especializacionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'especializacion.label', default: 'Especializacion'), especializacionInstance.id])
        redirect(action: "show", id: especializacionInstance.id)
    }

    def delete() {
        def especializacionInstance = Especializacion.get(params.id)
        if (!especializacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'especializacion.label', default: 'Especializacion'), params.id])
            redirect(action: "list")
            return
        }

        try {
            especializacionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'especializacion.label', default: 'Especializacion'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'especializacion.label', default: 'Especializacion'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
