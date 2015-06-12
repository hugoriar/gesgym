package org.control

import org.control.Sexo
import org.springframework.dao.DataIntegrityViolationException

class SexoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [sexoInstanceList: Sexo.list(params), sexoInstanceTotal: Sexo.count()]
    }

    def create() {
        [sexoInstance: new Sexo(params)]
    }

    def save() {
        def sexoInstance = new Sexo(params)
        if (!sexoInstance.save(flush: true)) {
            render(view: "create", model: [sexoInstance: sexoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'sexo.label', default: 'Sexo'), sexoInstance.id])
        redirect(action: "show", id: sexoInstance.id)
    }

    def show(Long id) {
        def sexoInstance = Sexo.get(id)
        if (!sexoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sexo.label', default: 'Sexo'), id])
            redirect(action: "list")
            return
        }

        [sexoInstance: sexoInstance]
    }

    def edit(Long id) {
        def sexoInstance = Sexo.get(id)
        if (!sexoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sexo.label', default: 'Sexo'), id])
            redirect(action: "list")
            return
        }

        [sexoInstance: sexoInstance]
    }

    def update(Long id, Long version) {
        def sexoInstance = Sexo.get(id)
        if (!sexoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sexo.label', default: 'Sexo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (sexoInstance.version > version) {
                sexoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'sexo.label', default: 'Sexo')] as Object[],
                        "Another user has updated this Sexo while you were editing")
                render(view: "edit", model: [sexoInstance: sexoInstance])
                return
            }
        }

        sexoInstance.properties = params

        if (!sexoInstance.save(flush: true)) {
            render(view: "edit", model: [sexoInstance: sexoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'sexo.label', default: 'Sexo'), sexoInstance.id])
        redirect(action: "show", id: sexoInstance.id)
    }

    def delete(Long id) {
        def sexoInstance = Sexo.get(id)
        if (!sexoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sexo.label', default: 'Sexo'), id])
            redirect(action: "list")
            return
        }

        try {
            sexoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'sexo.label', default: 'Sexo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sexo.label', default: 'Sexo'), id])
            redirect(action: "show", id: id)
        }
    }
}
