package org.control

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import groovy.time.TimeCategory
import org.apache.commons.logging.LogFactory
import org.control.calendario.Horario
import org.control.fichaMedica.CondicionMedica
import org.control.reportes.DatosContratoUsuario
import org.control.reportes.DatosReporteMembresias
import org.grails.plugin.filterpane.FilterPaneUtils
import org.joda.time.DateTime
import org.springframework.dao.DataIntegrityViolationException

import java.text.SimpleDateFormat

/**
 * UserSocioController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class UserSocioController {
    private static final log = LogFactory.getLog(this)
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm")
    def userService
    def utilService
    def filterPaneService
    def exportService
    def grailsApplication
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def filter = {
        if (!params.max) params.max = 10
        render(view: 'list',
                model: [userSocioInstanceList: filterPaneService.filter(params, UserSocio),
                        userSocioInstanceTotal: filterPaneService.count(params, UserSocio),
                        filterParams         : FilterPaneUtils.extractFilterParams(params),
                        params               : params])
    }

    def listCambiarEstadoBatch() {
        log.debug "Listando usuarios"

        params?.soloExpirados = ((params?.soloExpirados == "on") || (params?.soloExpirados == "true")) ? Boolean.TRUE : Boolean.FALSE
        params?.soloInactivos = ((params?.soloInactivos == "on") || (params?.soloInactivos == "true")) ? Boolean.TRUE : Boolean.FALSE
        params?.usarFechas = ((params?.usarFechas == "on") || (params?.usarFechas == "true")) ? Boolean.TRUE : Boolean.FALSE

        List<UserSocio> userSocioInstanceList = userService.getUsuariosFiltrados(params)
        List<EstadoMembresia> estadoMembresiaList = userService.getListaEstadoMembresia(params)
        List<Plan> planList = userService.getListaPlan()
        EstadoMembresia estadoMembresia

        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        estadoMembresiaList.each {
            if ((params?.estadoMembresiaId).equals((it.id).toString())) estadoMembresia = it
        }

//        params.desde = params.desde ? sdf.parse(params.desde) : new Date().minus(7)
        params.desde = params.desde ? sdf.parse(params.desde) : new DateTime().minusDays(7).withTimeAtStartOfDay().toDate()
        params.hasta = params.hasta ? sdf.parse(params.hasta) : new DateTime().plusDays(1).withTimeAtStartOfDay().minusMinutes(1).toDate()

        render(view: "cambiarEstadosBatch",
                model: [
                        userSocioInstanceList: userSocioInstanceList,
                        userSocioInstanceTotal: userSocioInstanceList.size(),
                        estadoMembresiaId    : params?.estadoMembresiaId,
                        soloExpirados        : params?.soloExpirados,
                        soloInactivos        : params?.soloInactivos,
                        usarFechas           : params?.usarFechas,
                        sort                 : params?.sort,
                        order                : params?.order,
                        estadoMembresiaList  : estadoMembresiaList,
                        planList             : planList,
                        planId               : params?.planId,
                        usuario              : params?.usuario,
//                        desde                : params.desde ? (new SimpleDateFormat("dd-MM-yyyy").parse(params.desde?.toString())) : (new Date()),
//                        hasta                : params.hasta ? (new SimpleDateFormat("dd-MM-yyyy").parse(params.hasta?.toString())) : (new Date().plus(7))
                        periodo              : params?.periodo,
                        desde                : sdf.format(params?.desde),
                        hasta                : sdf.format(params?.hasta)
                ])
    }

    def generaReportes() {
        log.debug "Listando usuarios"

        List<String> userSocioIdList = new ArrayList<String>()
        List<UserSocio> userSocioInstanceList = new ArrayList<UserSocio>()
        List<EstadoMembresia> estadoMembresiaList = userService.getListaEstadoMembresia(params)
        EstadoMembresia estadoMembresia

        estadoMembresiaList.each {
            if ((params?.estadoMembresiaId).equals((it.id).toString())) estadoMembresia = it
        }

        userSocioIdList = params.list('usuario')
        userSocioIdList.each {
            log.info(it)
            UserSocio userSocioInstance = UserSocio.findById(Long.valueOf(String.valueOf(it).replace(".","")))
            log.info(userSocioInstance.id)
            if (userSocioInstance) {
                userSocioInstanceList.add(userSocioInstance)
            }
        }

        params.format = "pdf"
        response.contentType = grailsApplication.config.grails.mime.types[params.format]
        String tituloPDF = "Reporte de Membresías ${if (Boolean.valueOf(params?.soloExpirados)) {"expiradas "} else {""}}${ if (Boolean.valueOf(params?.soloInactivos)) {"inactivas "} else {""}}con estado " + estadoMembresia?.estado + " y ${ if (Integer.valueOf(params?.planId) != 0) { "Plan " + Plan.get(params?.planId).nombre} else {"Todos los planes"}}"
        if (Boolean.valueOf(params?.usarFechas)) {
            Date desde = params.desde ? sdf.parse(params.desde) : new DateTime().minusDays(7).withTimeAtStartOfDay().toDate()
            Date hasta = params.hasta ? sdf.parse(params.hasta) : new DateTime().plusDays(1).withTimeAtStartOfDay().minusMinutes(1).toDate()
            if (desde.compareTo(hasta)) {
                response.setHeader("Content-disposition", "inline; filename=Estados_${utilService.fechaFormateada(desde)}_al_${utilService.fechaFormateada(hasta)}.${params.extension}")
                // ó attachment
                tituloPDF += ", con fecha de vencimiento entre el " + utilService.fechaFormateada(desde) + " y el " + utilService.fechaFormateada(hasta)
            } else {
                response.setHeader("Content-disposition", "inline; filename=Estados_${utilService.fechaFormateada(desde)}.${params.extension}")
                tituloPDF += ", con fecha de vencimiento el día " + utilService.fechaFormateada(desde)
            }

        }
        tituloPDF += " (" + userSocioInstanceList.size() + " usuarios)"

        List fields = ["nombre", "apellidoPaterno", "apellidoMaterno", "fono", "email", "estadoMembresia", "enrolado", "ultimaVisita", "historialMembresias.fechaFin"]
        Map labels = ["nombre": "Nombre", "apellidoPaterno": "Apellido Paterno", "apellidoMaterno": "Apellido Materno", "fono": "Fono", "email": "Email", "estadoMembresia": "Estado", "enrolado": "Enrolado", "ultimaVisita": "Última Visita", "historialMembresias.fechaFin": "Término Plan"]

        // Formatter closure
        def upperCase = { domain, value ->
            return value.toUpperCase()
        }

        def aFecha = { domain, value ->
            if (domain.historialMembresias.size() > 0) {
                def fecha = (utilService.fechaFormateada(domain.ultimoPlan?.fechaFin)).toString()
                return new String(fecha.toString().substring(0, 1).toUpperCase() + fecha.toString().substring(1));
            }
            return
        }

        def aUltimaVisita = { domain, value ->
            if (domain.visitas.size() > 0) {
//                    def fecha = (utilService.fechaFormateada(domain.ultima.fechaFin)).toString()
                return domain.ultimaVisita.fechaDeVisita?.format("dd-MM-yy") + " " + domain.ultimaVisita.horaDeEntrada?.format("HH:mm");
            }
            return
        }

        def aFono = { domain, value ->
            return domain?.getFonos(true, true, false, 2, " - ");
        }

        def aEmail = { domain, value ->
            return domain?.email?.toLowerCase();
        }

        def aRut = { domain, value ->
            return (String.format("%,d", value)) + "-" + (Character.toString(domain.dv));
        }

        def aEnrolado = { domain, value ->
            return domain?.huella() ? "Si" : "No";
        }

        Map formatters = [nombre: upperCase, apellidoPaterno: upperCase, apellidoMaterno: upperCase, "historialMembresias.fechaFin": aFecha, fono: aFono, email: aEmail, ultimaVisita: aUltimaVisita, enrolado: aEnrolado]
        Map parameters = [title: tituloPDF, "pdf.orientation": "landscape", "column.widths": [0.12, 0.12, 0.12, 0.12, 0.2, 0.06, 0.06, 0.1, 0.1]]

        exportService.export(params.format, response.outputStream, userSocioInstanceList, fields, labels, formatters, parameters)
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

            if (fechaInicio || fechaFin || inicioBonificacion || finBonificacion) {
                def oldVersion = it.version
                if (!it.dateCreated) it.dateCreated = new Date()
                if (it.save(flush: true)) {
                    System.println("Modificado: " + it + " de versión " + oldVersion + " a " + it.version)
                } else {
                    System.println("Error al actualizar: " + it)
                }
            }
        }

        log.debug "Arreglando Fechas de Pago"
        Date fecha = new Date()
        Pago.getAll().each {
            fecha = ejecutaFecha(it.fecha, 2000)
            if (fecha) it.fecha = fecha

            if (fecha) {
                def oldVersion = it.version
                if (!it.dateCreated) it.dateCreated = new Date()
                if (it.save(flush: true)) {
                    System.println("Modificado: " + it + " de versión " + oldVersion + " a " + it.version)
                } else {
                    System.println("Error al actualizar: " + it)
                }
            }
        }

        log.debug "Arreglando Fechas de Matricula"
        Date fechaMatricula = new Date()
        Matricula.getAll().each {
            fechaMatricula = ejecutaFecha(it.fechaMatricula, 2000)
            if (fechaMatricula) it.fechaMatricula = fechaMatricula

            if (fechaMatricula) {
                def oldVersion = it.version
                if (!it.dateCreated) it.dateCreated = new Date()
                if (it.save(flush: true)) {
                    System.println("Modificado: " + it + " de versión " + oldVersion + " a " + it.version)
                } else {
                    System.println("Error al actualizar: " + it)
                }
            }
        }

        log.debug "Arreglando Fechas de UserSocio"
        Date fechaNacimiento = new Date()
        UserSocio.getAll().each {
            fechaNacimiento = ejecutaFecha(it.fechaNacimiento, 1900)
            if (fechaNacimiento) it.fechaNacimiento = fechaNacimiento

            if (fechaNacimiento) {
                def oldVersion = it.version
                if (!it.dateCreated) it.dateCreated = new Date()
                if (it.save(flush: true)) {
                    System.println("Modificado: " + it + " de versión " + oldVersion + " a " + it.version)
                } else {
                    System.println("Error al actualizar: " + it)
                }
            }
        }
    }

    Date ejecutaFecha(Date fecha, Long anios) {
        if (fecha) {
            if ((fecha?.getYear() + 1900) < 100) {
                System.print("Viejo: " + fecha + " Nuevo: " + new Date(year: fecha.year + anios, month: fecha.month, date: fecha.date, hours: fecha.hours, minutes: fecha.minutes, seconds: fecha.seconds))
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

        if (!params.order) {
            params.sort = "id"
            params.order = "desc"
        }

        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userSocioInstanceList: UserSocio.list(params), userSocioInstanceTotal: UserSocio.count()/*, userSocioInstanceCompleteList: UserSocio.list()*/]
    }

    def rankings() {
        log.debug "Listando usuarios"

        params?.usarFechas = ((params?.usarFechas == "on") || (params?.usarFechas == "true")) ? Boolean.TRUE : Boolean.FALSE
        List<UserSocio> userSocioInstanceList = new ArrayList<UserSocio>()

        if (!params.order) {
            params.sort = "cantVisitas"
            params.order = "desc"
        }

        if (Boolean.valueOf(params?.inicioDeSemana)) {
            Calendar c = Calendar.getInstance()
            c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY)
            params.desde = c.getTime().format("dd-MM-yyyy")
        } else if (Boolean.valueOf(params?.inicioDeMes)) {
            Calendar c = Calendar.getInstance()
            c.set(Calendar.DAY_OF_MONTH, 1)
            params.desde = c.getTime().format("dd-MM-yyyy")
        } else if (Boolean.valueOf(params?.inicioDeAnio)) {
            Calendar c = Calendar.getInstance()
            c.set(Calendar.DAY_OF_MONTH, 1)
            c.set(Calendar.MONTH, 0)
            params.desde = c.getTime().format("dd-MM-yyyy")
        }

        if (Boolean.valueOf(params?.usarFechas)) {
            Date desde = params.desde ? (new SimpleDateFormat("dd-MM-yyyy").parse(params.desde?.toString())) : (new Date())
            Date hasta = params.hasta ? (new SimpleDateFormat("dd-MM-yyyy").parse(params.hasta?.toString())) : (new Date())
            String sort = params?.sort ?: "cantVisitas"

            def visitaInstanceList = Visita.findAllByFechaDeVisitaGreaterThanEqualsAndFechaDeVisitaLessThanEquals(desde, hasta) sort {
                if (it.usuario?."$sort" instanceof String) {
                    it.usuario?."$sort".toLowerCase()
                } else {
                    it.usuario?."$sort"
                }
            }
            visitaInstanceList.each {
                if (!userSocioInstanceList.contains(it.usuario)) {
                    userSocioInstanceList.add(it.usuario)
                }
            }

            // Elimina o no los usuarios que no han asistido en el rango dado
            if (params.ignorarCeros == 'on') {
                userSocioInstanceList.removeAll { it.getCantVisitas() <= 0 }
            }

            // Ordena el listado según la cantidad de visitas en el rango dado
            if (params.sort == 'cantVisitas') {
                userSocioInstanceList.sort { it.getCantVisitasFecha(desde, hasta) }
            }

            userSocioInstanceList = params.order?.equalsIgnoreCase("asc") ? userSocioInstanceList : userSocioInstanceList.reverse()

            if (params?.format && params.format != "html") {
                response.contentType = grailsApplication.config.grails.mime.types[params.format]
                String tituloPDF
                if (desde.compareTo(hasta)) {
                    response.setHeader("Content-disposition", "inline; filename=Ranking_${new SimpleDateFormat('dd-MM-yy').format(desde)}_al_${new SimpleDateFormat('dd-MM-yy').format(hasta)}.${params.extension}")
                    //attachment
                    tituloPDF = "Ranking de Asistencias entre el " + new SimpleDateFormat('EEEE dd-MM-yy').format(desde) + " y el " + new SimpleDateFormat('EEEE dd-MM-yy').format(hasta)
                } else {
                    response.setHeader("Content-disposition", "inline; filename=Ranking_${new SimpleDateFormat('dd-MM-yy').format(desde)}.${params.extension}")
                    tituloPDF = "Ranking de Asistencias día " + new SimpleDateFormat('EEEE dd-MM-yy').format(desde)
                }

                List fields = ["nombre", "apellidoPaterno", "apellidoMaterno", "rut", "estadoMembresia", "historialMembresias.fechaFin", "cantVisitas"]
                Map labels = ["nombre": "Nombre", "apellidoPaterno": "Apellido Paterno", "apellidoMaterno": "Apellido Materno", "rut": "Rut", "estadoMembresia": "Estado Actual", "historialMembresias.fechaFin": "Término Plan", "cantVisitas": "Asistencias"]

                // Formatter closure
                def upperCase = { domain, value ->
                    return value.toUpperCase()
                }

                def aFecha = { domain, value ->
                    if (domain.historialMembresias.size() > 0) {
                        def fecha = (utilService.fechaFormateadaSinDia(domain.ultimoPlan?.fechaFin)).toString()
                        return new String(fecha.toString().substring(0, 1).toUpperCase() + fecha.toString().substring(1));
                    }
                    return
                }

                def aRut = { domain, value ->
                    return (String.format("%,d", value)) + "-" + (Character.toString(domain.dv));
                }

                def aCantVisitas = { domain, value ->
                    return domain.getCantVisitasFecha(desde, hasta);
                }

                Map formatters = [nombre: upperCase, apellidoPaterno: upperCase, apellidoMaterno: upperCase, "historialMembresias.fechaFin": aFecha, rut: aRut, cantVisitas: aCantVisitas]
                Map parameters = [title: tituloPDF, "pdf.orientation": "portrait"]

                exportService.export(params.format, response.outputStream, userSocioInstanceList, fields, labels, formatters, parameters)
            }
        } else {
            String sort = params?.sort ?: "cantVisitas"

            def visitaInstanceList = Visita.findAll() sort {
                if (it.usuario?."$sort" instanceof String) {
                    it.usuario?."$sort".toLowerCase()
                } else {
                    it.usuario?."$sort"
                }
            }
            visitaInstanceList.each {
                if (!userSocioInstanceList.contains(it.usuario)) {
                    userSocioInstanceList.add(it.usuario)
                }
            }

            // Elimina o no los usuarios que no han asistido en el rango dado
            if (params.ignorarCeros == 'on') {
                userSocioInstanceList.removeAll { it.getCantVisitas() <= 0 }
            }

            userSocioInstanceList = params.order?.equalsIgnoreCase("asc") ? userSocioInstanceList : userSocioInstanceList.reverse()

            if (params?.format && params.format != "html") {
                response.contentType = grailsApplication.config.grails.mime.types[params.format]
                String tituloPDF

                response.setHeader("Content-disposition", "inline; filename=Ranking_${new SimpleDateFormat('dd-MM-yy').format(new Date())}.${params.extension}")
                tituloPDF = "Ranking de Asistencias al día " + new SimpleDateFormat('EEEE dd-MM-yy').format(new Date())

                List fields = ["nombre", "apellidoPaterno", "apellidoMaterno", "rut", "estadoMembresia", "historialMembresias.fechaFin", "cantVisitas"]
                Map labels = ["nombre": "Nombre", "apellidoPaterno": "Apellido Paterno", "apellidoMaterno": "Apellido Materno", "rut": "Rut", "estadoMembresia": "Estado Actual", "historialMembresias.fechaFin": "Término Plan", "cantVisitas": "Asistencias"]

                // Formatter closure
                def upperCase = { domain, value ->
                    return value.toUpperCase()
                }

                def aFecha = { domain, value ->
                    if (domain.historialMembresias.size() > 0) {
                        def fecha = (utilService.fechaFormateadaSinDia(domain.ultimoPlan?.fechaFin)).toString()
                        return new String(fecha.toString().substring(0, 1).toUpperCase() + fecha.toString().substring(1));
                    }
                    return
                }

                def aRut = { domain, value ->
                    return (String.format("%,d", value)) + "-" + (Character.toString(domain.dv));
                }

                def aCantVisitas = { domain, value ->
                    return domain.getCantVisitas();
                }

                Map formatters = [nombre: upperCase, apellidoPaterno: upperCase, apellidoMaterno: upperCase, "historialMembresias.fechaFin": aFecha, rut: aRut, cantVisitas: aCantVisitas]
                Map parameters = [title: tituloPDF, "pdf.orientation": "portrait"]

                exportService.export(params.format, response.outputStream, userSocioInstanceList, fields, labels, formatters, parameters)
            }

        }

