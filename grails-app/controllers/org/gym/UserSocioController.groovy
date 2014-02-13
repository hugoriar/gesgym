package org.gym

import grails.converters.JSON
import groovy.time.TimeCategory
import org.grails.plugin.filterpane.FilterPaneUtils
import org.gym.fichaMedica.CondicionMedica
import org.gym.reportes.DatosContratoUsuario
import org.apache.commons.logging.*
import org.gym.reportes.DatosReporteMembresias
import org.springframework.dao.DataIntegrityViolationException

import java.text.SimpleDateFormat

/**
 * UserSocioController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class UserSocioController {
    private static final log = LogFactory.getLog(this)

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

    def listCambiarEstadoBatch() {
        log.debug "Listando usuarios"

        params?.soloExpirados   = ((params?.soloExpirados =="on")||(params?.soloExpirados =="true"))?Boolean.TRUE:Boolean.FALSE
        params?.usarFechas   = ((params?.usarFechas =="on")||(params?.usarFechas =="true"))?Boolean.TRUE:Boolean.FALSE

        List<UserSocio> userSocioInstanceList     = userService.getUsuariosFiltrados(params)
        List<EstadoMembresia> estadoMembresiaList = userService.getListaEstadoMembresia(params)

        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render(view: "cambiarEstadosBatch",
                model: [
                        userSocioInstanceList:  userSocioInstanceList,
                        userSocioInstanceTotal: userSocioInstanceList.size(),
                        estadoMembresiaId:      params?.estadoMembresiaId,
                        soloExpirados:          params?.soloExpirados,
                        usarFechas:             params?.usarFechas,
                        estadoMembresiaList:    estadoMembresiaList,
                        desde:                  params.desde?(new SimpleDateFormat("dd-MM-yyyy").parse(params.desde?.toString())):(new Date()),
                        hasta:                  params.hasta?(new SimpleDateFormat("dd-MM-yyyy").parse(params.hasta?.toString())):(new Date().plus(7))
                ])
    }

    def arreglaFechas() {

        log.debug "Arreglando Fechas de HistorialMembresias"
        Date fechaInicio = new Date()
        Date fechaFin = new Date()
        Date inicioBonificacion = new Date()
        Date finBonificacion = new Date()
        HistorialMembresias.getAll().each {
            fechaInicio = ejecutaFecha(it.fechaInicio, 2000)
            fechaFin = ejecutaFecha(it.fechaFin, 2000)
            inicioBonificacion = ejecutaFecha(it.inicioBonificacion, 2000)
            finBonificacion = ejecutaFecha(it.finBonificacion, 2000)

            if (fechaInicio) it.fechaInicio = fechaInicio
            if (fechaFin) it.fechaFin = fechaFin
            if (inicioBonificacion) it.inicioBonificacion = inicioBonificacion
            if (finBonificacion) it.finBonificacion = finBonificacion

            if (fechaInicio || fechaFin || inicioBonificacion || finBonificacion){
                def oldVersion = it.version
                if (!it.dateCreated) it.dateCreated = new Date()
                if (it.save(flush: true)){
                    System.println("Modificado: "+it+" de versión "+oldVersion+" a "+it.version)
                } else {
                    System.println("Error al actualizar: "+it)
                }
            }
        }

        log.debug "Arreglando Fechas de Pago"
        Date fecha = new Date()
        Pago.getAll().each {
            fecha = ejecutaFecha(it.fecha, 2000)
            if (fecha) it.fecha = fecha

            if (fecha){
                def oldVersion = it.version
                if (!it.dateCreated) it.dateCreated = new Date()
                if (it.save(flush: true)){
                    System.println("Modificado: "+it+" de versión "+oldVersion+" a "+it.version)
                } else {
                    System.println("Error al actualizar: "+it)
                }
            }
        }

        log.debug "Arreglando Fechas de Matricula"
        Date fechaMatricula = new Date()
        Matricula.getAll().each {
            fechaMatricula = ejecutaFecha(it.fechaMatricula, 2000)
            if (fechaMatricula) it.fechaMatricula = fechaMatricula

            if (fechaMatricula){
                def oldVersion = it.version
                if (!it.dateCreated) it.dateCreated = new Date()
                if (it.save(flush: true)){
                    System.println("Modificado: "+it+" de versión "+oldVersion+" a "+it.version)
                } else {
                    System.println("Error al actualizar: "+it)
                }
            }
        }

        log.debug "Arreglando Fechas de UserSocio"
        Date fechaNacimiento = new Date()
        UserSocio.getAll().each {
            fechaNacimiento = ejecutaFecha(it.fechaNacimiento, 1900)
            if (fechaNacimiento) it.fechaNacimiento = fechaNacimiento

            if (fechaNacimiento){
                def oldVersion = it.version
                if (!it.dateCreated) it.dateCreated = new Date()
                if (it.save(flush: true)){
                    System.println("Modificado: "+it+" de versión "+oldVersion+" a "+it.version)
                } else {
                    System.println("Error al actualizar: "+it)
                }
            }
        }
    }

    Date ejecutaFecha(Date fecha, Long anios){
        if (fecha){
            if ((fecha?.getYear()+1900)<100) {
                System.print("Viejo: "+fecha+" Nuevo: "+new Date(year: fecha.year + anios, month: fecha.month, date: fecha.date, hours: fecha.hours, minutes: fecha.minutes, seconds: fecha.seconds))
                return new Date(
                        year: fecha.year + anios,
                        month: fecha.month,
                        date: fecha.date,
                        hours: fecha.hours,
                        minutes: fecha.minutes,
                        seconds: fecha.seconds
                )
            }
        }
    }

    def list() {
        log.debug "Listando usuarios"
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

        // Guardamos y mandamos el mail de comprobación
        userSocioInstance = userService.saveSocio(params, userSocioInstance)
        try {
            if (userSocioInstance?.errores){
                String mensaje = userSocioInstance.errores.defaultMessage
                if (mensaje.equals("[La propiedad [{0}] de la clase [{1}] con valor [{2}] debe ser única]")){
                    String propiedad = userSocioInstance.errores.arguments[0][0]
                    String clase = userSocioInstance.errores.arguments[0][1]
                    String valor = userSocioInstance.errores.arguments[0][2]
                    mensaje = "El "+clase+" con "+propiedad+" "+valor+" ya existe en el sistema, vuelva atrás para corregir o edite al usuario"
                }
                flash.message = mensaje
                redirect(action: "create"/*, params: params*/)
                return;
            }
        } catch (Exception e){
            params.id = userSocioInstance.id
            flash.message = message(code: 'default.created.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), userSocioInstance.id])
            chain(controller: "matricula", action: "create", params: params)
        }
    }

    def avatar_image = {
        def avatarUser = User.get(params.id)
        if (!avatarUser || !avatarUser.foto/* || !avatarUser.avatarType*/) {
            response.sendError(404)
            return;
        }
//        response.setContentType(avatarUser.avatarType)
        response.setContentLength(avatarUser.foto.size())
        OutputStream out = response.getOutputStream();
        out.write(avatarUser.foto);
        out.close();
    }

    def show() {
        log.debug "Mostrando usuario "+params.id

        def userSocioInstance = UserSocio.get(params.id)
        if (!userSocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), params.id])
            redirect(action: "list")
            return
        }
        List<HistorialMembresias> historialMembresiasInstance = userSocioInstance?.historialMembresias?.sort { it.fechaFin }
        [userSocioInstance: userSocioInstance, historialMembresiasInstance: historialMembresiasInstance, lastHistorialMembresiasInstance: (historialMembresiasInstance.size()>0)?historialMembresiasInstance.last():null]
