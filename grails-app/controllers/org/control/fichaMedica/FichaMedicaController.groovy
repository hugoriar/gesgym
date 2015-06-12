package org.control.fichaMedica

import org.control.fichaMedica.FichaMedica
import org.springframework.dao.DataIntegrityViolationException

class FichaMedicaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [fichaMedicaInstanceList: FichaMedica.list(params), fichaMedicaInstanceTotal: FichaMedica.count()]
    }

    def create() {
        [fichaMedicaInstance: new FichaMedica(params)]
    }

    def save() {
        def fichaMedicaInstance = new FichaMedica(params)
        if (!fichaMedicaInstance.save(flush: true)) {
            render(view: "create", model: [fichaMedicaInstance: fichaMedicaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'fichaMedica.label', default: 'FichaMedica'), fichaMedicaInstance.id])
        redirect(action: "show", id: fichaMedicaInstance.id)
    }

    def show(Long id) {
        def fichaMedicaInstance = FichaMedica.get(id)
        if (!fichaMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fichaMedica.label', default: 'FichaMedica'), id])
            redirect(action: "list")
            return
        }

        [fichaMedicaInstance: fichaMedicaInstance]
    }

    def edit(Long id) {
        def fichaMedicaInstance = FichaMedica.get(id)
        if (!fichaMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fichaMedica.label', default: 'FichaMedica'), id])
            redirect(action: "list")
            return
        }

        [fichaMedicaInstance: fichaMedicaInstance]
    }

    def update(Long id, Long version) {
        def fichaMedicaInstance = FichaMedica.get(id)
        if (!fichaMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fichaMedica.label', default: 'FichaMedica'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (fichaMedicaInstance.version > version) {
                fichaMedicaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'fichaMedica.label', default: 'FichaMedica')] as Object[],
                        "Another user has updated this FichaMedica while you were editing")
                render(view: "edit", model: [fichaMedicaInstance: fichaMedicaInstance])
                return
            }
        }

        fichaMedicaInstance.properties = params

        if (!fichaMedicaInstance.save(flush: true)) {
            render(view: "edit", model: [fichaMedicaInstance: fichaMedicaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'fichaMedica.label', default: 'FichaMedica'), fichaMedicaInstance.id])
        redirect(action: "show", id: fichaMedicaInstance.id)
    }

    def delete(Long id) {
        def fichaMedicaInstance = FichaMedica.get(id)
        if (!fichaMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fichaMedica.label', default: 'FichaMedica'), id])
            redirect(action: "list")
            return
        }

        try {
            fichaMedicaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'fichaMedica.label', default: 'FichaMedica'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'fichaMedica.label', default: 'FichaMedica'), id])
            redirect(action: "show", id: id)
        }
    }
}
