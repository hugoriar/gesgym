package org.control

import org.control.Plan
import org.springframework.dao.DataIntegrityViolationException

class MembresiaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [membresiaInstanceList: Plan.list(params), membresiaInstanceTotal: Plan.count()]
    }

    def create() {
        [membresiaInstance: new Plan(params)]
    }

    def save() {
        def membresiaInstance = new Plan(params)
        if (!membresiaInstance.save(flush: true)) {
            render(view: "create", model: [membresiaInstance: membresiaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'plan.label', default: 'Membresia'), membresiaInstance.id])
        redirect(action: "show", id: membresiaInstance.id)
    }

    def show(Long id) {
        def membresiaInstance = Membresia.get(id)
        if (!membresiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Membresia'), id])
            redirect(action: "list")
            return
        }

        [membresiaInstance: membresiaInstance]
    }

    def edit(Long id) {
        def membresiaInstance = Plan.get(id)
        if (!membresiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Membresia'), id])
            redirect(action: "list")
            return
        }

        [membresiaInstance: membresiaInstance]
    }

    def update(Long id, Long version) {
        def membresiaInstance = Plan.get(id)
        if (!membresiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Membresia'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (membresiaInstance.version > version) {
                membresiaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'plan.label', default: 'Membresia')] as Object[],
                        "Another user has updated this Membresia while you were editing")
                render(view: "edit", model: [membresiaInstance: membresiaInstance])
                return
            }
        }

        membresiaInstance.properties = params

        if (!membresiaInstance.save(flush: true)) {
            render(view: "edit", model: [membresiaInstance: membresiaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'plan.label', default: 'Membresia'), membresiaInstance.id])
        redirect(action: "show", id: membresiaInstance.id)
    }

    def delete(Long id) {
        def membresiaInstance = Plan.get(id)
        if (!membresiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Membresia'), id])
            redirect(action: "list")
            return
        }

        try {
            membresiaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'plan.label', default: 'Membresia'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'plan.label', default: 'Membresia'), id])
            redirect(action: "show", id: id)
        }
    }
}
