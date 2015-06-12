package org.control

import org.control.MedioPago
import org.springframework.dao.DataIntegrityViolationException

class MedioPagoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [medioPagoInstanceList: MedioPago.list(params), medioPagoInstanceTotal: MedioPago.count()]
    }

    def create() {
        [medioPagoInstance: new MedioPago(params)]
    }

    def save() {
        def medioPagoInstance = new MedioPago(params)
        if (!medioPagoInstance.save(flush: true)) {
            render(view: "create", model: [medioPagoInstance: medioPagoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'medioPago.label', default: 'MedioPago'), medioPagoInstance.id])
        redirect(action: "show", id: medioPagoInstance.id)
    }

    def show(Long id) {
        def medioPagoInstance = MedioPago.get(id)
        if (!medioPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medioPago.label', default: 'MedioPago'), id])
            redirect(action: "list")
            return
        }

        [medioPagoInstance: medioPagoInstance]
    }

    def edit(Long id) {
        def medioPagoInstance = MedioPago.get(id)
        if (!medioPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medioPago.label', default: 'MedioPago'), id])
            redirect(action: "list")
            return
        }

        [medioPagoInstance: medioPagoInstance]
    }

    def update(Long id, Long version) {
        def medioPagoInstance = MedioPago.get(id)
        if (!medioPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medioPago.label', default: 'MedioPago'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (medioPagoInstance.version > version) {
                medioPagoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'medioPago.label', default: 'MedioPago')] as Object[],
                        "Another user has updated this MedioPago while you were editing")
                render(view: "edit", model: [medioPagoInstance: medioPagoInstance])
                return
            }
        }

        medioPagoInstance.properties = params

        if (!medioPagoInstance.save(flush: true)) {
            render(view: "edit", model: [medioPagoInstance: medioPagoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'medioPago.label', default: 'MedioPago'), medioPagoInstance.id])
        redirect(action: "show", id: medioPagoInstance.id)
    }

    def delete(Long id) {
        def medioPagoInstance = MedioPago.get(id)
        if (!medioPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medioPago.label', default: 'MedioPago'), id])
            redirect(action: "list")
            return
        }

        try {
            medioPagoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'medioPago.label', default: 'MedioPago'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'medioPago.label', default: 'MedioPago'), id])
            redirect(action: "show", id: id)
        }
    }
}
