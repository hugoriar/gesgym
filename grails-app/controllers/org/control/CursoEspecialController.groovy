package org.control

import org.springframework.dao.DataIntegrityViolationException

/**
 * CursoEspecialController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CursoEspecialController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cursoEspecialInstanceList: CursoEspecial.list(params), cursoEspecialInstanceTotal: CursoEspecial.count()]
    }

    def create() {
        [cursoEspecialInstance: new CursoEspecial(params)]
    }

    def save() {
        def cursoEspecialInstance = new CursoEspecial(params)
        if (!cursoEspecialInstance.save(flush: true)) {
            render(view: "create", model: [cursoEspecialInstance: cursoEspecialInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cursoEspecial.label', default: 'CursoEspecial'), cursoEspecialInstance.id])
        redirect(action: "show", id: cursoEspecialInstance.id)
    }

    def show() {
        def cursoEspecialInstance = CursoEspecial.get(params.id)
        if (!cursoEspecialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cursoEspecial.label', default: 'CursoEspecial'), params.id])
            redirect(action: "list")
            return
        }

        [cursoEspecialInstance: cursoEspecialInstance]
    }

    def edit() {
        def cursoEspecialInstance = CursoEspecial.get(params.id)
        if (!cursoEspecialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cursoEspecial.label', default: 'CursoEspecial'), params.id])
            redirect(action: "list")
            return
        }

        [cursoEspecialInstance: cursoEspecialInstance]
    }

    def update() {
        def cursoEspecialInstance = CursoEspecial.get(params.id)
        if (!cursoEspecialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cursoEspecial.label', default: 'CursoEspecial'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (cursoEspecialInstance.version > version) {
                cursoEspecialInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'cursoEspecial.label', default: 'CursoEspecial')] as Object[],
                        "Another user has updated this CursoEspecial while you were editing")
                render(view: "edit", model: [cursoEspecialInstance: cursoEspecialInstance])
                return
            }
        }

        cursoEspecialInstance.properties = params

        if (!cursoEspecialInstance.save(flush: true)) {
            render(view: "edit", model: [cursoEspecialInstance: cursoEspecialInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cursoEspecial.label', default: 'CursoEspecial'), cursoEspecialInstance.id])
        redirect(action: "show", id: cursoEspecialInstance.id)
    }

    def delete() {
        def cursoEspecialInstance = CursoEspecial.get(params.id)
        if (!cursoEspecialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cursoEspecial.label', default: 'CursoEspecial'), params.id])
            redirect(action: "list")
            return
        }

        try {
            cursoEspecialInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cursoEspecial.label', default: 'CursoEspecial'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cursoEspecial.label', default: 'CursoEspecial'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
