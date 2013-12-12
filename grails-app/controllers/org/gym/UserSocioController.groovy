package org.gym

import grails.converters.JSON
import org.grails.plugin.filterpane.FilterPaneUtils
import org.gym.fichaMedica.CondicionMedica
import org.gym.reportes.DatosContratoUsuario
import org.gym.ubicacion.Ciudad
import org.springframework.dao.DataIntegrityViolationException

/**
 * UserSocioController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class UserSocioController {
    def userService
    def filterPaneService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def filter = {
        if(!params.max) params.max = 10
        render( view:'list',
                model:[ userSocioInstanceList: filterPaneService.filter( params, UserSocio ),
                        userSocioInstanceTotal: filterPaneService.count( params, UserSocio ),
                        filterParams: FilterPaneUtils.extractFilterParams(params),
                        params:params ] )
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userSocioInstanceList: UserSocio.list(params), userSocioInstanceTotal: UserSocio.count()]
    }

    def create() {
        [userSocioInstance: new UserSocio(params),
                direccionUsuarioInstance: new DireccionUsuario(params),
                contactoEmergenciaInstance: new ContactoEmergencia(params),
                condicionMedicaInstance: new CondicionMedica(params),
                empresaInstance: new Empresa(params),
                historialMembresiasInstance: new HistorialMembresias(params)]
    }

    def save() {
        def userSocioInstance = new UserSocio(params)

        def matriculaInstance = new Matricula(params)
        matriculaInstance.socio = userSocioInstance
        // ... y se le asigna la empresa al usuario
        userSocioInstance.matricula = matriculaInstance

        // Guardamos y mandamos el mail de comprobación
        userSocioInstance = userService.saveSocio(params, userSocioInstance)

        flash.message = message(code: 'default.created.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), userSocioInstance.id])
        redirect(action: "show", id: userSocioInstance.id)
    }

    def show() {
        def userSocioInstance = UserSocio.get(params.id)
        if (!userSocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), params.id])
            redirect(action: "list")
            return
        }

        [userSocioInstance: userSocioInstance]
    }

    def edit() {
        def userSocioInstance = UserSocio.get(params.id)
        if (!userSocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), params.id])
            redirect(action: "list")
            return
        }

        [userSocioInstance: userSocioInstance, direccionUsuarioInstance: userSocioInstance.domicilio, contactoEmergenciaInstance: userSocioInstance.contactoEmergencia,
                condicionMedicaInstance: userSocioInstance?.condicionMedica, profesionalInstance: userSocioInstance.condicionMedica?.profesional,
                empresaInstance: userSocioInstance?.empresa, direccionEmpresaInstance: userSocioInstance.empresa?.direccionEmpresa,
                historialMembresiasInstance: userSocioInstance.historialMembresias.last(), pagoInstance: userSocioInstance.historialMembresias.last().pago]
    }

    def update() {
        def userSocioInstance = UserSocio.get(params.id)
        if (!userSocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userSocioInstance.version > version) {
                userSocioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'userSocio.label', default: 'UserSocio')] as Object[],
                        "Another user has updated this UserSocio while you were editing")
                render(view: "edit", model: [userSocioInstance: userSocioInstance])
                return
            }
        }

        /* userSocioInstance.properties = params
        if (!userSocioInstance.save(flush: true)) {
             render(view: "edit", model: [userSocioInstance: userSocioInstance])
             return
         }*/

        // Actualizamos
        userSocioInstance = userService.updateSocio(params, userSocioInstance)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), userSocioInstance.id])
        redirect(action: "show", id: userSocioInstance.id)
    }

    def delete() {
        def userSocioInstance = UserSocio.get(params.id)
        if (!userSocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), params.id])
            redirect(action: "list")
            return
        }

        try {
            userSocioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def eliminarUsuario() {
        delete()
    }


    def ajaxBuscadorSocio = {
        def c = UserSocio.createCriteria()
        def socio = c.list { like("nombre", params.term + "%") order("nombre", "asc") }
        def res = []

        socio.each{
            value ->
                res.add(value.nombre)
        }

        render (res as JSON)

    }

    def complist = {
        render UserService.complist(params) as JSON
    }


    def listAccionesUsuario() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userSocioInstanceList: UserSocio.list(params), userSocioInstanceTotal: UserSocio.count(), accion: params.accion]
    }

    def listCumpleanosUsuario() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        Calendar hoy = Calendar.getInstance()
        [userSocioInstanceList: UserSocio.list(params), userSocioInstanceTotal: UserSocio.count(), accion: params.accion, dia: hoy.get(GregorianCalendar.DAY_OF_MONTH), mes: hoy.get(GregorianCalendar.MONTH)]
    }

    def renovarPlan() {
        def userSocioInstance = UserSocio.get(params.id)
        if (!userSocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), params.id])
            redirect(action: "list")
            return
        }
        [userSocioInstance: userSocioInstance, historialMembresiasInstance: userSocioInstance.historialMembresias.sort{it.id}.last(), pagoInstance: userSocioInstance.historialMembresias.sort{it.id}.last().pago]
    }

    def cambiarEstado() {
        def userSocioInstance = UserSocio.get(params.id)
        if (!userSocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), params.id])
            redirect(action: "list")
            return
        }
        [userSocioInstance: userSocioInstance, historialMembresiasInstance: userSocioInstance.historialMembresias.sort{it.id}.last(), pagoInstance: userSocioInstance.historialMembresias.sort{it.id}.last().pago, estadoMembresiaInstance: userSocioInstance.estadoMembresia]
    }

    def renuevaPlan() {
        def userSocioInstance = UserSocio.get(params.id)
        if (!userSocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), params.id])
            redirect(action: "list")
            return
        }
        //        Guardamos y mandamos el mail de comprobación
        userService.saveHistorialMembresias(params, userSocioInstance)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), userSocioInstance.id])
        redirect(action: "show", id: userSocioInstance.id)
    }

    def cambiaEstado() {
        def userSocioInstance = UserSocio.get(params.id)
        if (!userSocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), params.id])
            redirect(action: "list")
            return
        }
        //        Guardamos y mandamos el mail de comprobación
//        userService.saveHistorialMembresias(params, userSocioInstance)
        userSocioInstance.estadoMembresia = EstadoMembresia.findById(params.estadoMembresia.id)
        if (!userSocioInstance.save()) {
//            render(view: "create", model: [userSocioInstance: userSocioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), userSocioInstance.id])
        redirect(action: "show", id: userSocioInstance.id)
    }

    /*this method serves the report document for download*/
    def generateReport() {
        def jasperDTOList = []
        def jasperDTO = new DatosContratoUsuario(UserSocio.findById(params.id))
        jasperDTOList.add(jasperDTO)
        params.title = "CONTRATO DE SOCIO-USUARIO"
        params.direccion =  "5 Oriente 356\n" +
                            "Fonos: 032-2685340 / 032-2694084\n" +
                            "Correos: spa.marcoscafena@vtr.net / marcoscafena@vtr.net\n" +
                            "Pág. Web: www.spafitnessclub.cl\n" +
                            "VIÑA DEL MAR"
        params.operationTime = new Date()
        chain(controller:'jasper', action:'index', model:[data:jasperDTOList], params:params)
        return false
    }
}
