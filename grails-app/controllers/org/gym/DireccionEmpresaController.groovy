package org.gym

import org.springframework.dao.DataIntegrityViolationException

/**
 * DireccionEmpresaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class DireccionEmpresaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [direccionEmpresaInstanceList: DireccionEmpresa.list(params), direccionEmpresaInstanceTotal: DireccionEmpresa.count()]
    }

    def create() {
        [direccionEmpresaInstance: new DireccionEmpresa(params)]
    }

    def save() {
        def direccionEmpresaInstance = new DireccionEmpresa(params)
        if (!direccionEmpresaInstance.save(flush: true)) {
            render(view: "create", model: [direccionEmpresaInstance: direccionEmpresaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'direccionEmpresa.label', default: 'DireccionEmpresa'), direccionEmpresaInstance.id])
        redirect(action: "show", id: direccionEmpresaInstance.id)
    }

    def show() {
        def direccionEmpresaInstance = DireccionEmpresa.get(params.id)
        if (!direccionEmpresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'direccionEmpresa.label', default: 'DireccionEmpresa'), params.id])
            redirect(action: "list")
            return
        }

        [direccionEmpresaInstance: direccionEmpresaInstance]
    }

    def edit() {
        def direccionEmpresaInstance = DireccionEmpresa.get(params.id)
        if (!direccionEmpresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'direccionEmpresa.label', default: 'DireccionEmpresa'), params.id])
            redirect(action: "list")
            return
        }

        [direccionEmpresaInstance: direccionEmpresaInstance]
    }

    def update() {
        def direccionEmpresaInstance = DireccionEmpresa.get(params.id)
        if (!direccionEmpresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'direccionEmpresa.label', default: 'DireccionEmpresa'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (direccionEmpresaInstance.version > version) {
                direccionEmpresaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'direccionEmpresa.label', default: 'DireccionEmpresa')] as Object[],
                        "Another user has updated this DireccionEmpresa while you were editing")
                render(view: "edit", model: [direccionEmpresaInstance: direccionEmpresaInstance])
                return
            }
        }

        direccionEmpresaInstance.properties = params

        if (!direccionEmpresaInstance.save(flush: true)) {
            render(view: "edit", model: [direccionEmpresaInstance: direccionEmpresaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'direccionEmpresa.label', default: 'DireccionEmpresa'), direccionEmpresaInstance.id])
        redirect(action: "show", id: direccionEmpresaInstance.id)
    }

    def delete() {
        def direccionEmpresaInstance = DireccionEmpresa.get(params.id)
        if (!direccionEmpresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'direccionEmpresa.label', default: 'DireccionEmpresa'), params.id])
            redirect(action: "list")
            return
        }

        try {
            direccionEmpresaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'direccionEmpresa.label', default: 'DireccionEmpresa'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'direccionEmpresa.label', default: 'DireccionEmpresa'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