//        [userSocioInstance: userSocioInstance, historialMembresiasInstance: historialMembresiasInstance, lastHistorialMembresiasInstance: historialMembresiasInstance?.last()]
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

        List<Date> meses = new ArrayList<Date>()
        use(TimeCategory) {
            def fecha = new Date(month: 0)
            12.times { i ->
                meses.add((fecha+(i).months).format('MMMM'))
            }
        }

        Date desde = new Date().parse("dd-MM-yyyy", (params.desdeDia?:(new Date().date))+"-"+(params.desdeMes?meses.indexOf(params.desdeMes)+1:(new Date().month+1))+"-"+(new Date().year +1900))
        Date hasta = new Date().parse("dd-MM-yyyy", (params.hastaDia?:(new Date().date))+"-"+(params.hastaMes?meses.indexOf(params.hastaMes)+1:(new Date().month+1))+"-"+(new Date().year +1900))

        params.desde = desde.format("dd-MM-yyyy")
        params.hasta = hasta.format("dd-MM-yyyy")

        List<UserSocio> userSocioInstanceList     = userService.getUsuariosFiltrados(params)

        [userSocioInstanceList: userSocioInstanceList,
            userSocioInstanceTotal: userSocioInstanceList.size(),
            accion: params.accion,
            usarFechas: params?.usarFechas,
            desdeDia: desde,
            desdeMes: desde,
            hastaDia: hasta,
            hastaMes: hasta,
            meses: meses
        ]
    }

    def renovarPlan() {
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
        [userSocioInstance: userSocioInstance, historialMembresiasInstance: lastHistorialMembresia, pagoInstance: lastPago, matriculaInstanceId: params.matriculaInstanceId]
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
    def cambiarEstadosBatch() {
        def List<UserSocio> userSocioInstanceList = new ArrayList<UserSocio>()
//        Buscamos a los HistorialMembresias "vencidos"
        List<HistorialMembresias> listHistorialMembresias = HistorialMembresias.findAllByFechaFinLessThan(new Date())sort { it.fechaFin }
        listHistorialMembresias.each {
            if (it.usuario.estadoMembresia?.id != 2){
                def userSocioInstance = it.usuario
                userSocioInstanceList.add(userSocioInstance)
            }
        }
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userSocioInstanceList:userSocioInstanceList, userSocioInstanceTotal: userSocioInstanceList.size()]
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
        UserSocio userSocioInstance = UserSocio.get(params?.id)
        Date fechaDeOperacion = new Date()
        Modalidad modalidad = Modalidad.get(2L)
        userService.ejecutaCambioEstado(userSocioInstance, fechaDeOperacion, userSocioInstance.estadoMembresia, EstadoMembresia.findById(params?.estadoMembresiaNuevo), modalidad, 0L)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), userSocioInstance.id])
        redirect(action: "show", id: userSocioInstance.id)
    }

    def cambiaEstadoAuto() {
        log.info "Entrando a cambiaEstadoAuto()..."
        def resp = userService.cambiaEstadoAuto()
        log.info "Saliendo de cambiaEstadoAuto()... "+resp.cont+" con nuevo estado: "+resp.estadoMembresiaInstance.estado
        flash.message = "Cambiado(s) "+resp.cont+" usuario(s) con nuevo estado: "+resp.estadoMembresiaInstance.estado
        redirect(action: "listCambiarEstadoBatch", params: params)

    }

    def cambiaEstadoBatch() {
        log.debug "Cambiando estados..."

        List<UserSocio> userSocioInstanceList = params.list('usuario')
        def cont = 0
        def estadoMembresiaInstance = EstadoMembresia.get(params?.estadoMembresiaNuevo?:0L)
        Date fechaDeOperacion = new Date()
        Modalidad modalidad = Modalidad.get(2L)
        userSocioInstanceList.each {
            UserSocio userSocioInstance = UserSocio.findById(it)
            cont = userService.ejecutaCambioEstado(userSocioInstance, fechaDeOperacion, userSocioInstance.estadoMembresia, estadoMembresiaInstance, modalidad, cont)
        }

        flash.message = cont + " registros modificados como " +estadoMembresiaInstance.estado
        redirect(action: "listCambiarEstadoBatch")
    }

