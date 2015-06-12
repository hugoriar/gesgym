package org.control

import org.control.PromocionMatricula
import org.springframework.dao.DataIntegrityViolationException

/**
 * PromocionMatriculaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class PromocionMatriculaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [promocionMatriculaInstanceList: PromocionMatricula.list(params), promocionMatriculaInstanceTotal: PromocionMatricula.count()]
    }

    def create() {
        [promocionMatriculaInstance: new PromocionMatricula(params)]
    }

    def save() {
        def promocionMatriculaInstance = new PromocionMatricula(params)
        if (!promocionMatriculaInstance.save(flush: true)) {
            render(view: "create", model: [promocionMatriculaInstance: promocionMatriculaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'promocionMatricula.label', default: 'PromocionMatricula'), promocionMatriculaInstance.id])
        redirect(action: "show", id: promocionMatriculaInstance.id)
    }

    def show() {
        def promocionMatriculaInstance = PromocionMatricula.get(params.id)
        if (!promocionMatriculaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'promocionMatricula.label', default: 'PromocionMatricula'), params.id])
            redirect(action: "list")
            return
        }

        [promocionMatriculaInstance: promocionMatriculaInstance]
    }

    def edit() {
        def promocionMatriculaInstance = PromocionMatricula.get(params.id)
        if (!promocionMatriculaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'promocionMatricula.label', default: 'PromocionMatricula'), params.id])
            redirect(action: "list")
            return
        }

        [promocionMatriculaInstance: promocionMatriculaInstance]
    }

    def update() {
        def promocionMatriculaInstance = PromocionMatricula.get(params.id)
        if (!promocionMatriculaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'promocionMatricula.label', default: 'PromocionMatricula'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (promocionMatriculaInstance.version > version) {
                promocionMatriculaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'promocionMatricula.label', default: 'PromocionMatricula')] as Object[],
                        "Another user has updated this PromocionMatricula while you were editing")
                render(view: "edit", model: [promocionMatriculaInstance: promocionMatriculaInstance])
                return
            }
        }

        promocionMatriculaInstance.properties = params

        if (!promocionMatriculaInstance.save(flush: true)) {
            render(view: "edit", model: [promocionMatriculaInstance: promocionMatriculaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'promocionMatricula.label', default: 'PromocionMatricula'), promocionMatriculaInstance.id])
        redirect(action: "show", id: promocionMatriculaInstance.id)
    }

    def delete() {
        def promocionMatriculaInstance = PromocionMatricula.get(params.id)
        if (!promocionMatriculaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'promocionMatricula.label', default: 'PromocionMatricula'), params.id])
            redirect(action: "list")
            return
        }

        try {
            promocionMatriculaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'promocionMatricula.label', default: 'PromocionMatricula'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'promocionMatricula.label', default: 'PromocionMatricula'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
