package org.gym

import org.gym.fichaMedica.CondicionMedica
import org.gym.fichaMedica.FichaMedica
import org.gym.fichaMedica.Profesional
import org.springframework.dao.DataIntegrityViolationException
import org.gym.UserService

/**
 * UserPersonalController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class UserPersonalController {
    def userService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userPersonalInstanceList: UserPersonal.list(params), userPersonalInstanceTotal: UserPersonal.count()]
    }

    def create() {
        [userPersonalInstance: new UserPersonal(params),
                direccionUsuarioInstance: new DireccionUsuario(params),
                contactoEmergenciaInstance: new ContactoEmergencia(params),
                condicionMedicaInstance: new CondicionMedica(params)]
    }

    def save() {
        def userPersonalInstance = new UserPersonal(params)

//        Guardamos y mandamos el mail de comprobación
        userPersonalInstance = userService.savePersonal(params, userPersonalInstance)

        flash.message = message(code: 'default.created.message', args: [message(code: 'userPersonal.label', default: 'UserPersonal'), userPersonalInstance.id])
        redirect(action: "show", id: userPersonalInstance.id)
    }

    def show() {
        def userPersonalInstance = UserPersonal.get(params.id)
        if (!userPersonalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userPersonal.label', default: 'UserPersonal'), params.id])
            redirect(action: "list")
            return
        }

        [userPersonalInstance: userPersonalInstance]
    }

    def edit() {
        def userPersonalInstance = UserPersonal.get(params.id)
        if (!userPersonalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userPersonal.label', default: 'UserPersonal'), params.id])
            redirect(action: "list")
            return
        }

        [userPersonalInstance: userPersonalInstance,
                direccionUsuarioInstance: userPersonalInstance?.domicilio,
                contactoEmergenciaInstance: userPersonalInstance?.contactoEmergencia,
                condicionMedicaInstance: userPersonalInstance?.condicionMedica,
                profesionalInstance: userPersonalInstance.condicionMedica?.profesional ]

    }

    def update() {
        def userPersonalInstance = UserPersonal.get(params.id)
        if (!userPersonalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userPersonal.label', default: 'UserPersonal'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userPersonalInstance.version > version) {
                userPersonalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'userPersonal.label', default: 'UserPersonal')] as Object[],
                        "Another user has updated this UserPersonal while you were editing")
                render(view: "edit", model: [userPersonalInstance: userPersonalInstance])
                return
            }
        }

//        userPersonalInstance.properties = params

        /*// Finalmente, actualizamos al usuario
        if (!userPersonalInstance.save(flush: true)) {
            render(view: "edit", model: [userPersonalInstance: userPersonalInstance])
            return
        }*/

        // Actualizamos
        userPersonalInstance = userService.updatePersonal(params, userPersonalInstance)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userPersonal.label', default: 'UserPersonal'), userPersonalInstance.id])
        redirect(action: "show", id: userPersonalInstance.id)
    }

    def delete() {
        def userPersonalInstance = UserPersonal.get(params.id)
        if (!userPersonalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userPersonal.label', default: 'UserPersonal'), params.id])
            redirect(action: "list")
            return
        }

        try {
            userPersonalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userPersonal.label', default: 'UserPersonal'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userPersonal.label', default: 'UserPersonal'), params.id])
            redirect(action: "show", id: params.id)
        }

        /// TODO: Eliminar condicion_medica, contacto_emergencia, profesional
      /*  def condicionMedicaInstance = CondicionMedica.findBy(params.id)
        try {
            userPersonalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userPersonal.label', default: 'UserPersonal'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userPersonal.label', default: 'UserPersonal'), params.id])
            redirect(action: "show", id: params.id)
        }*/




    }

}
