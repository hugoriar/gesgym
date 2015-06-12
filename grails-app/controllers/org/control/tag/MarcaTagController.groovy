package org.control.tag

import org.control.tag.MarcaTag
import org.springframework.dao.DataIntegrityViolationException

/**
 * MarcaTagController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class MarcaTagController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [marcaTagInstanceList: MarcaTag.list(params), marcaTagInstanceTotal: MarcaTag.count()]
    }

    def create() {
        [marcaTagInstance: new MarcaTag(params)]
    }

    def save() {
        def marcaTagInstance = new MarcaTag(params)
        if (!marcaTagInstance.save(flush: true)) {
            render(view: "create", model: [marcaTagInstance: marcaTagInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'marcaTag.label', default: 'MarcaTag'), marcaTagInstance.id])
        redirect(action: "show", id: marcaTagInstance.id)
    }

    def show() {
        def marcaTagInstance = MarcaTag.get(params.id)
        if (!marcaTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marcaTag.label', default: 'MarcaTag'), params.id])
            redirect(action: "list")
            return
        }

        [marcaTagInstance: marcaTagInstance]
    }

    def edit() {
        def marcaTagInstance = MarcaTag.get(params.id)
        if (!marcaTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marcaTag.label', default: 'MarcaTag'), params.id])
            redirect(action: "list")
            return
        }

        [marcaTagInstance: marcaTagInstance]
    }

    def update() {
        def marcaTagInstance = MarcaTag.get(params.id)
        if (!marcaTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marcaTag.label', default: 'MarcaTag'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (marcaTagInstance.version > version) {
                marcaTagInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'marcaTag.label', default: 'MarcaTag')] as Object[],
                        "Another user has updated this MarcaTag while you were editing")
                render(view: "edit", model: [marcaTagInstance: marcaTagInstance])
                return
            }
        }

        marcaTagInstance.properties = params

        if (!marcaTagInstance.save(flush: true)) {
            render(view: "edit", model: [marcaTagInstance: marcaTagInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'marcaTag.label', default: 'MarcaTag'), marcaTagInstance.id])
        redirect(action: "show", id: marcaTagInstance.id)
    }

    def delete() {
        def marcaTagInstance = MarcaTag.get(params.id)
        if (!marcaTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marcaTag.label', default: 'MarcaTag'), params.id])
            redirect(action: "list")
            return
        }

        try {
            marcaTagInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'marcaTag.label', default: 'MarcaTag'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'marcaTag.label', default: 'MarcaTag'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
