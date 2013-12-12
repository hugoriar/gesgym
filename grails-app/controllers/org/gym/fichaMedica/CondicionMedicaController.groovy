package org.gym.fichaMedica

import org.springframework.dao.DataIntegrityViolationException

class CondicionMedicaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [condicionMedicaInstanceList: CondicionMedica.list(params), condicionMedicaInstanceTotal: CondicionMedica.count()]
    }

    def create() {
        [condicionMedicaInstance: new CondicionMedica(params)]
    }

    def save() {
        def condicionMedicaInstance = new CondicionMedica(params)
        if (!condicionMedicaInstance.save(flush: true)) {
            render(view: "create", model: [condicionMedicaInstance: condicionMedicaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'condicionMedica.label', default: 'CondicionMedica'), condicionMedicaInstance.id])
        redirect(action: "show", id: condicionMedicaInstance.id)
    }

    def show(Long id) {
        def condicionMedicaInstance = CondicionMedica.get(id)
        if (!condicionMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'condicionMedica.label', default: 'CondicionMedica'), id])
            redirect(action: "list")
            return
        }

        [condicionMedicaInstance: condicionMedicaInstance]
    }

    def edit(Long id) {
        def condicionMedicaInstance = CondicionMedica.get(id)
        if (!condicionMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'condicionMedica.label', default: 'CondicionMedica'), id])
            redirect(action: "list")
            return
        }

        [condicionMedicaInstance: condicionMedicaInstance]
    }

    def update(Long id, Long version) {
        def condicionMedicaInstance = CondicionMedica.get(id)
        if (!condicionMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'condicionMedica.label', default: 'CondicionMedica'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (condicionMedicaInstance.version > version) {
                condicionMedicaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'condicionMedica.label', default: 'CondicionMedica')] as Object[],
                          "Another user has updated this CondicionMedica while you were editing")
                render(view: "edit", model: [condicionMedicaInstance: condicionMedicaInstance])
                return
            }
        }

        condicionMedicaInstance.properties = params

        if (!condicionMedicaInstance.save(flush: true)) {
            render(view: "edit", model: [condicionMedicaInstance: condicionMedicaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'condicionMedica.label', default: 'CondicionMedica'), condicionMedicaInstance.id])
        redirect(action: "show", id: condicionMedicaInstance.id)
    }

    def delete(Long id) {
        def condicionMedicaInstance = CondicionMedica.get(id)
        if (!condicionMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'condicionMedica.label', default: 'CondicionMedica'), id])
            redirect(action: "list")
            return
        }

        try {
            condicionMedicaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'condicionMedica.label', default: 'CondicionMedica'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'condicionMedica.label', default: 'CondicionMedica'), id])
            redirect(action: "show", id: id)
        }
    }
}
