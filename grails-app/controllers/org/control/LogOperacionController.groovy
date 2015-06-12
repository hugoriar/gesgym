package org.control

import org.springframework.dao.DataIntegrityViolationException

import java.text.SimpleDateFormat

/**
 * LogOperacionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class LogOperacionController {
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm")
    def logOperacionService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [logOperacionInstanceList: LogOperacion.list(params), logOperacionInstanceTotal: LogOperacion.count()]
    }

    def create() {
        [logOperacionInstance: new LogOperacion(params)]
    }

    def save() {
        def logOperacionInstance = new LogOperacion(params)
        if (!logOperacionInstance.save(flush: true)) {
            render(view: "create", model: [logOperacionInstance: logOperacionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'logOperacion.label', default: 'LogOperacion'), logOperacionInstance.id])
        redirect(action: "show", id: logOperacionInstance.id)
    }

    def show() {
        def logOperacionInstance = LogOperacion.get(params.id)
        if (!logOperacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logOperacion.label', default: 'LogOperacion'), params.id])
            redirect(action: "list")
            return
        }

        [logOperacionInstance: logOperacionInstance]
    }

    def edit() {
        def logOperacionInstance = LogOperacion.get(params.id)
        if (!logOperacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logOperacion.label', default: 'LogOperacion'), params.id])
            redirect(action: "list")
            return
        }

        [logOperacionInstance: logOperacionInstance]
    }

    def update() {
        def logOperacionInstance = LogOperacion.get(params.id)
        if (!logOperacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logOperacion.label', default: 'LogOperacion'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (logOperacionInstance.version > version) {
                logOperacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'logOperacion.label', default: 'LogOperacion')] as Object[],
                        "Another user has updated this LogOperacion while you were editing")
                render(view: "edit", model: [logOperacionInstance: logOperacionInstance])
                return
            }
        }

        logOperacionInstance.properties = params

        if (!logOperacionInstance.save(flush: true)) {
            render(view: "edit", model: [logOperacionInstance: logOperacionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'logOperacion.label', default: 'LogOperacion'), logOperacionInstance.id])
        redirect(action: "show", id: logOperacionInstance.id)
    }

    def delete() {
        def logOperacionInstance = LogOperacion.get(params.id)
        if (!logOperacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logOperacion.label', default: 'LogOperacion'), params.id])
            redirect(action: "list")
            return
        }

        try {
            logOperacionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'logOperacion.label', default: 'LogOperacion'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'logOperacion.label', default: 'LogOperacion'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def buscador() {
        log.debug "Listando logoperaciones"

        def result = logOperacionService.busca(params)

        render(view: "buscador",
                model: [
                        userSocioInstance           : params?.userSocioInstance,
                        userSocioInstanceId         : params?.userSocioInstanceId,
                        logTipoOperacionInstanceId  : params?.logTipoOperacionInstanceId,
                        autorizadoPorId             : params?.autorizadoPorId,
                        logEntidadInstanceId        : params?.logEntidadInstanceId,
                        logAtributoInstanceId       : params?.logAtributoInstanceId,
                        logOperacionesInstanceList  : result.logOperacionesInstanceList,

                        observaciones      : params?.observaciones,
                        usarFechas         : params?.usarFechas,
                        sort               : params?.sort,
                        order              : params?.order,
                        max                : params?.max,
                        periodo            : params?.periodo,
                        desde              : sdf.format(params?.desde),
                        hasta              : sdf.format(params?.hasta)
                ])
    }
}
