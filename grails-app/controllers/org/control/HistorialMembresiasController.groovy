package org.control

import org.control.HistorialMembresias
import org.springframework.dao.DataIntegrityViolationException
import org.grails.plugin.filterpane.FilterPaneUtils

import java.text.SimpleDateFormat


class HistorialMembresiasController {
    def filterPaneService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [historialMembresiasInstanceList: HistorialMembresias.list(params), historialMembresiasInstanceTotal: HistorialMembresias.count()]
    }

    def filter = {
        if(!params.max) params.max = 10
        render( view:'list',
                model:[ historialMembresiasInstanceList: filterPaneService.filter( params, HistorialMembresias ),
                        historialMembresiasInstanceTotal: filterPaneService.count( params, HistorialMembresias ),
                        filterParams: FilterPaneUtils.extractFilterParams(params),
                        params:params ] )
    }

    def create() {
        [historialMembresiasInstance: new HistorialMembresias(params)]
    }

    def save() {
        def historialMembresiasInstance = new HistorialMembresias(params)
        if (!historialMembresiasInstance.save(flush: true)) {
            render(view: "create", model: [historialMembresiasInstance: historialMembresiasInstance])
            return
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'historialMembresias.label', default: 'HistorialMembresias'), historialMembresiasInstance.id])
        redirect(action: "show", id: historialMembresiasInstance.id)
    }

    def show(Long id) {
        def historialMembresiasInstance = HistorialMembresias.get(id)
        if (!historialMembresiasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'historialMembresias.label', default: 'HistorialMembresias'), id])
            redirect(action: "list")
            return
        }
        if (historialMembresiasInstance.matriculaId == 0) historialMembresiasInstance.matricula= null
        [historialMembresiasInstance: historialMembresiasInstance]
    }

    def edit(Long id) {
        def historialMembresiasInstance = HistorialMembresias.get(id)
        if (!historialMembresiasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'historialMembresias.label', default: 'HistorialMembresias'), id])
            redirect(action: "list")
            return
        }

        [historialMembresiasInstance: historialMembresiasInstance]
    }

    def update(Long id, Long version) {
        def historialMembresiasInstance = HistorialMembresias.get(id)
        if (!historialMembresiasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'historialMembresias.label', default: 'HistorialMembresias'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (historialMembresiasInstance.version > version) {
                historialMembresiasInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'historialMembresias.label', default: 'HistorialMembresias')] as Object[],
                        "Another user has updated this HistorialMembresias while you were editing")
                render(view: "edit", model: [historialMembresiasInstance: historialMembresiasInstance])
                return
            }
        }

        historialMembresiasInstance.properties = params
        if (!historialMembresiasInstance.save(flush: true)) {
            render(view: "edit", model: [historialMembresiasInstance: historialMembresiasInstance])
            return
        }
        flash.message = message(code: 'default.updated.message', args: [message(code: 'historialMembresias.label', default: 'HistorialMembresias'), historialMembresiasInstance.id])
        redirect(action: "show", id: historialMembresiasInstance.id)
    }

    def delete(Long id) {
        def historialMembresiasInstance = HistorialMembresias.get(id)
        if (!historialMembresiasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'historialMembresias.label', default: 'HistorialMembresias'), id])
            redirect(action: "list")
            return
        }

        try {
            historialMembresiasInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'historialMembresias.label', default: 'HistorialMembresias'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'historialMembresias.label', default: 'HistorialMembresias'), id])
            redirect(action: "show", id: id)
        }
    }

    def refreshDiasCongelacion() {
        render(template: "/historialMembresias/diasCongelacion", model: [
                diasCongelacion: Plan.get(params?.plan.id)?.diasCongelacion?:0
        ])
    }

    def refreshDiasMembresia() {
        render(template: "/historialMembresias/diasMembresia", model: [
                diasMembresia: Plan.get(params?.plan.id)?.diasMembresia?:0
        ])
    }

    def refreshFechaFin() {
        Date fechaInicio = (new SimpleDateFormat("dd-MM-yyyy")).parse(params?.fechaInicio)
        render(template: "/historialMembresias/fechaFin", model: [
                fechaFin: fechaInicio.plus(Integer.valueOf(String.valueOf(Plan.get(params?.plan.id)?.diasMembresia?:0)))
        ])
    }

}
