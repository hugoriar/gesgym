package org.gym

import org.springframework.dao.DataIntegrityViolationException

class EmpresaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [empresaInstanceList: Empresa.list(params), empresaInstanceTotal: Empresa.count()]
    }

    def create() {
        [empresaInstance: new Empresa(params)]
    }

    def save() {
        def empresaInstance = new Empresa(params)
        empresaInstance.direccion = new DireccionEmpresa(params)

        if (!empresaInstance.save(flush: true)) {
            render(view: "create", model: [empresaInstance: empresaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'empresa.label', default: 'Empresa'), empresaInstance.id])
        redirect(action: "show", id: empresaInstance.id)
    }

    def show(Long id) {
        def empresaInstance = Empresa.get(id)
        if (!empresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), id])
            redirect(action: "list")
            return
        }

        [empresaInstance: empresaInstance]
    }

    def edit(Long id) {
        def empresaInstance = Empresa.get(id)
        if (!empresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), id])
            redirect(action: "list")
            return
        }

        [empresaInstance: empresaInstance]
    }

    def update(Long id, Long version) {
        def empresaInstance = Empresa.get(id)
        if (!empresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (empresaInstance.version > version) {
                empresaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'empresa.label', default: 'Empresa')] as Object[],
                        "Another user has updated this Empresa while you were editing")
                render(view: "edit", model: [empresaInstance: empresaInstance])
                return
            }
        }

        empresaInstance.properties = params

        if (!empresaInstance.save(flush: true)) {
            render(view: "edit", model: [empresaInstance: empresaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'empresa.label', default: 'Empresa'), empresaInstance.id])
        redirect(action: "show", id: empresaInstance.id)
    }

    def delete(Long id) {
        def empresaInstance = Empresa.get(id)
        if (!empresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), id])
            redirect(action: "list")
            return
        }

        try {
            empresaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'empresa.label', default: 'Empresa'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'empresa.label', default: 'Empresa'), id])
            redirect(action: "show", id: id)
        }
    }
}
