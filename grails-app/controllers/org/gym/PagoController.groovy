package org.gym

import org.springframework.dao.DataIntegrityViolationException

class PagoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pagoInstanceList: Pago.list(params), pagoInstanceTotal: Pago.count()]
    }

    def create() {
        [pagoInstance: new Pago(params)]
    }

    def save() {
        def pagoInstance = new Pago(params)
        if (!pagoInstance.save(flush: true)) {
            render(view: "create", model: [pagoInstance: pagoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pago.label', default: 'Pago'), pagoInstance.id])
        redirect(action: "show", id: pagoInstance.id)
    }

    def show(Long id) {
        def pagoInstance = Pago.get(id)
        if (!pagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pago.label', default: 'Pago'), id])
            redirect(action: "list")
            return
        }

        [pagoInstance: pagoInstance]
    }

    def edit(Long id) {
        def pagoInstance = Pago.get(id)
        if (!pagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pago.label', default: 'Pago'), id])
            redirect(action: "list")
            return
        }

        [pagoInstance: pagoInstance]
    }

    def update(Long id, Long version) {
        def pagoInstance = Pago.get(id)
        if (!pagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pago.label', default: 'Pago'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pagoInstance.version > version) {
                pagoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'pago.label', default: 'Pago')] as Object[],
                        "Another user has updated this Pago while you were editing")
                render(view: "edit", model: [pagoInstance: pagoInstance])
                return
            }
        }

        pagoInstance.properties = params

        if (!pagoInstance.save(flush: true)) {
            render(view: "edit", model: [pagoInstance: pagoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pago.label', default: 'Pago'), pagoInstance.id])
        redirect(action: "show", id: pagoInstance.id)
    }

    def delete(Long id) {
        def pagoInstance = Pago.get(id)
        if (!pagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pago.label', default: 'Pago'), id])
            redirect(action: "list")
            return
        }

        try {
            pagoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pago.label', default: 'Pago'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pago.label', default: 'Pago'), id])
            redirect(action: "show", id: id)
        }
    }
}
