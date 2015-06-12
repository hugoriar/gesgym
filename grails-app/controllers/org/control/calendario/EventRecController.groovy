package org.control.calendario

import org.control.CursoEspecial
import org.joda.time.DateTime
import org.joda.time.DateTimeConstants
import org.joda.time.LocalDate
import org.joda.time.Seconds
import org.springframework.dao.DataIntegrityViolationException

/**
 * EventRecController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class EventRecController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [eventRecInstanceList: EventRec.list(params), eventRecInstanceTotal: EventRec.count()]
    }

    def create() {
        [eventRecInstance: new EventRec(params), cursoEspecialInstance: CursoEspecial.get(params?.horarioInstanceCursoId), horarioInstance: Horario.get(params?.horarioId), listDiasSemana: new ArrayList<String>(['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'])]
//        [eventRecInstance: new EventRec(params), cursoEspecialInstance: CursoEspecial.get(params.id), horarioInstance: Horario.get(params.horarioId), listDiasSemana: new ArrayList<String>(['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'])]
    }

    def save() {
        def eventRecInstance = new EventRec(params)
        LocalDate now = new LocalDate();
        def listDiasSemana= new ArrayList<String>(['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'])

        eventRecInstance.setDayOfWeek(listDiasSemana.indexOf(params?.diaSemana.id)+1)
        Date startDate = now.withDayOfMonth(1).withDayOfWeek(listDiasSemana.indexOf(params?.diaSemana.id)+1).toDate()
        startDate.setHours(params.horasDesde?.id as int)
        startDate.setMinutes(params.minutosDesde?.id as int)
        eventRecInstance.setStart_date(startDate)

        Date endDate = new Date(8099, 1, 1, params.horasHasta?.id as int, params.minutosHasta?.id as int, 0)
        eventRecInstance.setEnd_date(endDate)

        DateTime desde = new DateTime(startDate.year, startDate.month, startDate.day+1, startDate.hours, startDate.minutes)
        DateTime hasta = new DateTime(startDate.year, startDate.month, startDate.day+1, endDate.hours, endDate.minutes)
        eventRecInstance.event_length = Seconds.secondsBetween(desde, hasta).getSeconds();

        eventRecInstance.horario = Horario.get(params?.horarioInstanceId)
        eventRecInstance.rec_type = "week_1___${listDiasSemana.indexOf(params?.diaSemana.id)+1}#no"
        if (!eventRecInstance.save(flush: true)) {
            render(view: "create", model: [eventRecInstance: eventRecInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'eventRec.label', default: 'EventRec'), eventRecInstance.id])
        redirect(controller: 'horario', action: "show", id: params?.horarioInstanceId)
//        redirect(controller: 'cursoEspecial', action: "show", id: params?.cursoEspecialInstanceId)
//        redirect(action: "show", id: eventRecInstance.id)
    }

    def show() {
        def eventRecInstance = EventRec.get(params.id)
        if (!eventRecInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventRec.label', default: 'EventRec'), params.id])
            redirect(action: "list")
            return
        }

        [eventRecInstance: eventRecInstance]
    }

    def edit() {
        def eventRecInstance = EventRec.get(params.id)
        if (!eventRecInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventRec.label', default: 'EventRec'), params.id])
            redirect(action: "list")
            return
        }

        [eventRecInstance: eventRecInstance]
    }

    def update() {
        def eventRecInstance = EventRec.get(params.id)
        if (!eventRecInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventRec.label', default: 'EventRec'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (eventRecInstance.version > version) {
                eventRecInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'eventRec.label', default: 'EventRec')] as Object[],
                        "Another user has updated this EventRec while you were editing")
                render(view: "edit", model: [eventRecInstance: eventRecInstance])
                return
            }
        }

        eventRecInstance.properties = params

        if (!eventRecInstance.save(flush: true)) {
            render(view: "edit", model: [eventRecInstance: eventRecInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'eventRec.label', default: 'EventRec'), eventRecInstance.id])
        redirect(action: "show", id: eventRecInstance.id)
    }

    def delete() {
        def eventRecInstance = EventRec.get(params.id)
        if (!eventRecInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventRec.label', default: 'EventRec'), params.id])
            redirect(action: "list")
            return
        }

        try {
            eventRecInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'eventRec.label', default: 'EventRec'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'eventRec.label', default: 'EventRec'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
