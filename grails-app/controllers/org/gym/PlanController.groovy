package org.gym

import org.springframework.dao.DataIntegrityViolationException

/**
 * PlanController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class PlanController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [planInstanceList: Plan.list(params), planInstanceTotal: Plan.count()]
    }

    def create() {
        [planInstance: new Plan(params)]
    }

    def save() {
        def planInstance = new Plan(params)
        if (!planInstance.save(flush: true)) {
            render(view: "create", model: [planInstance: planInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'plan.label', default: 'Plan'), planInstance.id])
        redirect(action: "show", id: planInstance.id)
    }

    def show() {
        def planInstance = Plan.get(params.id)
        if (!planInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])
            redirect(action: "list")
            return
        }

        [planInstance: planInstance]
    }

    def edit() {
        def planInstance = Plan.get(params.id)
        if (!planInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])
            redirect(action: "list")
            return
        }

        [planInstance: planInstance]
    }

    def update() {
        def planInstance = Plan.get(params.id)
        if (!planInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (planInstance.version > version) {
                planInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'plan.label', default: 'Plan')] as Object[],
                        "Another user has updated this Plan while you were editing")
                render(view: "edit", model: [planInstance: planInstance])
                return
            }
        }

        planInstance.properties = params

        if (!planInstance.save(flush: true)) {
            render(view: "edit", model: [planInstance: planInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'plan.label', default: 'Plan'), planInstance.id])
        redirect(action: "show", id: planInstance.id)
    }

    def delete() {
        def planInstance = Plan.get(params.id)
        if (!planInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])
            redirect(action: "list")
            return
        }

        try {
            planInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