//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [
                userSocioInstanceList: userSocioInstanceList,
                userSocioInstanceTotal: userSocioInstanceList.size(),
                estadoMembresiaId    : params?.estadoMembresiaId,
                soloExpirados        : params?.soloExpirados,
                usarFechas           : params?.usarFechas,
                sort                 : params?.sort,
                order                : params?.order,
                desde                : params.desde ? (new SimpleDateFormat("dd-MM-yyyy").parse(params.desde?.toString())) : (new Date()),
                hasta                : params.hasta ? (new SimpleDateFormat("dd-MM-yyyy").parse(params.hasta?.toString())) : (new Date().plus(7)),
                sufijoTitulo         : params?.sufijoTitulo
        ]
    }

    def create() {
        [userSocioInstance          : new UserSocio(params),
         direccionUsuarioInstance   : new DireccionUsuario(params),
         contactoEmergenciaInstance : new ContactoEmergencia(params),
         condicionMedicaInstance    : new CondicionMedica(params),
         empresaInstance            : new Empresa(params),
         historialMembresiasInstance: new HistorialMembresias(params)]
    }

    def save() {
        def userSocioInstance = new UserSocio(params)

        // Guardamos y mandamos el mail de comprobación
        userSocioInstance = userService.saveSocio(params, userSocioInstance)
        try {
            if (userSocioInstance?.errores) {
                String mensaje = userSocioInstance.errores.defaultMessage
                if (mensaje.equals("[La propiedad [{0}] de la clase [{1}] con valor [{2}] debe ser única]")) {
                    String propiedad = userSocioInstance.errores.arguments[0][0]
                    String clase = userSocioInstance.errores.arguments[0][1]
                    String valor = userSocioInstance.errores.arguments[0][2]
                    mensaje = "El " + clase + " con " + propiedad + " " + valor + " ya existe en el sistema, vuelva atrás para corregir o edite al usuario"
                }
                flash.message = mensaje
                redirect(action: "create"/*, params: params*/)
                return;
            }
        } catch (Exception e) {
            params.id = userSocioInstance.id
            flash.message = message(code: 'default.created.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), userSocioInstance.id])
//            chain(controller: "matricula", action: "create", params: params)
            redirect(action: "show", id: userSocioInstance.id)
        }
    }

    @Secured(['permitAll'])
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

/*    def avatar_image = {
        def user =User.get(params.id)
        def myfile =user.foto
        if (myfile) {
            response.outputStream << myfile.getInputStream();
            response.contentType = myfile.getContentType();// The contentType was seted when update. save and read now.
            return;
        } else {
            render(text: "File Lost!", contentType: 'text/plain', encoding: "UTF-8");
        }
    }*/

    @Secured(['permitAll'])
    def show() {
        log.debug "Mostrando usuario " + params.id

        def userSocioInstance = UserSocio.get(params.id)
        if (!userSocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), params.id])
            redirect(action: "list")
            return
        }
        List<HistorialMembresias> historialMembresiasInstance = userSocioInstance?.historialMembresias?.sort { it.fechaFin }
        [
                userSocioInstance              : userSocioInstance,
                historialMembresiasInstance    : historialMembresiasInstance,
                lastHistorialMembresiasInstance: (historialMembresiasInstance.size() > 0) ? historialMembresiasInstance.max {it.fechaFin} : null,
                huellaInstance                 : Huella.findByHuerut(Integer.toString(userSocioInstance?.rut)),
                condicionMedicaInstance        : userSocioInstance?.condicionMedica,
                profesionalInstance            : userSocioInstance.condicionMedica?.profesional,
                contactoEmergenciaInstance     : userSocioInstance?.contactoEmergencia
        ]
    }

    def edit() {
        def userSocioInstance = UserSocio.get(params.id)
        if (!userSocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), params.id])
            redirect(action: "list")
            return
        }
