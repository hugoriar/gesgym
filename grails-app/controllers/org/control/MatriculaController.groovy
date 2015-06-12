package org.control

import org.springframework.dao.DataIntegrityViolationException

/**
 * MatriculaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class MatriculaController {
    def springSecurityService
    def utilService

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
            lastPago = userSocioInstance.historialMembresias.sort{it.id}?.last()?.matricula?.pagoMatricula
//            lastPago = userSocioInstance.historialMembresias.sort{it.id}?.last()?.pago
        }

        [matriculaInstance: new Matricula(params), userSocioInstance: userSocioInstance, historialMembresiasInstance: lastHistorialMembresia, pagoInstance: lastPago, usuarioActual: springSecurityService.getCurrentUser(), next: "agregarPlan"]
    }

    def save() {
        def matriculaInstance = new Matricula(params)
        if (Boolean.parseBoolean(String.valueOf((params?.pagaMatricula == "on") || (String.valueOf(params?.pagaMatricula).equalsIgnoreCase("true"))))){
            matriculaInstance.pagoMatricula = new Pago(params)
//            matriculaInstance.pagoMatricula.fecha = new Date().parse("dd-MM-yyyy", params.fecha)
        }
        if (!matriculaInstance.save(flush: true)) {
            render(view: "create", model: [matriculaInstance: matriculaInstance])
            return
        }
        params.matriculaInstanceId = matriculaInstance.id
        flash.message = message(code: 'default.created.message', args: [message(code: 'matricula.label', default: 'Matricula'), matriculaInstance.id])
        if (params.next){
            chain(controller: "userSocio", action: "renovarPlan", params: params)
        } else {
            redirect(action: "show", id: matriculaInstance.id)
        }
    }

    def show() {
        def matriculaInstance = Matricula.get(params.id)
        if (!matriculaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'matricula.label', default: 'Matricula'), params.id])
            redirect(action: "list")
            return
        }
//        utilService.logOperacion(LogTipoOperacion.findByAccion(params.action), LogEntidad.findByNombreTabla(params.controller), Long.valueOf(params.id), springSecurityService.getCurrentUser() as UserPersonal, HistorialMembresias.findByMatricula(matriculaInstance).usuario, null)
        [matriculaInstance: matriculaInstance/*, userSocioInstance: UserSocio.findById(Long.getLong(params.userSocioInstanceId))*/]
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
