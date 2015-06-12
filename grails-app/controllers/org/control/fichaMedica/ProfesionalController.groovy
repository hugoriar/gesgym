package org.control.fichaMedica

import org.control.fichaMedica.Profesional
import org.springframework.dao.DataIntegrityViolationException

class ProfesionalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [profesionalInstanceList: Profesional.list(params), profesionalInstanceTotal: Profesional.count()]
    }

    def create() {
        [profesionalInstance: new Profesional(params)]
    }

    def save() {
        def profesionalInstance = new Profesional(params)
        if (!profesionalInstance.save(flush: true)) {
            render(view: "create", model: [profesionalInstance: profesionalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'profesional.label', default: 'Profesional'), profesionalInstance.id])
        redirect(action: "show", id: profesionalInstance.id)
    }

    def show(Long id) {
        def profesionalInstance = Profesional.get(id)
        if (!profesionalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profesional.label', default: 'Profesional'), id])
            redirect(action: "list")
            return
        }

        [profesionalInstance: profesionalInstance]
    }

    def edit(Long id) {
        def profesionalInstance = Profesional.get(id)
        if (!profesionalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profesional.label', default: 'Profesional'), id])
            redirect(action: "list")
            return
        }

        [profesionalInstance: profesionalInstance]
    }

    def update(Long id, Long version) {
        def profesionalInstance = Profesional.get(id)
        if (!profesionalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profesional.label', default: 'Profesional'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (profesionalInstance.version > version) {
                profesionalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'profesional.label', default: 'Profesional')] as Object[],
                        "Another user has updated this Profesional while you were editing")
                render(view: "edit", model: [profesionalInstance: profesionalInstance])
                return
            }
        }

        profesionalInstance.properties = params

        if (!profesionalInstance.save(flush: true)) {
            render(view: "edit", model: [profesionalInstance: profesionalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'profesional.label', default: 'Profesional'), profesionalInstance.id])
        redirect(action: "show", id: profesionalInstance.id)
    }

    def delete(Long id) {
        def profesionalInstance = Profesional.get(id)
        if (!profesionalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profesional.label', default: 'Profesional'), id])
            redirect(action: "list")
            return
        }

        try {
            profesionalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'profesional.label', default: 'Profesional'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'profesional.label', default: 'Profesional'), id])
            redirect(action: "show", id: id)
        }
    }
}