//        HistorialMembresias historialMembresiasInstance = new HistorialMembresias()
        def historialMembresiasInstance
        if (!userSocioInstance.historialMembresias.isEmpty()) {
            historialMembresiasInstance = userSocioInstance.historialMembresias
        }
        [userSocioInstance          : userSocioInstance, direccionUsuarioInstance: userSocioInstance.domicilio, contactoEmergenciaInstance: userSocioInstance.contactoEmergencia,
         condicionMedicaInstance    : userSocioInstance?.condicionMedica, profesionalInstance: userSocioInstance.condicionMedica?.profesional,
         empresaInstance            : userSocioInstance?.empresa, direccionEmpresaInstance: userSocioInstance.empresa?.direccionEmpresa,
         historialMembresiasInstance: historialMembresiasInstance?.last(), pagoInstance: historialMembresiasInstance?.last()?.pago/*, foto: userSocioInstance.foto*/]
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

        // Actualizamos
        userSocioInstance = userService.updateSocio(params, userSocioInstance)

        /* userSocioInstance.properties = params  */
        /*if (!userSocioInstance.save(flush: true)) {
             render(view: "edit", model: [userSocioInstance: userSocioInstance])
             return
         }*/

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), userSocioInstance.nombre + " " + userSocioInstance.apellidoPaterno])
        redirect(action: "show", id: userSocioInstance.id)
    }

    def refreshHorarios() {
        def List<Horario> horarioList = CursoEspecial.get(params?.cursoId)?.horario as List<Horario>
        horarioList.removeAll(UserSocio.get(params?.userId).horarios)

        render(template:"horario", model:[
                horariosInstanceCount: horarioList?.size(),
                horariosInstanceList: horarioList
        ])
    }

    def refreshInfoHorarios() {
        def Horario horarioInstance = Horario.get(params?.horarioId)

        render(template:"infoHorario", model:[
                horarioInstance: horarioInstance
        ])
    }

    @Secured(['permitAll'])
    def updatePassword() {
        def userSocioInstance = UserSocio.findByUsername(params.username)
        if (!userSocioInstance) {
            flash.message = 'Ha ocurrido un error, inicie sesión nuevamente'
            redirect(controller: 'login', action: 'auth')
            return
        }
        String password = params.password
        String newPassword = params.password_new
        String newPassword2 = params.password_new_2
        if (!password || !newPassword || !newPassword2 || newPassword != newPassword2) {
            flash.message = 'Por favor ingrese su contraseña actual y una contraseña nueva válida'
            render(view: 'cambiarPassword', model: [username: userSocioInstance?.username])
            return
        }

        if (!springSecurityService.passwordEncoder.isPasswordValid(userSocioInstance.password, password, null /*salt*/)) {
            flash.message = 'Contraseña actual ingresada es incorrecta'
            render(view: 'cambiarPassword', model: [username: userSocioInstance?.username])
            return
        }

        if (springSecurityService.passwordEncoder.isPasswordValid(userSocioInstance.password, newPassword, null /*salt*/)) {
            flash.message = 'Por favor ingrese una contraseña diferente a la actual'
            render(view: 'cambiarPassword', model: [username: userSocioInstance?.username])
            return
        }

        userSocioInstance.password = newPassword
        userSocioInstance.passwordExpired = false
        userSocioInstance.save() // if you have password constraints check them here

        if (params?.id){
            flash.message = 'Nuevas credenciales creadas exitosamente, por favor reinicie la sesión.'
            redirect(action: "show", id: params?.id)
        } else {
            flash.message = 'Nuevas credenciales creadas exitosamente, por favor inicie sesión.'
            redirect(controller: "login", action: "auth")
        }
    }

    def expirarPassword() {
        def userSocioInstance = UserSocio.get(params.id)
        if (!userSocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), params.id])
            redirect(action: "list")
            return
        }
        userSocioInstance.passwordExpired = true
        userSocioInstance.save() // if you have password constraints check them here

        flash.message = "Password expirado exitosamente."
        redirect(action: "show", id: userSocioInstance.id)
    }


    def image(params) {
        def file = params.foto
        session.removeAttribute 'file'

        response.setHeader('Cache-Control', 'no-cache')
        response.contentType = file.contentType
        response.outputStream << file.bytes
        response.outputStream.flush()
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
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), userSocioInstance.nombre+" "+userSocioInstance.apellidoPaterno+" "+userSocioInstance.apellidoMaterno+" (id "+userSocioInstance.id+")"])
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
        //render userService.buscadorSocio(params) as JSON
        def clist
        if(params.term.isNumber()){
            clist = User.executeQuery("select id, nombre, apellidoPaterno, apellidoMaterno, rut, dv from User where str(rut) like :elId", [elId: "%"+params.term+"%"])
        } else {
            def query = {
                or {
                    ilike("nombre", "${params.term}%") // term is the parameter send by jQuery autocomplete
                    ilike("apellidoPaterno", "${params.term}%")
                    ilike("apellidoMaterno", "${params.term}%")
//                if(params.term.isNumber()) like("rut", "${params.term}%")
                }
                projections { // good to select only the required columns.
                    property("id")
                    property("nombre")
                    property("apellidoPaterno")
                    property("apellidoMaterno")
                    property("rut")
                    property("dv")
                }
                order('nombre', 'asc')
                order('apellidoPaterno', 'asc')
                order('apellidoMaterno', 'asc')
            }
//            clist = UserSocio.createCriteria().list(query, sort: "nombre", order: "asc"){
            clist = UserSocio.createCriteria().list(query)
        }

        def userSocioSelectList = []
        clist.each {
//            System.out.println(it.toString())
            def userSocioMap = [:]
            userSocioMap.put("id", it[0])
//            userSocioMap.put("value", (it[1]+" "+it[2]+" "+it[3]))
            userSocioMap.put("label", (it[1]+" "+it[2]+" "+it[3]).replaceAll(/\w+/) { w -> w[0].toString().toUpperCase() + ((w.size()>1)?(w[1..-1].toString().toLowerCase()):"")})
//            userSocioMap.put("label", (it[1]+" "+it[2]+" "+it[3]+" - "+String.format("%,d", it[4])+"-"+it[5]).replaceAll(/\w+/) { w -> w[0].toString().toUpperCase() + ((w.size()>1)?(w[1..-1].toString().toLowerCase()):"")})
            userSocioSelectList.add(userSocioMap)
        }
        render (userSocioSelectList as JSON)
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

