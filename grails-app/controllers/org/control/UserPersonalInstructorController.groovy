package org.control

import org.control.CargoInterno
import org.control.UserPersonalInstructor
import org.control.fichaMedica.CondicionMedica
import org.control.fichaMedica.Profesional
import org.springframework.dao.DataIntegrityViolationException

/**
 * UserPersonalInstructorController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class UserPersonalInstructorController {
    def userService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userPersonalInstructorInstanceList: UserPersonalInstructor.list(params), userPersonalInstructorInstanceTotal: UserPersonalInstructor.count()]
    }

    def create() {
        def userPersonalInstructorInstance = new UserPersonalInstructor(params)
        userPersonalInstructorInstance.cargo = CargoInterno.findByNombreCargo("Instructor")
        [userPersonalInstructorInstance: userPersonalInstructorInstance]
    }

    def save() {
        def userPersonalInstructorInstance = new UserPersonalInstructor(params)

        //        Guardamos y mandamos el mail de comprobación
        userPersonalInstructorInstance = userService.saveInstructor(params, userPersonalInstructorInstance)

        flash.message = message(code: 'default.created.message', args: [message(code: 'userPersonalInstructor.label', default: 'UserPersonalInstructor'), userPersonalInstructorInstance.id])
        redirect(action: "show", id: userPersonalInstructorInstance.id)
    }

    def show() {
        def userPersonalInstructorInstance = UserPersonalInstructor.get(params.id)
        if (!userPersonalInstructorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userPersonalInstructor.label', default: 'UserPersonalInstructor'), params.id])
            redirect(action: "list")
            return
        }

        [userPersonalInstructorInstance: userPersonalInstructorInstance]
    }

    def edit() {
        def userPersonalInstructorInstance = UserPersonalInstructor.get(params.id)
        if (!userPersonalInstructorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userPersonalInstructor.label', default: 'UserPersonalInstructor'), params.id])
            redirect(action: "list")
            return
        }

        [userPersonalInstructorInstance: userPersonalInstructorInstance,
                direccionUsuarioInstance: userPersonalInstructorInstance.domicilio,
                contactoEmergenciaInstance: userPersonalInstructorInstance.contactoEmergencia,
                condicionMedicaInstance: userPersonalInstructorInstance.condicionMedica,
                profesionalInstance: userPersonalInstructorInstance.condicionMedica.profesional ]

    }

    def update() {
        def userPersonalInstructorInstance = UserPersonalInstructor.get(params.id)
        if (!userPersonalInstructorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userPersonalInstructor.label', default: 'UserPersonalInstructor'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userPersonalInstructorInstance.version > version) {
                userPersonalInstructorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'userPersonalInstructor.label', default: 'UserPersonalInstructor')] as Object[],
                        "Another user has updated this UserPersonalInstructor while you were editing")
                render(view: "edit", model: [userPersonalInstructorInstance: userPersonalInstructorInstance])
                return
            }
        }


        /*if (!userPersonalInstructorInstance.save(flush: true)) {
            render(view: "edit", model: [userPersonalInstructorInstance: userPersonalInstructorInstance])
            return
        }*/

        //        Actualizamos
        userPersonalInstructorInstance = userService.updateInstructor(params, userPersonalInstructorInstance)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userPersonalInstructor.label', default: 'UserPersonalInstructor'), userPersonalInstructorInstance.id])
        redirect(action: "show", id: userPersonalInstructorInstance.id)
    }

    def delete() {
        def userPersonalInstructorInstance = UserPersonalInstructor.get(params.id)
        if (!userPersonalInstructorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userPersonalInstructor.label', default: 'UserPersonalInstructor'), params.id])
            redirect(action: "list")
            return
        }

        try {
            userPersonalInstructorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userPersonalInstructor.label', default: 'UserPersonalInstructor'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userPersonalInstructor.label', default: 'UserPersonalInstructor'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
