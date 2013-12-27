package org.gym

import org.springframework.dao.DataIntegrityViolationException

/**
 * MatriculaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class MatriculaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [matriculaInstanceList: Matricula.list(params), matriculaInstanceTotal: Matricula.count()]
    }

    def create() {
        def userSocioInstance = UserSocio.get(params.id)
        if (!userSocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), params.id])
            redirect(action: "list")
            return
        }
        def lastHistorialMembresia = new HistorialMembresias()
        def lastPago = new Pago()
        if (userSocioInstance.historialMembresias?.size() > 0) {
            lastHistorialMembresia = userSocioInstance.historialMembresias?.sort{it.id}?.last()
            lastPago = userSocioInstance.historialMembresias.sort{it.id}?.last()?.pago
        }

        [matriculaInstance: new Matricula(params), userSocioInstance: userSocioInstance, historialMembresiasInstance: lastHistorialMembresia, pagoInstance: lastPago, next: "agregarPlan"]
    }

    def save() {
        def matriculaInstance = new Matricula(params)
        matriculaInstance.pagoMatricula = new Pago(params)
        matriculaInstance.socio = UserSocio.get(params.id)
        if (!matriculaInstance.save(flush: true)) {
            render(view: "create", model: [matriculaInstance: matriculaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'matricula.label', default: 'Matricula'), matriculaInstance.id])
        if (params.next){
            chain(controller: "userSocio", action: "renovarPlan", params: params)
        }
        redirect(action: "show", id: matriculaInstance.id)
    }

    def show() {
        def matriculaInstance = Matricula.get(params.id)
        if (!matriculaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'matricula.label', default: 'Matricula'), params.id])
            redirect(action: "list")
            return
        }

        [matriculaInstance: matriculaInstance]
    }

    def edit() {
        def matriculaInstance = Matricula.get(params.id)
        if (!matriculaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'matricula.label', default: 'Matricula'), params.id])
            redirect(action: "list")
            return
        }

        [matriculaInstance: matriculaInstance]
    }

    def update() {
        def matriculaInstance = Matricula.get(params.id)
        if (!matriculaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'matricula.label', default: 'Matricula'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (matriculaInstance.version > version) {
                matriculaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'matricula.label', default: 'Matricula')] as Object[],
                        "Another user has updated this Matricula while you were editing")
                render(view: "edit", model: [matriculaInstance: matriculaInstance])
                return
            }
        }

        matriculaInstance.properties = params

        if (!matriculaInstance.save(flush: true)) {
            render(view: "edit", model: [matriculaInstance: matriculaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'matricula.label', default: 'Matricula'), matriculaInstance.id])
        redirect(action: "show", id: matriculaInstance.id)
    }

    def delete() {
        def matriculaInstance = Matricula.get(params.id)
        if (!matriculaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'matricula.label', default: 'Matricula'), params.id])
            redirect(action: "list")
            return
        }

        try {
            matriculaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'matricula.label', default: 'Matricula'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'matricula.label', default: 'Matricula'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
