package org.gym

import org.gym.ubicacion.Sector
import org.springframework.dao.DataIntegrityViolationException

/**
 * SectorController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class SectorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [sectorInstanceList: Sector.list(params), sectorInstanceTotal: Sector.count()]
    }

    def create() {
        [sectorInstance: new Sector(params)]
    }

    def save() {
        def sectorInstance = new Sector(params)
        if (!sectorInstance.save(flush: true)) {
            render(view: "create", model: [sectorInstance: sectorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'sector.label', default: 'Sector'), sectorInstance.id])
        redirect(action: "show", id: sectorInstance.id)
    }

    def show() {
        def sectorInstance = Sector.get(params.id)
        if (!sectorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sector.label', default: 'Sector'), params.id])
            redirect(action: "list")
            return
        }

        [sectorInstance: sectorInstance]
    }

    def edit() {
        def sectorInstance = Sector.get(params.id)
        if (!sectorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sector.label', default: 'Sector'), params.id])
            redirect(action: "list")
            return
        }

        [sectorInstance: sectorInstance]
    }

    def update() {
        def sectorInstance = Sector.get(params.id)
        if (!sectorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sector.label', default: 'Sector'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (sectorInstance.version > version) {
                sectorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'sector.label', default: 'Sector')] as Object[],
                        "Another user has updated this Sector while you were editing")
                render(view: "edit", model: [sectorInstance: sectorInstance])
                return
            }
        }

        sectorInstance.properties = params

        if (!sectorInstance.save(flush: true)) {
            render(view: "edit", model: [sectorInstance: sectorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'sector.label', default: 'Sector'), sectorInstance.id])
        redirect(action: "show", id: sectorInstance.id)
    }

    def delete() {
        def sectorInstance = Sector.get(params.id)
        if (!sectorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sector.label', default: 'Sector'), params.id])
            redirect(action: "list")
            return
        }

        try {
            sectorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'sector.label', default: 'Sector'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sector.label', default: 'Sector'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
