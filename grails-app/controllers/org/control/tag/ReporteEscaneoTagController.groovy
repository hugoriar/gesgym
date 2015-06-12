package org.control.tag

import org.control.tag.ReporteEscaneoTag
import org.springframework.dao.DataIntegrityViolationException

/**
 * ReporteEscaneoTagController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ReporteEscaneoTagController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [reporteEscaneoTagInstanceList: ReporteEscaneoTag.list(params), reporteEscaneoTagInstanceTotal: ReporteEscaneoTag.count()]
    }

    def create() {
        [reporteEscaneoTagInstance: new ReporteEscaneoTag(params)]
    }

    def save() {
        def reporteEscaneoTagInstance = new ReporteEscaneoTag(params)
        if (!reporteEscaneoTagInstance.save(flush: true)) {
            render(view: "create", model: [reporteEscaneoTagInstance: reporteEscaneoTagInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'reporteEscaneoTag.label', default: 'ReporteEscaneoTag'), reporteEscaneoTagInstance.id])
        redirect(action: "show", id: reporteEscaneoTagInstance.id)
    }

    def show() {
        def reporteEscaneoTagInstance = ReporteEscaneoTag.get(params.id)
        if (!reporteEscaneoTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reporteEscaneoTag.label', default: 'ReporteEscaneoTag'), params.id])
            redirect(action: "list")
            return
        }

        [reporteEscaneoTagInstance: reporteEscaneoTagInstance]
    }

    def edit() {
        def reporteEscaneoTagInstance = ReporteEscaneoTag.get(params.id)
        if (!reporteEscaneoTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reporteEscaneoTag.label', default: 'ReporteEscaneoTag'), params.id])
            redirect(action: "list")
            return
        }

        [reporteEscaneoTagInstance: reporteEscaneoTagInstance]
    }

    def update() {
        def reporteEscaneoTagInstance = ReporteEscaneoTag.get(params.id)
        if (!reporteEscaneoTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reporteEscaneoTag.label', default: 'ReporteEscaneoTag'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (reporteEscaneoTagInstance.version > version) {
                reporteEscaneoTagInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'reporteEscaneoTag.label', default: 'ReporteEscaneoTag')] as Object[],
                        "Another user has updated this ReporteEscaneoTag while you were editing")
                render(view: "edit", model: [reporteEscaneoTagInstance: reporteEscaneoTagInstance])
                return
            }
        }

        reporteEscaneoTagInstance.properties = params

        if (!reporteEscaneoTagInstance.save(flush: true)) {
            render(view: "edit", model: [reporteEscaneoTagInstance: reporteEscaneoTagInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'reporteEscaneoTag.label', default: 'ReporteEscaneoTag'), reporteEscaneoTagInstance.id])
        redirect(action: "show", id: reporteEscaneoTagInstance.id)
    }

    def delete() {
        def reporteEscaneoTagInstance = ReporteEscaneoTag.get(params.id)
        if (!reporteEscaneoTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reporteEscaneoTag.label', default: 'ReporteEscaneoTag'), params.id])
            redirect(action: "list")
            return
        }

        try {
            reporteEscaneoTagInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'reporteEscaneoTag.label', default: 'ReporteEscaneoTag'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reporteEscaneoTag.label', default: 'ReporteEscaneoTag'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
