package org.control

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

/**
 * ConfiguracionBytesController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ConfiguracionBytesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [configuracionBytesInstanceList: ConfiguracionBytes.list(params), configuracionBytesInstanceTotal: ConfiguracionBytes.count()]
    }

    def create() {
        [configuracionBytesInstance: new ConfiguracionBytes(params)]
    }

    def save() {
        def configuracionBytesInstance = new ConfiguracionBytes(params)
        if (!configuracionBytesInstance.save(flush: true)) {
            render(view: "create", model: [configuracionBytesInstance: configuracionBytesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'configuracionBytes.label', default: 'ConfiguracionBytes'), configuracionBytesInstance.id])
        redirect(action: "show", id: configuracionBytesInstance.id)
    }

    def show() {
        def configuracionBytesInstance = ConfiguracionBytes.get(params.id)
        if (!configuracionBytesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracionBytes.label', default: 'ConfiguracionBytes'), params.id])
            redirect(action: "list")
            return
        }

        [configuracionBytesInstance: configuracionBytesInstance]
    }

    def edit() {
        def configuracionBytesInstance = ConfiguracionBytes.get(params.id)
        if (!configuracionBytesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracionBytes.label', default: 'ConfiguracionBytes'), params.id])
            redirect(action: "list")
            return
        }

        [configuracionBytesInstance: configuracionBytesInstance]
    }

    def update() {
        def configuracionBytesInstance = ConfiguracionBytes.get(params.id)
        if (!configuracionBytesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracionBytes.label', default: 'ConfiguracionBytes'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (configuracionBytesInstance.version > version) {
                configuracionBytesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'configuracionBytes.label', default: 'ConfiguracionBytes')] as Object[],
                        "Another user has updated this ConfiguracionBytes while you were editing")
                render(view: "edit", model: [configuracionBytesInstance: configuracionBytesInstance])
                return
            }
        }

        configuracionBytesInstance.properties = params

        if (!configuracionBytesInstance.save(flush: true)) {
            render(view: "edit", model: [configuracionBytesInstance: configuracionBytesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'configuracionBytes.label', default: 'ConfiguracionBytes'), configuracionBytesInstance.id])
        redirect(action: "show", id: configuracionBytesInstance.id)
    }

    def delete() {
        def configuracionBytesInstance = ConfiguracionBytes.get(params.id)
        if (!configuracionBytesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracionBytes.label', default: 'ConfiguracionBytes'), params.id])
            redirect(action: "list")
            return
        }

        try {
            configuracionBytesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'configuracionBytes.label', default: 'ConfiguracionBytes'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'configuracionBytes.label', default: 'ConfiguracionBytes'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    @Secured(['permitAll'])
    def avatar_image = {
        def avatarUser = ConfiguracionBytes.findByNombre(params.id as String, [cache: true])
        if (!avatarUser || !avatarUser.valor/* || !avatarUser.avatarType*/) {
            response.sendError(404)
            return;
        }
//        response.setContentType(avatarUser.avatarType)
        response.setContentLength(avatarUser.valor.size())
        OutputStream out = response.getOutputStream();
        out.write(avatarUser.valor);
        out.close();
    }
}
