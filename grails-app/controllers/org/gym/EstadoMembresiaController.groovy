package org.gym

import org.springframework.dao.DataIntegrityViolationException

class EstadoMembresiaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [estadoMembresiaInstanceList: EstadoMembresia.list(params), estadoMembresiaInstanceTotal: EstadoMembresia.count()]
    }

    def create() {
        [estadoMembresiaInstance: new EstadoMembresia(params)]
    }

    def save() {
        def estadoMembresiaInstance = new EstadoMembresia(params)
        if (!estadoMembresiaInstance.save(flush: true)) {
            render(view: "create", model: [estadoMembresiaInstance: estadoMembresiaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'estadoMembresia.label', default: 'EstadoMembresia'), estadoMembresiaInstance.id])
        redirect(action: "show", id: estadoMembresiaInstance.id)
    }

    def show(Long id) {
        def estadoMembresiaInstance = EstadoMembresia.get(id)
        if (!estadoMembresiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoMembresia.label', default: 'EstadoMembresia'), id])
            redirect(action: "list")
            return
        }

        [estadoMembresiaInstance: estadoMembresiaInstance]
    }

    def edit(Long id) {
        def estadoMembresiaInstance = EstadoMembresia.get(id)
        if (!estadoMembresiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoMembresia.label', default: 'EstadoMembresia'), id])
            redirect(action: "list")
            return
        }

        [estadoMembresiaInstance: estadoMembresiaInstance]
    }

    def update(Long id, Long version) {
        def estadoMembresiaInstance = EstadoMembresia.get(id)
        if (!estadoMembresiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoMembresia.label', default: 'EstadoMembresia'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (estadoMembresiaInstance.version > version) {
                estadoMembresiaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'estadoMembresia.label', default: 'EstadoMembresia')] as Object[],
                          "Another user has updated this EstadoMembresia while you were editing")
                render(view: "edit", model: [estadoMembresiaInstance: estadoMembresiaInstance])
                return
            }
        }

        estadoMembresiaInstance.properties = params

        if (!estadoMembresiaInstance.save(flush: true)) {
            render(view: "edit", model: [estadoMembresiaInstance: estadoMembresiaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'estadoMembresia.label', default: 'EstadoMembresia'), estadoMembresiaInstance.id])
        redirect(action: "show", id: estadoMembresiaInstance.id)
    }

    def delete(Long id) {
        def estadoMembresiaInstance = EstadoMembresia.get(id)
        if (!estadoMembresiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoMembresia.label', default: 'EstadoMembresia'), id])
            redirect(action: "list")
            return
        }

        try {
            estadoMembresiaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'estadoMembresia.label', default: 'EstadoMembresia'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'estadoMembresia.label', default: 'EstadoMembresia'), id])
            redirect(action: "show", id: id)
        }
    }
}
