package org.control

import org.control.DireccionUsuario
import org.springframework.dao.DataIntegrityViolationException

/**
 * DireccionUsuarioController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class DireccionUsuarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [direccionUsuarioInstanceList: DireccionUsuario.list(params), direccionUsuarioInstanceTotal: DireccionUsuario.count()]
    }

    def create() {
        [direccionUsuarioInstance: new DireccionUsuario(params)]
    }

    def save() {
        def direccionUsuarioInstance = new DireccionUsuario(params)
        if (!direccionUsuarioInstance.save(flush: true)) {
            render(view: "create", model: [direccionUsuarioInstance: direccionUsuarioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'direccionUsuario.label', default: 'DireccionUsuario'), direccionUsuarioInstance.id])
        redirect(action: "show", id: direccionUsuarioInstance.id)
    }

    def show() {
        def direccionUsuarioInstance = DireccionUsuario.get(params.id)
        if (!direccionUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'direccionUsuario.label', default: 'DireccionUsuario'), params.id])
            redirect(action: "list")
            return
        }

        [direccionUsuarioInstance: direccionUsuarioInstance]
    }

    def edit() {
        def direccionUsuarioInstance = DireccionUsuario.get(params.id)
        if (!direccionUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'direccionUsuario.label', default: 'DireccionUsuario'), params.id])
            redirect(action: "list")
            return
        }

        [direccionUsuarioInstance: direccionUsuarioInstance]
    }

    def update() {
        def direccionUsuarioInstance = DireccionUsuario.get(params.id)
        if (!direccionUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'direccionUsuario.label', default: 'DireccionUsuario'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (direccionUsuarioInstance.version > version) {
                direccionUsuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'direccionUsuario.label', default: 'DireccionUsuario')] as Object[],
                        "Another user has updated this DireccionUsuario while you were editing")
                render(view: "edit", model: [direccionUsuarioInstance: direccionUsuarioInstance])
                return
            }
        }

        direccionUsuarioInstance.properties = params

        if (!direccionUsuarioInstance.save(flush: true)) {
            render(view: "edit", model: [direccionUsuarioInstance: direccionUsuarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'direccionUsuario.label', default: 'DireccionUsuario'), direccionUsuarioInstance.id])
        redirect(action: "show", id: direccionUsuarioInstance.id)
    }

    def delete() {
        def direccionUsuarioInstance = DireccionUsuario.get(params.id)
        if (!direccionUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'direccionUsuario.label', default: 'DireccionUsuario'), params.id])
            redirect(action: "list")
            return
        }

        try {
            direccionUsuarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'direccionUsuario.label', default: 'DireccionUsuario'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'direccionUsuario.label', default: 'DireccionUsuario'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
