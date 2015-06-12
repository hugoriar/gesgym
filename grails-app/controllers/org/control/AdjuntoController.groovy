package org.control

import org.springframework.dao.DataIntegrityViolationException

/**
 * AdjuntoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class AdjuntoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [adjuntoInstanceList: Adjunto.list(params), adjuntoInstanceTotal: Adjunto.count()]
    }

    def create() {
        [adjuntoInstance: new Adjunto(params)]
    }

    def save() {
        def adjuntoInstance = new Adjunto(params)
        if (!adjuntoInstance.save(flush: true)) {
            render(view: "create", model: [adjuntoInstance: adjuntoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'adjunto.label', default: 'Adjunto'), adjuntoInstance.id])
        redirect(action: "show", id: adjuntoInstance.id)
    }

    def show() {
        def adjuntoInstance = Adjunto.get(params.id)
        if (!adjuntoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'adjunto.label', default: 'Adjunto'), params.id])
            redirect(action: "list")
            return
        }

        [adjuntoInstance: adjuntoInstance]
    }

    def edit() {
        def adjuntoInstance = Adjunto.get(params.id)
        if (!adjuntoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'adjunto.label', default: 'Adjunto'), params.id])
            redirect(action: "list")
            return
        }

        [adjuntoInstance: adjuntoInstance]
    }

    def update() {
        def adjuntoInstance = Adjunto.get(params.id)
        if (!adjuntoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'adjunto.label', default: 'Adjunto'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (adjuntoInstance.version > version) {
                adjuntoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'adjunto.label', default: 'Adjunto')] as Object[],
                        "Another user has updated this Adjunto while you were editing")
                render(view: "edit", model: [adjuntoInstance: adjuntoInstance])
                return
            }
        }

        adjuntoInstance.properties = params

        if (!adjuntoInstance.save(flush: true)) {
            render(view: "edit", model: [adjuntoInstance: adjuntoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'adjunto.label', default: 'Adjunto'), adjuntoInstance.id])
        redirect(action: "show", id: adjuntoInstance.id)
    }

    def delete() {
        def adjuntoInstance = Adjunto.get(params.id)
        if (!adjuntoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'adjunto.label', default: 'Adjunto'), params.id])
            redirect(action: "list")
            return
        }

        try {
            adjuntoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'adjunto.label', default: 'Adjunto'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'adjunto.label', default: 'Adjunto'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def avatar_image = {
        def avatarUser = Adjunto.findById(params.id)
        if (!avatarUser || !avatarUser.archivo/* || !avatarUser.avatarType*/) {
            response.sendError(404)
            return;
        }
//        response.setContentType(avatarUser.avatarType)
        response.setContentLength(avatarUser.archivo.size())
        OutputStream out = response.getOutputStream();
        out.write(avatarUser.archivo);
        out.close();
    }
}
