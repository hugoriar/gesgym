package org.gym

import org.springframework.dao.DataIntegrityViolationException

class ContactoEmergenciaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contactoEmergenciaInstanceList: ContactoEmergencia.list(params), contactoEmergenciaInstanceTotal: ContactoEmergencia.count()]
    }

    def create() {
        [contactoEmergenciaInstance: new ContactoEmergencia(params)]
    }

    def save() {
        def contactoEmergenciaInstance = new ContactoEmergencia(params)
        if (!contactoEmergenciaInstance.save(flush: true)) {
            render(view: "create", model: [contactoEmergenciaInstance: contactoEmergenciaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'contactoEmergencia.label', default: 'ContactoEmergencia'), contactoEmergenciaInstance.id])
        redirect(action: "show", id: contactoEmergenciaInstance.id)
    }

    def show(Long id) {
        def contactoEmergenciaInstance = ContactoEmergencia.get(id)
        if (!contactoEmergenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contactoEmergencia.label', default: 'ContactoEmergencia'), id])
            redirect(action: "list")
            return
        }

        [contactoEmergenciaInstance: contactoEmergenciaInstance]
    }

    def edit(Long id) {
        def contactoEmergenciaInstance = ContactoEmergencia.get(id)
        if (!contactoEmergenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contactoEmergencia.label', default: 'ContactoEmergencia'), id])
            redirect(action: "list")
            return
        }

        [contactoEmergenciaInstance: contactoEmergenciaInstance]
    }

    def update(Long id, Long version) {
        def contactoEmergenciaInstance = ContactoEmergencia.get(id)
        if (!contactoEmergenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contactoEmergencia.label', default: 'ContactoEmergencia'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (contactoEmergenciaInstance.version > version) {
                contactoEmergenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contactoEmergencia.label', default: 'ContactoEmergencia')] as Object[],
                          "Another user has updated this ContactoEmergencia while you were editing")
                render(view: "edit", model: [contactoEmergenciaInstance: contactoEmergenciaInstance])
                return
            }
        }

        contactoEmergenciaInstance.properties = params

        if (!contactoEmergenciaInstance.save(flush: true)) {
            render(view: "edit", model: [contactoEmergenciaInstance: contactoEmergenciaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contactoEmergencia.label', default: 'ContactoEmergencia'), contactoEmergenciaInstance.id])
        redirect(action: "show", id: contactoEmergenciaInstance.id)
    }

    def delete(Long id) {
        def contactoEmergenciaInstance = ContactoEmergencia.get(id)
        if (!contactoEmergenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contactoEmergencia.label', default: 'ContactoEmergencia'), id])
            redirect(action: "list")
            return
        }

        try {
            contactoEmergenciaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contactoEmergencia.label', default: 'ContactoEmergencia'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contactoEmergencia.label', default: 'ContactoEmergencia'), id])
            redirect(action: "show", id: id)
        }
    }
}
