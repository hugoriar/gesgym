package org.control

import org.control.Parentesco
import org.springframework.dao.DataIntegrityViolationException

/**
 * ParentescoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ParentescoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [parentescoInstanceList: Parentesco.list(params), parentescoInstanceTotal: Parentesco.count()]
    }

    def create() {
        [parentescoInstance: new Parentesco(params)]
    }

    def save() {
        def parentescoInstance = new Parentesco(params)
        if (!parentescoInstance.save(flush: true)) {
            render(view: "create", model: [parentescoInstance: parentescoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'parentesco.label', default: 'Parentesco'), parentescoInstance.id])
        redirect(action: "show", id: parentescoInstance.id)
    }

    def show() {
        def parentescoInstance = Parentesco.get(params.id)
        if (!parentescoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parentesco.label', default: 'Parentesco'), params.id])
            redirect(action: "list")
            return
        }

        [parentescoInstance: parentescoInstance]
    }

    def edit() {
        def parentescoInstance = Parentesco.get(params.id)
        if (!parentescoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parentesco.label', default: 'Parentesco'), params.id])
            redirect(action: "list")
            return
        }

        [parentescoInstance: parentescoInstance]
    }

    def update() {
        def parentescoInstance = Parentesco.get(params.id)
        if (!parentescoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parentesco.label', default: 'Parentesco'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (parentescoInstance.version > version) {
                parentescoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'parentesco.label', default: 'Parentesco')] as Object[],
                        "Another user has updated this Parentesco while you were editing")
                render(view: "edit", model: [parentescoInstance: parentescoInstance])
                return
            }
        }

        parentescoInstance.properties = params

        if (!parentescoInstance.save(flush: true)) {
            render(view: "edit", model: [parentescoInstance: parentescoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'parentesco.label', default: 'Parentesco'), parentescoInstance.id])
        redirect(action: "show", id: parentescoInstance.id)
    }

    def delete() {
        def parentescoInstance = Parentesco.get(params.id)
        if (!parentescoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parentesco.label', default: 'Parentesco'), params.id])
            redirect(action: "list")
            return
        }

        try {
            parentescoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'parentesco.label', default: 'Parentesco'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'parentesco.label', default: 'Parentesco'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