/*    def ejecutaCambioEstado(UserSocio userSocioInstance, Date fechaDeOperacion, EstadoMembresia estadoAntiguo, EstadoMembresia estadoMembresiaInstance) {
        userSocioInstance.estadoMembresia = estadoMembresiaInstance
        if (userSocioInstance.save()) {
            estadoAntiguo = userSocioInstance.estadoMembresia
            def logCambiosDeEstadoInstance = new LogCambiosDeEstado(fechaDeOperacion: fechaDeOperacion, socio: userSocioInstance, estadoAntiguo: estadoAntiguo, estadoNuevo: estadoMembresiaInstance)
            if (!logCambiosDeEstadoInstance.save()) {
                return
            }
        }
        *//*        if (!userSocioInstance.save()) {
//            render(view: "create", model: [userSocioInstance: userSocioInstance])
            return
        }*//*
    }*/


    /*this method serves the report document for download*/
    def generateReport() {
        log.debug "Entrando a generateReport()..."

        def jasperDTOList = []
        def jasperDTO = new DatosContratoUsuario(UserSocio.findById(params.id), HistorialMembresias.findById(params.historialMembresiasInstanceId))
        jasperDTOList.add(jasperDTO)
        params.title = "CONTRATO DE SOCIO-USUARIO"
        params.lbl_casoEmergencia = "EN CASO DE EMERGENCIA AVISAR A:"
        params.logoPath = "${servletContext.getRealPath("/")}reports/images/logo_cafenaBN.jpg"
        params.direccion =  "5 Oriente 356\n" +
                            "Fonos: 032-2685340 / 032-2694084\n" +
                            "Correos: spa.marcoscafena@vtr.net / marcoscafena@vtr.net\n" +
                            "Pág. Web: www.spafitnessclub.cl\n" +
                            "VIÑA DEL MAR"
        def operationTime = new Date()
        params.operationTime = operationTime.format('dd/MM/yyyy HH:mm:ss')
        chain(controller:'jasper', action:'index', model:[data:jasperDTOList], params:params)
        return false
    }

        /*this method serves the report document for download*/
    def generateReportMembresias() {
        log.debug "Entrando a generateReport()..."

        def jasperDTOList = []

//        List<UserSocio> listSocios =
        def jasperDTO = new DatosReporteMembresias(UserSocio.findById(params.id), HistorialMembresias.findById(params.historialMembresiasInstanceId), EstadoMembresia)
        jasperDTOList.add(jasperDTO)

        params.title = "CONTRATO DE SOCIO-USUARIO"
        params.lbl_casoEmergencia = "EN CASO DE EMERGENCIA AVISAR A:"
        params.logoPath = "${servletContext.getRealPath("/")}reports/images/logo_cafenaBN.jpg"
        params.direccion =  "5 Oriente 356\n" +
                            "Fonos: 032-2685340 / 032-2694084\n" +
                            "Correos: spa.marcoscafena@vtr.net / marcoscafena@vtr.net\n" +
                            "Pág. Web: www.spafitnessclub.cl\n" +
                            "VIÑA DEL MAR"
        def operationTime = new Date()
        params.operationTime = operationTime.format('dd/MM/yyyy HH:mm:ss')
        chain(controller:'jasper', action:'index', model:[data:jasperDTOList], params:params)
        return false
    }

    def downloadFile = {
//        def sub = Submissions.get(params.id)
//        def file = new File("${sub.location}/${sub.fileName}")
        def webRootDir = servletContext.getRealPath("/")
        def linkDir = "${webRootDir}/reports/contrato_reverso.pdf"
        def file = new File(linkDir)
            if (file.exists()){
//                response.setContentType("application/octet-stream") // or or image/JPEG or text/xml or whatever type the file is
                FileNameMap fileNameMap = URLConnection.getFileNameMap()
                response.setContentType(fileNameMap.getContentTypeFor(linkDir)) // depende del tipo de archivo <
//                response.setHeader("Content-disposition", "attachment;filename=${file.name}")
                response.setHeader("Content-disposition", "inline;filename=${file.name}")
                response.outputStream << file.bytes
            }
            else render "Error!" // appropriate error handling
        }
}
