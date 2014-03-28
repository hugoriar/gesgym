package org.gym

import org.springframework.dao.DataIntegrityViolationException

/**
 * ConceptoPagoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ConceptoPagoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [conceptoPagoInstanceList: ConceptoPago.list(params), conceptoPagoInstanceTotal: ConceptoPago.count()]
    }

    def create() {
        [conceptoPagoInstance: new ConceptoPago(params)]
    }

    def save() {
        def conceptoPagoInstance = new ConceptoPago(params)
        if (!conceptoPagoInstance.save(flush: true)) {
            render(view: "create", model: [conceptoPagoInstance: conceptoPagoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'conceptoPago.label', default: 'ConceptoPago'), conceptoPagoInstance.id])
        redirect(action: "show", id: conceptoPagoInstance.id)
    }

    def show() {
        def conceptoPagoInstance = ConceptoPago.get(params.id)
        if (!conceptoPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoPago.label', default: 'ConceptoPago'), params.id])
            redirect(action: "list")
            return
        }

        [conceptoPagoInstance: conceptoPagoInstance]
    }

    def edit() {
        def conceptoPagoInstance = ConceptoPago.get(params.id)
        if (!conceptoPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoPago.label', default: 'ConceptoPago'), params.id])
            redirect(action: "list")
            return
        }

        [conceptoPagoInstance: conceptoPagoInstance]
    }

    def update() {
        def conceptoPagoInstance = ConceptoPago.get(params.id)
        if (!conceptoPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoPago.label', default: 'ConceptoPago'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (conceptoPagoInstance.version > version) {
                conceptoPagoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'conceptoPago.label', default: 'ConceptoPago')] as Object[],
                        "Another user has updated this ConceptoPago while you were editing")
                render(view: "edit", model: [conceptoPagoInstance: conceptoPagoInstance])
                return
            }
        }

        conceptoPagoInstance.properties = params

        if (!conceptoPagoInstance.save(flush: true)) {
            render(view: "edit", model: [conceptoPagoInstance: conceptoPagoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'conceptoPago.label', default: 'ConceptoPago'), conceptoPagoInstance.id])
        redirect(action: "show", id: conceptoPagoInstance.id)
    }

    def delete() {
        def conceptoPagoInstance = ConceptoPago.get(params.id)
        if (!conceptoPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoPago.label', default: 'ConceptoPago'), params.id])
            redirect(action: "list")
            return
        }

        try {
            conceptoPagoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'conceptoPago.label', default: 'ConceptoPago'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'conceptoPago.label', default: 'ConceptoPago'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
