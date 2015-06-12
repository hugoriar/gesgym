package org.control.tag

import org.control.tag.ModeloTag
import org.springframework.dao.DataIntegrityViolationException

/**
 * ModeloTagController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ModeloTagController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [modeloTagInstanceList: ModeloTag.list(params), modeloTagInstanceTotal: ModeloTag.count()]
    }

    def create() {
        [modeloTagInstance: new ModeloTag(params)]
    }

    def save() {
        def modeloTagInstance = new ModeloTag(params)
        if (!modeloTagInstance.save(flush: true)) {
            render(view: "create", model: [modeloTagInstance: modeloTagInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'modeloTag.label', default: 'ModeloTag'), modeloTagInstance.id])
        redirect(action: "show", id: modeloTagInstance.id)
    }

    def show() {
        def modeloTagInstance = ModeloTag.get(params.id)
        if (!modeloTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modeloTag.label', default: 'ModeloTag'), params.id])
            redirect(action: "list")
            return
        }

        [modeloTagInstance: modeloTagInstance]
    }

    def edit() {
        def modeloTagInstance = ModeloTag.get(params.id)
        if (!modeloTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modeloTag.label', default: 'ModeloTag'), params.id])
            redirect(action: "list")
            return
        }

        [modeloTagInstance: modeloTagInstance]
    }

    def update() {
        def modeloTagInstance = ModeloTag.get(params.id)
        if (!modeloTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modeloTag.label', default: 'ModeloTag'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (modeloTagInstance.version > version) {
                modeloTagInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'modeloTag.label', default: 'ModeloTag')] as Object[],
                        "Another user has updated this ModeloTag while you were editing")
                render(view: "edit", model: [modeloTagInstance: modeloTagInstance])
                return
            }
        }

        modeloTagInstance.properties = params

        if (!modeloTagInstance.save(flush: true)) {
            render(view: "edit", model: [modeloTagInstance: modeloTagInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'modeloTag.label', default: 'ModeloTag'), modeloTagInstance.id])
        redirect(action: "show", id: modeloTagInstance.id)
    }

    def delete() {
        def modeloTagInstance = ModeloTag.get(params.id)
        if (!modeloTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modeloTag.label', default: 'ModeloTag'), params.id])
            redirect(action: "list")
            return
        }

        try {
            modeloTagInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'modeloTag.label', default: 'ModeloTag'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'modeloTag.label', default: 'ModeloTag'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
