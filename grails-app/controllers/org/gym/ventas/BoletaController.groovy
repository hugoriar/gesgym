package org.gym.ventas

import org.springframework.dao.DataIntegrityViolationException

/**
 * BoletaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class BoletaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [boletaInstanceList: Boleta.list(params), boletaInstanceTotal: Boleta.count()]
    }

    def create() {
        [boletaInstance: new Boleta(params)]
    }

    def save() {
        def boletaInstance = new Boleta(params)
        if (!boletaInstance.save(flush: true)) {
            render(view: "create", model: [boletaInstance: boletaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'boleta.label', default: 'Boleta'), boletaInstance.id])
        redirect(action: "show", id: boletaInstance.id)
    }

    def show() {
        def boletaInstance = Boleta.get(params.id)
        if (!boletaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'boleta.label', default: 'Boleta'), params.id])
            redirect(action: "list")
            return
        }

        [boletaInstance: boletaInstance]
    }

    def edit() {
        def boletaInstance = Boleta.get(params.id)
        if (!boletaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'boleta.label', default: 'Boleta'), params.id])
            redirect(action: "list")
            return
        }

        [boletaInstance: boletaInstance]
    }

    def update() {
        def boletaInstance = Boleta.get(params.id)
        if (!boletaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'boleta.label', default: 'Boleta'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (boletaInstance.version > version) {
                boletaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'boleta.label', default: 'Boleta')] as Object[],
                        "Another user has updated this Boleta while you were editing")
                render(view: "edit", model: [boletaInstance: boletaInstance])
                return
            }
        }

        boletaInstance.properties = params

        if (!boletaInstance.save(flush: true)) {
            render(view: "edit", model: [boletaInstance: boletaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'boleta.label', default: 'Boleta'), boletaInstance.id])
        redirect(action: "show", id: boletaInstance.id)
    }

    def delete() {
        def boletaInstance = Boleta.get(params.id)
        if (!boletaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'boleta.label', default: 'Boleta'), params.id])
            redirect(action: "list")
            return
        }

        try {
            boletaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'boleta.label', default: 'Boleta'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'boleta.label', default: 'Boleta'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
