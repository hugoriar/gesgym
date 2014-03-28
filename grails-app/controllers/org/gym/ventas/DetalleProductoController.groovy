package org.gym.ventas

import org.springframework.dao.DataIntegrityViolationException

/**
 * DetalleProductoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class DetalleProductoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [detalleProductoInstanceList: DetalleProducto.list(params), detalleProductoInstanceTotal: DetalleProducto.count()]
    }

    def create() {
        [detalleProductoInstance: new DetalleProducto(params)]
    }

    def save() {
        def detalleProductoInstance = new DetalleProducto(params)
        if (!detalleProductoInstance.save(flush: true)) {
            render(view: "create", model: [detalleProductoInstance: detalleProductoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'detalleProducto.label', default: 'DetalleProducto'), detalleProductoInstance.id])
        redirect(action: "show", id: detalleProductoInstance.id)
    }

    def show() {
        def detalleProductoInstance = DetalleProducto.get(params.id)
        if (!detalleProductoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleProducto.label', default: 'DetalleProducto'), params.id])
            redirect(action: "list")
            return
        }

        [detalleProductoInstance: detalleProductoInstance]
    }

    def edit() {
        def detalleProductoInstance = DetalleProducto.get(params.id)
        if (!detalleProductoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleProducto.label', default: 'DetalleProducto'), params.id])
            redirect(action: "list")
            return
        }

        [detalleProductoInstance: detalleProductoInstance]
    }

    def update() {
        def detalleProductoInstance = DetalleProducto.get(params.id)
        if (!detalleProductoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleProducto.label', default: 'DetalleProducto'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (detalleProductoInstance.version > version) {
                detalleProductoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'detalleProducto.label', default: 'DetalleProducto')] as Object[],
                          "Another user has updated this DetalleProducto while you were editing")
                render(view: "edit", model: [detalleProductoInstance: detalleProductoInstance])
                return
            }
        }

        detalleProductoInstance.properties = params

        if (!detalleProductoInstance.save(flush: true)) {
            render(view: "edit", model: [detalleProductoInstance: detalleProductoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'detalleProducto.label', default: 'DetalleProducto'), detalleProductoInstance.id])
        redirect(action: "show", id: detalleProductoInstance.id)
    }

    def delete() {
        def detalleProductoInstance = DetalleProducto.get(params.id)
        if (!detalleProductoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleProducto.label', default: 'DetalleProducto'), params.id])
            redirect(action: "list")
            return
        }

        try {
            detalleProductoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'detalleProducto.label', default: 'DetalleProducto'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'detalleProducto.label', default: 'DetalleProducto'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
