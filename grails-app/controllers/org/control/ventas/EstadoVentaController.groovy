package org.control.ventas

import org.control.ventas.EstadoVenta
import org.springframework.dao.DataIntegrityViolationException

/**
 * EstadoVentaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class EstadoVentaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [estadoVentaInstanceList: EstadoVenta.list(params), estadoVentaInstanceTotal: EstadoVenta.count()]
    }

    def create() {
        [estadoVentaInstance: new EstadoVenta(params)]
    }

    def save() {
        def estadoVentaInstance = new EstadoVenta(params)
        if (!estadoVentaInstance.save(flush: true)) {
            render(view: "create", model: [estadoVentaInstance: estadoVentaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'estadoVenta.label', default: 'EstadoVenta'), estadoVentaInstance.id])
        redirect(action: "show", id: estadoVentaInstance.id)
    }

    def show() {
        def estadoVentaInstance = EstadoVenta.get(params.id)
        if (!estadoVentaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoVenta.label', default: 'EstadoVenta'), params.id])
            redirect(action: "list")
            return
        }

        [estadoVentaInstance: estadoVentaInstance]
    }

    def edit() {
        def estadoVentaInstance = EstadoVenta.get(params.id)
        if (!estadoVentaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoVenta.label', default: 'EstadoVenta'), params.id])
            redirect(action: "list")
            return
        }

        [estadoVentaInstance: estadoVentaInstance]
    }

    def update() {
        def estadoVentaInstance = EstadoVenta.get(params.id)
        if (!estadoVentaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoVenta.label', default: 'EstadoVenta'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (estadoVentaInstance.version > version) {
                estadoVentaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'estadoVenta.label', default: 'EstadoVenta')] as Object[],
                          "Another user has updated this EstadoVenta while you were editing")
                render(view: "edit", model: [estadoVentaInstance: estadoVentaInstance])
                return
            }
        }

        estadoVentaInstance.properties = params

        if (!estadoVentaInstance.save(flush: true)) {
            render(view: "edit", model: [estadoVentaInstance: estadoVentaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'estadoVenta.label', default: 'EstadoVenta'), estadoVentaInstance.id])
        redirect(action: "show", id: estadoVentaInstance.id)
    }

    def delete() {
        def estadoVentaInstance = EstadoVenta.get(params.id)
        if (!estadoVentaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoVenta.label', default: 'EstadoVenta'), params.id])
            redirect(action: "list")
            return
        }

        try {
            estadoVentaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'estadoVenta.label', default: 'EstadoVenta'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'estadoVenta.label', default: 'EstadoVenta'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
