package org.control

import org.control.CategoriaConceptoPago
import org.springframework.dao.DataIntegrityViolationException

/**
 * CategoriaConceptoPagoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CategoriaConceptoPagoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [categoriaConceptoPagoInstanceList: CategoriaConceptoPago.list(params), categoriaConceptoPagoInstanceTotal: CategoriaConceptoPago.count()]
    }

    def create() {
        [categoriaConceptoPagoInstance: new CategoriaConceptoPago(params)]
    }

    def save() {
        def categoriaConceptoPagoInstance = new CategoriaConceptoPago(params)
        if (!categoriaConceptoPagoInstance.save(flush: true)) {
            render(view: "create", model: [categoriaConceptoPagoInstance: categoriaConceptoPagoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'categoriaConceptoPago.label', default: 'CategoriaConceptoPago'), categoriaConceptoPagoInstance.id])
        redirect(action: "show", id: categoriaConceptoPagoInstance.id)
    }

    def show() {
        def categoriaConceptoPagoInstance = CategoriaConceptoPago.get(params.id)
        if (!categoriaConceptoPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoriaConceptoPago.label', default: 'CategoriaConceptoPago'), params.id])
            redirect(action: "list")
            return
        }

        [categoriaConceptoPagoInstance: categoriaConceptoPagoInstance]
    }

    def edit() {
        def categoriaConceptoPagoInstance = CategoriaConceptoPago.get(params.id)
        if (!categoriaConceptoPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoriaConceptoPago.label', default: 'CategoriaConceptoPago'), params.id])
            redirect(action: "list")
            return
        }

        [categoriaConceptoPagoInstance: categoriaConceptoPagoInstance]
    }

    def update() {
        def categoriaConceptoPagoInstance = CategoriaConceptoPago.get(params.id)
        if (!categoriaConceptoPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoriaConceptoPago.label', default: 'CategoriaConceptoPago'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (categoriaConceptoPagoInstance.version > version) {
                categoriaConceptoPagoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'categoriaConceptoPago.label', default: 'CategoriaConceptoPago')] as Object[],
                        "Another user has updated this CategoriaConceptoPago while you were editing")
                render(view: "edit", model: [categoriaConceptoPagoInstance: categoriaConceptoPagoInstance])
                return
            }
        }

        categoriaConceptoPagoInstance.properties = params

        if (!categoriaConceptoPagoInstance.save(flush: true)) {
            render(view: "edit", model: [categoriaConceptoPagoInstance: categoriaConceptoPagoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'categoriaConceptoPago.label', default: 'CategoriaConceptoPago'), categoriaConceptoPagoInstance.id])
        redirect(action: "show", id: categoriaConceptoPagoInstance.id)
    }

    def delete() {
        def categoriaConceptoPagoInstance = CategoriaConceptoPago.get(params.id)
        if (!categoriaConceptoPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoriaConceptoPago.label', default: 'CategoriaConceptoPago'), params.id])
            redirect(action: "list")
            return
        }

        try {
            categoriaConceptoPagoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'categoriaConceptoPago.label', default: 'CategoriaConceptoPago'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'categoriaConceptoPago.label', default: 'CategoriaConceptoPago'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
