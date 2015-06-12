package org.control

import org.control.UserSocio
import org.control.Visita
import org.joda.time.DateTime
import org.springframework.dao.DataIntegrityViolationException
import java.text.SimpleDateFormat

/**
 * VisitaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class VisitaController {
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm")
    def exportService
    def grailsApplication
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        if (!params.order) {
            params.sort = "fechaDeVisita"
            params.order = "desc"
        }
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        /*if (Boolean.valueOf(params?.inicioDeSemana)){
            Calendar c = Calendar.getInstance()
            c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY)
            params.desde = c.getTime().format("dd-MM-yyyy")
        }*/

        Date desde          = params.desde ? (sdf.parse(params.desde?.toString())) : new DateTime().withTimeAtStartOfDay().toDate()
        Date hasta          = params.hasta ? (sdf.parse(params.hasta?.toString())) : new DateTime().plusDays(1).withTimeAtStartOfDay().minusMinutes(1).toDate()/*
        Date desde          = params.desde?(new SimpleDateFormat("dd-MM-yyyy").parse(params.desde?.toString())):(new Date())
        Date hasta          = params.hasta?(new SimpleDateFormat("dd-MM-yyyy").parse(params.hasta?.toString())):(new Date())*/
        String sort         = params?.sort?:"fechaDeVisita"

        def visitaInstanceList = Visita.findAllByFechaDeVisitaGreaterThanEqualsAndFechaDeVisitaLessThanEquals(desde, hasta)sort{it."$sort"}
        visitaInstanceList = params.order?.equalsIgnoreCase("asc")?visitaInstanceList:visitaInstanceList.reverse()

        if(params?.format && params.format != "html"){
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            String tituloPDF
            if (desde.compareTo(hasta)){
                response.setHeader("Content-disposition", "inline; filename=Visitas_${new SimpleDateFormat('dd-MM-yy').format(desde)}_al_${new SimpleDateFormat('dd-MM-yy').format(hasta)}.${params.extension}") //attachment
                tituloPDF = "Reporte de Visitas entre el "+new SimpleDateFormat('EEEE dd-MM-yy').format(desde)+" y el "+new SimpleDateFormat('EEEE dd-MM-yy').format(hasta)
            } else {
                response.setHeader("Content-disposition", "inline; filename=Visitas_${new SimpleDateFormat('dd-MM-yy').format(desde)}.${params.extension}")
                tituloPDF = "Reporte de Visitas día "+new SimpleDateFormat('EEEE dd-MM-yy').format(desde)
            }

            List fields = ["usuario","fechaDeVisita","horaDeEntrada"]
            Map labels = ["usuario": "Usuario", "fechaDeVisita": "Fecha De Visita", "horaDeEntrada": "Hora De Entrada"]

            // Formatter closure
            def upperCase = { domain, value ->
                return value.nombre.toUpperCase()
            }

            def aFecha = { domain, value ->
                def fecha = (new SimpleDateFormat('EEEE dd-MM-yy').format(value)).toString()
                return new String(fecha.toString().substring(0,1).toUpperCase() + fecha.toString().substring(1));
            }

            def aHora = { domain, value ->
                return new SimpleDateFormat('HH:mm').format(value)
            }

            Map formatters = [/*usuario: upperCase, */fechaDeVisita: aFecha, horaDeEntrada: aHora]
            Map parameters = [title: tituloPDF, "pdf.orientation": "portrait"]

            exportService.export(params.format, response.outputStream, visitaInstanceList, fields, labels, formatters, parameters)
        }

        [
            visitaInstanceList: visitaInstanceList,
            visitaInstanceTotal: visitaInstanceList.size(),

//            desde: params.desde?(new SimpleDateFormat("dd-MM-yyyy").parse(params.desde?.toString())):(new Date()),
//            hasta: params.hasta?(new SimpleDateFormat("dd-MM-yyyy").parse(params.hasta?.toString())):(new Date().plus(0))
            periodo: params?.periodo,
            desde: params.desde?(sdf.format(desde)):sdf.format((new Date())),
            hasta: params.hasta?(sdf.format(hasta)):sdf.format((new Date().plus(0)))

//            desde: sdf.format(params?.desde),
//            hasta: sdf.format(params?.hasta),
        ]
    }

    def listUsuarios() {
        log.debug "Listando usuarios"

        if (!params.order) {
            params.sort = "id"
            params.order = "desc"
        }

        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userSocioInstanceList: UserSocio.list(params), userSocioInstanceTotal: UserSocio.count()]
    }

    /* def list() {
        if (!params.order) {
            params.sort = "fechaDeVisita"
            params.order = "desc"
        }
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [visitaInstanceList: Visita.list(params), visitaInstanceTotal: Visita.count()]
    }*/

    def create() {
        [visitaInstance: new Visita(params)]
    }

    def save() {
        def visitaInstance = new Visita(params)
        if (!visitaInstance.save(flush: true)) {
            render(view: "create", model: [visitaInstance: visitaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'visita.label', default: 'Visita'), visitaInstance.id])
        redirect(action: "show", id: visitaInstance.id)
    }

    def show() {
        def visitaInstance = Visita.get(params.id)
        if (!visitaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'visita.label', default: 'Visita'), params.id])
            redirect(action: "list")
            return
        }

        [visitaInstance: visitaInstance]
    }

    def edit() {
        def visitaInstance = Visita.get(params.id)
        if (!visitaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'visita.label', default: 'Visita'), params.id])
            redirect(action: "list")
            return
        }

        [visitaInstance: visitaInstance]
    }

    def update() {
        def visitaInstance = Visita.get(params.id)
        if (!visitaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'visita.label', default: 'Visita'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (visitaInstance.version > version) {
                visitaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'visita.label', default: 'Visita')] as Object[],
                        "Another user has updated this Visita while you were editing")
                render(view: "edit", model: [visitaInstance: visitaInstance])
                return
            }
        }

        visitaInstance.properties = params

        if (!visitaInstance.save(flush: true)) {
            render(view: "edit", model: [visitaInstance: visitaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'visita.label', default: 'Visita'), visitaInstance.id])
        redirect(action: "show", id: visitaInstance.id)
    }

    def delete() {
        def visitaInstance = Visita.get(params.id)
        if (!visitaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'visita.label', default: 'Visita'), params.id])
            redirect(action: "list")
            return
        }

        try {
            visitaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'visita.label', default: 'Visita'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'visita.label', default: 'Visita'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
