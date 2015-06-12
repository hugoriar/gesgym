package org.control.ventas

import org.control.ventas.SubCategoria
import org.springframework.dao.DataIntegrityViolationException

/**
 * SubCategoriaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class SubCategoriaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [subCategoriaInstanceList: SubCategoria.list(params), subCategoriaInstanceTotal: SubCategoria.count()]
    }

    def create() {
        [subCategoriaInstance: new SubCategoria(params)]
    }

    def save() {
        def subCategoriaInstance = new SubCategoria(params)
        if (!subCategoriaInstance.save(flush: true)) {
            render(view: "create", model: [subCategoriaInstance: subCategoriaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'subCategoria.label', default: 'SubCategoria'), subCategoriaInstance.id])
        redirect(action: "show", id: subCategoriaInstance.id)
    }

    def show() {
        def subCategoriaInstance = SubCategoria.get(params.id)
        if (!subCategoriaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCategoria.label', default: 'SubCategoria'), params.id])
            redirect(action: "list")
            return
        }

        [subCategoriaInstance: subCategoriaInstance]
    }

    def edit() {
        def subCategoriaInstance = SubCategoria.get(params.id)
        if (!subCategoriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCategoria.label', default: 'SubCategoria'), params.id])
            redirect(action: "list")
            return
        }

        [subCategoriaInstance: subCategoriaInstance]
    }

    def update() {
        def subCategoriaInstance = SubCategoria.get(params.id)
        if (!subCategoriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCategoria.label', default: 'SubCategoria'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (subCategoriaInstance.version > version) {
                subCategoriaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subCategoria.label', default: 'SubCategoria')] as Object[],
                          "Another user has updated this SubCategoria while you were editing")
                render(view: "edit", model: [subCategoriaInstance: subCategoriaInstance])
                return
            }
        }

        subCategoriaInstance.properties = params

        if (!subCategoriaInstance.save(flush: true)) {
            render(view: "edit", model: [subCategoriaInstance: subCategoriaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'subCategoria.label', default: 'SubCategoria'), subCategoriaInstance.id])
        redirect(action: "show", id: subCategoriaInstance.id)
    }

    def delete() {
        def subCategoriaInstance = SubCategoria.get(params.id)
        if (!subCategoriaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCategoria.label', default: 'SubCategoria'), params.id])
            redirect(action: "list")
            return
        }

        try {
            subCategoriaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'subCategoria.label', default: 'SubCategoria'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subCategoria.label', default: 'SubCategoria'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