//        List<UserSocio> userSocioInstanceList = userService.getUsuariosFiltrados(params)

        def start2 = System.currentTimeMillis()

        List<UserSocio> userSocioInstanceList = User.executeQuery("from User where 'fechaNacimiento' like '%-03-18%'")

/*
        List<UserSocio> userSocioInstanceList = UserSocio.createCriteria().list(max: params?.max?:10, offset: params?.offset?:0) {
            if (params.usarFechas){

                Date fechaDesdeTemp = desde?.parse("dd-MM-yyyy", desde.date+"-"+desde.month+"-1900")
                Date fechaHastaTemp = hasta?.parse("dd-MM-yyyy", hasta.date+"-"+hasta.month+"-1900")
                Date fechaNacimientoTemp = userSocioInstance.fechaNacimiento?.parse("dd-MM-yyyy", userSocioInstance.fechaNacimiento.date + "-" + userSocioInstance.fechaNacimiento.month + "-1900")
                if ((fechaNacimientoTemp >= fechaDesdeTemp) && (fechaNacimientoTemp <= fechaHastaTemp)) {
                    userSocioInstanceListFechaNacimientoTemp.add("id": userSocioInstance.id, "fechaNacimientoTemp": fechaNacimientoTemp)
                }
                userSocioInstanceListFechaNacimientoTemp = (sort.equalsIgnoreCase("fechaNacimiento"))?userSocioInstanceListFechaNacimientoTemp.sort{it.fechaNacimientoTemp}:userSocioInstanceListFechaNacimientoTemp.sort{it."$sort"}

                for (userSocioInstance in userSocioInstanceListFechaNacimientoTemp) {
                    def usuarioInstance = UserSocio.get(userSocioInstance.id)
                    userSocioInstanceListTempRangoFechas.add(usuarioInstance)
                }
                userSocioInstanceList = userSocioInstanceListTempRangoFechas

                'between'('fechaNacimiento', desde, hasta)
            }
//            order(sort?:"id", order?:"asc")
            cache true
        }
*/
        println "Cumpleaños: ${System.currentTimeMillis() - start2} secs."

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
        [userSocioInstance: userSocioInstance, historialMembresiasInstance: lastHistorialMembresia, pagoInstance: lastPago, matriculaInstanceId: params.matriculaInstanceId, listPlanes: org.control.Plan.list()]
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

    @Secured(['permitAll'])
    def cambiarPassword() {
        def userSocioInstance = UserSocio.get(params.id)
        if (!userSocioInstance) {
            flash.message = "Contraseña expirada, por favor complete el formulario con credenciales nuevas."
        }

        [userSocioInstance: userSocioInstance]
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

        Pago pago = new Pago(params)
//        pago.fecha = new Date().parse("dd-MM-yyyy", params.fecha)
        if (!pago.validate()){
            flash.message = pago.errors.fieldErrors.toString()
            redirect(action: "renovarPlan", params: [id: params.id, matriculaInstanceId: params.matriculaInstanceId])
            return
        }

        //        Guardamos y mandamos el mail de comprobación
        def result = userService.saveHistorialMembresias(params, userSocioInstance)
        if (result){
            flash.message = result
            redirect(action: "show", id: userSocioInstance.id)
        } else {
            utilService.enviarMail(Configuracion.findByNombre("emailNotificacionesPagos")?.valor, "Nueva "+((userSocioInstance.historialMembresias.size() > 0)?"Renovación":"Membresía"),
                    "Un usuario ha pagado, los datos son los siguientes:\n " +
                            "\nUsuario: "         + userSocioInstance +
                            "\nFecha: "           + new Date().format("dd-MM-yyyy HH:mm") +
                            "\nPlan: "            + Plan.get(params.plan?.id) +
                            "\nMonto Matrícula: " + String.format("\$%,d", Long.valueOf((Matricula.get(params.matricula?.id).pagoMatricula)?(Matricula.get(params.matricula.id).pagoMatricula.monto?:0):0)) +
                            "\nMonto Plan: "      + String.format("\$%,d", Long.valueOf(params.monto?:0)) +
                            "\nMedio de Pago: "   + (MedioPago.get(params.medioDePago?.id)?:"") +
                            "\nN° de Boleta: "    + String.valueOf(params.numeroDeBoleta?:"") +
                            "\nOperador: "        + (UserPersonal.get(params.autorizadoPor?.id)?:"") +
                            "\n" +
                            "\nEmail generado automaticamente, no responder."
            )
            flash.message = message(code: 'default.updated.message', args: [message(code: 'userSocio.label', default: 'UserSocio'), userSocioInstance.id])
            redirect(action: "show", id: userSocioInstance.id)
        }
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
        flash.message = userService.cambiaEstadoAuto()
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
            UserSocio userSocioInstance = UserSocio.findById(Long.valueOf(String.valueOf(it).replace(".","")))
            cont = userService.ejecutaCambioEstado(userSocioInstance, fechaDeOperacion, userSocioInstance.estadoMembresia, estadoMembresiaInstance, modalidad, cont)
        }

        flash.message = cont + " registros modificados como " +estadoMembresiaInstance.estado
        redirect(action: "listCambiarEstadoBatch")
    }

    def aMailsBatch() {
        forward(controller: "email", action: "mailsBatch")
    }

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
        params.operationTime = operationTime.format('dd-MM-yyyy HH:mm:ss')
        params.importante = ""
        /*params.importante = "IMPORTANTE:\n"+
                            "Estimado Usuario de SPA; Le informamos que nuestro Centro cerrará sus puertas entre el 15 y 28 de Febrero 2015 por vacaciones y mantención del local, período que se bonificará en su plan."*/
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
        params.operationTime = operationTime.format('dd-MM-yyyy HH:mm:ss')
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


    def matricularUsuario() {
        def userSocioInstance = UserSocio.get(params?.userId)
        if (!userSocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horario.label', default: 'Horario'), params.id])
            redirect(action: "list")
            return
        }

        userSocioInstance.addToHorarios(Horario.get(params.horario.id))

        if (!userSocioInstance.save(flush: true, failOnError: true)) {
            redirect(controller: 'userSocio', action: "show", id: userSocioInstance.id)
            return
        }

        flash.message = "Inscripción realizada exitósamente"
//        render(template: '/userSocio/cursos', model: [userSocioInstance: userSocioInstance])
        redirect(action: "show", id: userSocioInstance.id)
//        [userSocioInstance: userSocioInstance]
    }
}
