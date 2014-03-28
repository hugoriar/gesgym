package org.gym.ventas

import org.springframework.dao.DataIntegrityViolationException

/**
 * FotoProductoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class FotoProductoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [fotoProductoInstanceList: FotoProducto.list(params), fotoProductoInstanceTotal: FotoProducto.count()]
    }

    def create() {
        [fotoProductoInstance: new FotoProducto(params)]
    }

    def save() {
        def fotoProductoInstance = new FotoProducto(params)
        if (!fotoProductoInstance.save(flush: true)) {
            render(view: "create", model: [fotoProductoInstance: fotoProductoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'fotoProducto.label', default: 'FotoProducto'), fotoProductoInstance.id])
        redirect(action: "show", id: fotoProductoInstance.id)
    }

    def show() {
        def fotoProductoInstance = FotoProducto.get(params.id)
        if (!fotoProductoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fotoProducto.label', default: 'FotoProducto'), params.id])
            redirect(action: "list")
            return
        }

        [fotoProductoInstance: fotoProductoInstance]
    }

    def edit() {
        def fotoProductoInstance = FotoProducto.get(params.id)
        if (!fotoProductoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fotoProducto.label', default: 'FotoProducto'), params.id])
            redirect(action: "list")
            return
        }

        [fotoProductoInstance: fotoProductoInstance]
    }

    def update() {
        def fotoProductoInstance = FotoProducto.get(params.id)
        if (!fotoProductoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fotoProducto.label', default: 'FotoProducto'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (fotoProductoInstance.version > version) {
                fotoProductoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'fotoProducto.label', default: 'FotoProducto')] as Object[],
                        "Another user has updated this FotoProducto while you were editing")
                render(view: "edit", model: [fotoProductoInstance: fotoProductoInstance])
                return
            }
        }

        fotoProductoInstance.properties = params

        if (!fotoProductoInstance.save(flush: true)) {
            render(view: "edit", model: [fotoProductoInstance: fotoProductoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'fotoProducto.label', default: 'FotoProducto'), fotoProductoInstance.id])
        redirect(action: "show", id: fotoProductoInstance.id)
    }

    def delete() {
        def fotoProductoInstance = FotoProducto.get(params.id)
        if (!fotoProductoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fotoProducto.label', default: 'FotoProducto'), params.id])
            redirect(action: "list")
            return
        }

        try {
            fotoProductoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'fotoProducto.label', default: 'FotoProducto'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'fotoProducto.label', default: 'FotoProducto'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
