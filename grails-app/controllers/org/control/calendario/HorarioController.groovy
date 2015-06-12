package org.control.calendario

import org.control.CursoEspecial
import org.control.UserSocio
import org.springframework.dao.DataIntegrityViolationException

/**
 * HorarioController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class HorarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [horarioInstanceList: Horario.list(params), horarioInstanceTotal: Horario.count()]
    }

    def create() {
        [horarioInstance: new Horario(params), cursoEspecialInstance: CursoEspecial.get(params.id)]
    }

    def save() {
        def horarioInstance = new Horario(params)
        horarioInstance.curso = CursoEspecial.get(params.curso?.id)
        if (!horarioInstance.save(flush: true)) {
            render(view: "create", model: [horarioInstance: horarioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'horario.label', default: 'Horario'), horarioInstance.id])
        redirect(controller: "cursoEspecial", action: "show", id: horarioInstance.curso?.id)
    }

    def show() {
        def horarioInstance = Horario.get(params.id)
        if (!horarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horario.label', default: 'Horario'), params.id])
            redirect(action: "list")
            return
        }

        [horarioInstance: horarioInstance, usuariosInstanceList: UserSocio.findAll ("from UserSocio where ? in elements(horarios)", [horarioInstance])]
    }

    def edit() {
        def horarioInstance = Horario.get(params.id)
        if (!horarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horario.label', default: 'Horario'), params.id])
            redirect(action: "list")
            return
        }

        [horarioInstance: horarioInstance]
    }

    def update() {
        def horarioInstance = Horario.get(params.id)
        if (!horarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horario.label', default: 'Horario'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (horarioInstance.version > version) {
                horarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'horario.label', default: 'Horario')] as Object[],
                        "Another user has updated this Horario while you were editing")
                render(view: "edit", model: [horarioInstance: horarioInstance])
                return
            }
        }

        horarioInstance.properties = params

        if (!horarioInstance.save(flush: true)) {
            render(view: "edit", model: [horarioInstance: horarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'horario.label', default: 'Horario'), horarioInstance.id])
        redirect(action: "show", id: horarioInstance.id)
    }

    def delete() {
        def horarioInstance = Horario.get(params.id)
        if (!horarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horario.label', default: 'Horario'), params.id])
            redirect(action: "list")
            return
        }

        try {
            horarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'horario.label', default: 'Horario'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'horario.label', default: 'Horario'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

}
