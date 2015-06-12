package org.control.ventas

import org.control.ventas.Variante
import org.springframework.dao.DataIntegrityViolationException

/**
 * VarianteController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class VarianteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [varianteInstanceList: Variante.list(params), varianteInstanceTotal: Variante.count()]
    }

    def create() {
        [varianteInstance: new Variante(params)]
    }

    def save() {
        def varianteInstance = new Variante(params)
        if (!varianteInstance.save(flush: true)) {
            render(view: "create", model: [varianteInstance: varianteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'variante.label', default: 'Variante'), varianteInstance.id])
        redirect(action: "show", id: varianteInstance.id)
    }

    def show() {
        def varianteInstance = Variante.get(params.id)
        if (!varianteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'variante.label', default: 'Variante'), params.id])
            redirect(action: "list")
            return
        }

        [varianteInstance: varianteInstance]
    }

    def edit() {
        def varianteInstance = Variante.get(params.id)
        if (!varianteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'variante.label', default: 'Variante'), params.id])
            redirect(action: "list")
            return
        }

        [varianteInstance: varianteInstance]
    }

    def update() {
        def varianteInstance = Variante.get(params.id)
        if (!varianteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'variante.label', default: 'Variante'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (varianteInstance.version > version) {
                varianteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'variante.label', default: 'Variante')] as Object[],
                        "Another user has updated this Variante while you were editing")
                render(view: "edit", model: [varianteInstance: varianteInstance])
                return
            }
        }

        varianteInstance.properties = params

        if (!varianteInstance.save(flush: true)) {
            render(view: "edit", model: [varianteInstance: varianteInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'variante.label', default: 'Variante'), varianteInstance.id])
        redirect(action: "show", id: varianteInstance.id)
    }

    def delete() {
        def varianteInstance = Variante.get(params.id)
        if (!varianteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'variante.label', default: 'Variante'), params.id])
            redirect(action: "list")
            return
        }

        try {
            varianteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'variante.label', default: 'Variante'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'variante.label', default: 'Variante'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
