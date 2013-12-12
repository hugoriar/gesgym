package org.gym

import org.springframework.dao.DataIntegrityViolationException

/**
 * CargoInternoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CargoInternoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cargoInternoInstanceList: CargoInterno.list(params), cargoInternoInstanceTotal: CargoInterno.count()]
    }

    def create() {
        [cargoInternoInstance: new CargoInterno(params)]
    }

    def save() {
        def cargoInternoInstance = new CargoInterno(params)
        if (!cargoInternoInstance.save(flush: true)) {
            render(view: "create", model: [cargoInternoInstance: cargoInternoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cargoInterno.label', default: 'CargoInterno'), cargoInternoInstance.id])
        redirect(action: "show", id: cargoInternoInstance.id)
    }

    def show() {
        def cargoInternoInstance = CargoInterno.get(params.id)
        if (!cargoInternoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cargoInterno.label', default: 'CargoInterno'), params.id])
            redirect(action: "list")
            return
        }

        [cargoInternoInstance: cargoInternoInstance]
    }

    def edit() {
        def cargoInternoInstance = CargoInterno.get(params.id)
        if (!cargoInternoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cargoInterno.label', default: 'CargoInterno'), params.id])
            redirect(action: "list")
            return
        }

        [cargoInternoInstance: cargoInternoInstance]
    }

    def update() {
        def cargoInternoInstance = CargoInterno.get(params.id)
        if (!cargoInternoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cargoInterno.label', default: 'CargoInterno'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (cargoInternoInstance.version > version) {
                cargoInternoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'cargoInterno.label', default: 'CargoInterno')] as Object[],
                        "Another user has updated this CargoInterno while you were editing")
                render(view: "edit", model: [cargoInternoInstance: cargoInternoInstance])
                return
            }
        }

        cargoInternoInstance.properties = params

        if (!cargoInternoInstance.save(flush: true)) {
            render(view: "edit", model: [cargoInternoInstance: cargoInternoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cargoInterno.label', default: 'CargoInterno'), cargoInternoInstance.id])
        redirect(action: "show", id: cargoInternoInstance.id)
    }

    def delete() {
        def cargoInternoInstance = CargoInterno.get(params.id)
        if (!cargoInternoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cargoInterno.label', default: 'CargoInterno'), params.id])
            redirect(action: "list")
            return
        }

        try {
            cargoInternoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cargoInterno.label', default: 'CargoInterno'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cargoInterno.label', default: 'CargoInterno'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
