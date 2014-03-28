package org.gym

import org.springframework.dao.DataIntegrityViolationException

/**
 * ConfiguracionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ConfiguracionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [configuracionInstanceList: Configuracion.list(params), configuracionInstanceTotal: Configuracion.count()]
    }

    def create() {
        [configuracionInstance: new Configuracion(params)]
    }

    def save() {
        def configuracionInstance = new Configuracion(params)
        if (!configuracionInstance.save(flush: true)) {
            render(view: "create", model: [configuracionInstance: configuracionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'configuracion.label', default: 'Configuracion'), configuracionInstance.id])
        redirect(action: "show", id: configuracionInstance.id)
    }

    def show() {
        def configuracionInstance = Configuracion.get(params.id)
        if (!configuracionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracion.label', default: 'Configuracion'), params.id])
            redirect(action: "list")
            return
        }

        [configuracionInstance: configuracionInstance]
    }

    def edit() {
        def configuracionInstance = Configuracion.get(params.id)
        if (!configuracionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracion.label', default: 'Configuracion'), params.id])
            redirect(action: "list")
            return
        }

        [configuracionInstance: configuracionInstance]
    }

    def update() {
        def configuracionInstance = Configuracion.get(params.id)
        if (!configuracionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracion.label', default: 'Configuracion'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (configuracionInstance.version > version) {
                configuracionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'configuracion.label', default: 'Configuracion')] as Object[],
                        "Another user has updated this Configuracion while you were editing")
                render(view: "edit", model: [configuracionInstance: configuracionInstance])
                return
            }
        }

        configuracionInstance.properties = params

        if (!configuracionInstance.save(flush: true)) {
            render(view: "edit", model: [configuracionInstance: configuracionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'configuracion.label', default: 'Configuracion'), configuracionInstance.id])
        redirect(action: "show", id: configuracionInstance.id)
    }

    def delete() {
        def configuracionInstance = Configuracion.get(params.id)
        if (!configuracionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracion.label', default: 'Configuracion'), params.id])
            redirect(action: "list")
            return
        }

        try {
            configuracionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'configuracion.label', default: 'Configuracion'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'configuracion.label', default: 'Configuracion'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def ip() {
        List<String> ips = new ArrayList<>()
        List<String> networkInterfaces = new ArrayList<>()
        NetworkInterface nface
        Enumeration ne = NetworkInterface.getNetworkInterfaces();
        while (ne.hasMoreElements()) {
            NetworkInterface netFace = (NetworkInterface) ne.nextElement();
            //log.debug("FOUND NetworkInterface: ${netFace.getDisplayName()}  ${netFace.getName()}")
//            networkInterfaces.add(netFace.getDisplayName()+" "+netFace.getName())
            Enumeration ae = netFace.getInetAddresses();
            while (ae.hasMoreElements()) {
                InetAddress address = (InetAddress) ae.nextElement();
//                log.debug("FOUND IP address: ${address.getHostAddress()}");
                if (address.getHostAddress().size()>6){
                    if ("192.168.".equalsIgnoreCase(address.getHostAddress().substring(0,8))){
                        log.debug("IP del servidor: ${address.getHostAddress()}");
//                        ips.add(address.getHostAddress())
                        networkInterfaces.add(netFace.getDisplayName()+" "+netFace.getName())
                    }
                }
            }
        }
        render(view:"ip", model:[networkInterfaces: networkInterfaces, ipsServidor: ips])
    }

    def cambiaAdaptador() {
        def configuracionInstance = Configuracion.findByNombre("AdaptadorIPServidor")
        if (!configuracionInstance) {
            configuracionInstance = new Configuracion()
            configuracionInstance.nombre = "AdaptadorIPServidor"
        }
        configuracionInstance.valor = params.adaptador

        if (!configuracionInstance.save(flush: true)) {
            render(view: "ip", model: [configuracionInstance: configuracionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: ["Adaptador", configuracionInstance.valor])
        redirect(action: "ip")
    }

}
