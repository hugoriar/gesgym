package org.gym

import org.springframework.dao.DataIntegrityViolationException

/**
 * ModalidadController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ModalidadController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [modalidadInstanceList: Modalidad.list(params), modalidadInstanceTotal: Modalidad.count()]
    }

    def create() {
        [modalidadInstance: new Modalidad(params)]
    }

    def save() {
        def modalidadInstance = new Modalidad(params)
        if (!modalidadInstance.save(flush: true)) {
            render(view: "create", model: [modalidadInstance: modalidadInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'modalidad.label', default: 'Modalidad'), modalidadInstance.id])
        redirect(action: "show", id: modalidadInstance.id)
    }

    def show() {
        def modalidadInstance = Modalidad.get(params.id)
        if (!modalidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modalidad.label', default: 'Modalidad'), params.id])
            redirect(action: "list")
            return
        }

        [modalidadInstance: modalidadInstance]
    }

    def edit() {
        def modalidadInstance = Modalidad.get(params.id)
        if (!modalidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modalidad.label', default: 'Modalidad'), params.id])
            redirect(action: "list")
            return
        }

        [modalidadInstance: modalidadInstance]
    }

    def update() {
        def modalidadInstance = Modalidad.get(params.id)
        if (!modalidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modalidad.label', default: 'Modalidad'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (modalidadInstance.version > version) {
                modalidadInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'modalidad.label', default: 'Modalidad')] as Object[],
                        "Another user has updated this Modalidad while you were editing")
                render(view: "edit", model: [modalidadInstance: modalidadInstance])
                return
            }
        }

        modalidadInstance.properties = params

        if (!modalidadInstance.save(flush: true)) {
            render(view: "edit", model: [modalidadInstance: modalidadInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'modalidad.label', default: 'Modalidad'), modalidadInstance.id])
        redirect(action: "show", id: modalidadInstance.id)
    }

    def delete() {
        def modalidadInstance = Modalidad.get(params.id)
        if (!modalidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modalidad.label', default: 'Modalidad'), params.id])
            redirect(action: "list")
            return
        }

        try {
            modalidadInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'modalidad.label', default: 'Modalidad'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'modalidad.label', default: 'Modalidad'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
