package org.control

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.io.support.ByteArrayResource
import org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib
import org.jdom.Document
import org.springframework.core.io.InputStreamSource
import org.springframework.web.multipart.*
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.commons.CommonsMultipartFile

/**
 * EmailController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class EmailController {
    def grailsApplication

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [emailInstanceList: Email.list(params), emailInstanceTotal: Email.count()]
    }

    def create() {
        [emailInstance: new Email(params)]
    }

    def save() {
        def emailInstance = new Email(params)
        if (!emailInstance.save(flush: true)) {
            render(view: "create", model: [emailInstance: emailInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'email.label', default: 'Email'), emailInstance.id])
        redirect(action: "show", id: emailInstance.id)
    }

    def show() {
        def emailInstance = Email.get(params.id)
        if (!emailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'email.label', default: 'Email'), params.id])
            redirect(action: "list")
            return
        }

        [emailInstance: emailInstance]
    }

    def edit() {
        def emailInstance = Email.get(params.id)
        if (!emailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'email.label', default: 'Email'), params.id])
            redirect(action: "list")
            return
        }

        [emailInstance: emailInstance]
    }

    def update() {
        def emailInstance = Email.get(params.id)
        if (!emailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'email.label', default: 'Email'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (emailInstance.version > version) {
                emailInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'email.label', default: 'Email')] as Object[],
                        "Another user has updated this Email while you were editing")
                render(view: "edit", model: [emailInstance: emailInstance])
                return
            }
        }

        emailInstance.properties = params

        if (!emailInstance.save(flush: true)) {
            render(view: "edit", model: [emailInstance: emailInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'email.label', default: 'Email'), emailInstance.id])
        redirect(action: "show", id: emailInstance.id)
    }

    def delete() {
        def emailInstance = Email.get(params.id)
        if (!emailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'email.label', default: 'Email'), params.id])
            redirect(action: "list")
            return
        }

        try {
            emailInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'email.label', default: 'Email'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'email.label', default: 'Email'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def mailsBatch() {
        log.debug "Mandando mails..."

        List<UserSocio> userSocioInstanceList = params.list('usuario')
        String usuariosSinEmail = ""
        String para = ""
        userSocioInstanceList.each {
            UserSocio userSocioInstance = UserSocio.findById(Long.valueOf(String.valueOf(it).replace(".","")))
            if (userSocioInstance?.email) {
                para = para+(userSocioInstance.email).toLowerCase()+", "
            } else {
                usuariosSinEmail = usuariosSinEmail+" "+userSocioInstance.nombre+" "+userSocioInstance.apellidoPaterno+" "+userSocioInstance.apellidoMaterno+", "
                flash.message = "Socios sin email: " +usuariosSinEmail.substring(0, usuariosSinEmail.length()-2)
            }
        }
        if (para.length() > 1){
            para = para.substring(0, para.length()-2)
        }
        redirect(action: "create", params: [
                de: grailsApplication.config.grails.mail.username,
                para: para,
                cc: "",
                bcc: "",
                asunto: "",
                mensaje: ""
        ])
    }
 /*   def mandarMailsBatch() {
        log.debug "Mandando mails..."
//        List<String> de = params?.de
        Email email = new Email(params)
        email.save(flush: true)
        List<Adjunto> listAdjuntos = new ArrayList<Adjunto>()
        int cantAdjuntos = (params.contador).toInteger() - 1
        for (int i = 1; i <= cantAdjuntos; i++) {
            def CommonsMultipartFile uploadedFile = params."archivo${i}"
            if (uploadedFile) {
                Adjunto adjunto = new Adjunto(
                        nombre:      uploadedFile.originalFilename,
                        contentType: uploadedFile.contentType,
                        peso:        uploadedFile.size,
                        archivo:     params."archivo${i}",
                        email:       email
                )
                if (!adjunto.save(flush: true)) {
//                render(view: "create", model: [emailInstance: emailInstance])
                    return
                } else {
                    listAdjuntos.add(adjunto)
                }
            }
        }

        List<String> para, ccc, bccc
        if (!params.para.isEmpty()) para = params.para.split(",")?.collect { it.trim() }
        if (!params.cc.isEmpty())   ccc  = params.cc.split(",")?.collect { it.trim() }
        if (!params.bcc.isEmpty())  bccc = params.bcc.split(",")?.collect { it.trim() }
        sendMail {
            multipart true
            if (para) to para
            if (ccc)  cc ccc
            if (bccc) bcc bccc
            from grailsApplication.config.grails.mail.username
            subject params?.asunto
            body params.mensaje?.toString()
            // loop over attachments
            listAdjuntos.each{ documentsInstance->
                attachBytes documentsInstance.nombre, documentsInstance.contentType, documentsInstance.archivo
            }
        }
        flash.message = "Email enviado"
        forward(controller: "home", action: "index")
    }*/
    def mandarMailsBatch() {
        log.debug "Mandando mails..."
        Email email = new Email(params)
        email.de = grailsApplication.config.grails.mail.username
        if (!email.save(flush: true)){
            flash.message = "Error, datos no válidos, corregir email"
            redirect(action: 'create', params: params)
        } else {
            List<Adjunto> listAdjuntos = new ArrayList<Adjunto>()
            if (params?.contador) {
                int cantAdjuntos = (params.contador).toInteger() - 1
                for (int i = 1; i <= cantAdjuntos; i++) {
                    def CommonsMultipartFile uploadedFile = params."archivo${i}"
                    if (uploadedFile) {
                        Adjunto adjunto = new Adjunto(
                                nombre: uploadedFile.originalFilename,
                                contentType: uploadedFile.contentType,
                                peso: uploadedFile.size,
                                archivo: params."archivo${i}",
                                email: email
                        )
                        if (!adjunto.save(flush: true)) {
                            return
                        } else {
                            listAdjuntos.add(adjunto)
                        }
                    }
                }
            }

            List<String> para, ccc, bccc
            if (!params.para.isEmpty()) para = params.para.split(",")?.collect { it.trim() }
            if (!params.cc.isEmpty())   ccc  = params.cc.split(",")?.collect { it.trim() }
            if (!params.bcc.isEmpty())  bccc = params.bcc.split(",")?.collect { it.trim() }
            sendMail {
                multipart true
                if (para) to para
                if (ccc)  cc ccc
                if (bccc) bcc bccc
                from grailsApplication.config.grails.mail.username
                subject params?.asunto
                body params.mensaje?.toString()
                // loop over attachments
                listAdjuntos.each{ documentsInstance->
                    attachBytes documentsInstance.nombre, documentsInstance.contentType, documentsInstance.archivo
                }
            }
            flash.message = "Email enviado"
            redirect(action: 'show', id: email?.id)
        }

    }
}
