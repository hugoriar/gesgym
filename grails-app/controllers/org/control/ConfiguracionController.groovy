package org.control

import org.control.Configuracion
import org.springframework.dao.DataIntegrityViolationException

/**
 * ConfiguracionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ConfiguracionController {
    def configuracionService

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
        def prefijoIp = params.prefijoIp?:(Configuracion.findByNombre("prefijoIp")?.valor)?:"192.168."

        Enumeration ne = NetworkInterface.getNetworkInterfaces();
        while (ne.hasMoreElements()) {
            NetworkInterface netFace = (NetworkInterface) ne.nextElement();
            Enumeration ae = netFace.getInetAddresses();
            while (ae.hasMoreElements()) {
                InetAddress address = (InetAddress) ae.nextElement();
                if (address.getHostAddress().size()>6){
                    if (prefijoIp){
                        if (address.getHostAddress().startsWith(prefijoIp)){
                            networkInterfaces.add(netFace.getDisplayName()+" "+netFace.getName())
                        }
                    } else {
                        networkInterfaces.add(netFace.getDisplayName()+" "+netFace.getName())
                    }
                }
            }
        }

        configuracionService.nuevaConfiguracion("prefijoIp", prefijoIp)
        render(view:"ip", model:[
                networkInterfaces:      networkInterfaces,
                ipsServidor:            ips,
                prefijoIp:              prefijoIp,
                emailsAvisoCambioIp:    params?.emailsAvisoCambioIp?:(Configuracion.findByNombre("emailsAvisoCambioIp")?.valor),
                mostrarIpEnPie:         ((Configuracion.findByNombre("mostrarIpEnPie")?.valor =="on")||(Configuracion.findByNombre("mostrarIpEnPie")?.valor =="true"))?Boolean.TRUE:Boolean.FALSE,
                mostrarIpEnEncabezado:  ((Configuracion.findByNombre("mostrarIpEnEncabezado")?.valor =="on")||(Configuracion.findByNombre("mostrarIpEnEncabezado")?.valor =="true"))?Boolean.TRUE:Boolean.FALSE])
    }

    def empresa() {
        render(view:"empresa", model:[
                nombreEmpresa:  params.nombreEmpresa?:(Configuracion.findByNombre("nombreEmpresa")?.valor)?:"Nombre de Empresa",
                logoEmpresa:    params.logoEmpresa?:(ConfiguracionBytes.findByNombre("logoEmpresa")?.valor)?:null,
                faviconEmpresa: params.logoEmpresa?:(ConfiguracionBytes.findByNombre("faviconEmpresa")?.valor)?:null])
    }

    def cambiaAdaptador() {
        configuracionService.nuevaConfiguracion("AdaptadorIPServidor", params?.adaptador)
        configuracionService.nuevaConfiguracion("mostrarIpEnPie", ((params?.mostrarIpEnPie =="on")||(params?.mostrarIpEnPie =="true"))?"true":"false")
        configuracionService.nuevaConfiguracion("mostrarIpEnEncabezado", ((params?.mostrarIpEnEncabezado =="on")||(params?.mostrarIpEnEncabezado =="true"))?"true":"false")
        configuracionService.nuevaConfiguracion("emailsAvisoCambioIp", params?.emailsAvisoCambioIp)

        flash.message = message(code: 'default.updated.message', args: ["Configuración", ""])
        redirect(action: "ip")
    }

    def cambiaEmpresa() {
        configuracionService.nuevaConfiguracion("nombreEmpresa", params?.nombreEmpresa)
        configuracionService.nuevaConfiguracionBytes(new ConfiguracionBytes(nombre: "logoEmpresa", valor: params.valor, descripcion: params.descripcion))
        configuracionService.nuevaConfiguracionBytes(new ConfiguracionBytes(nombre: "faviconEmpresa", valor: params.faviconEmpresa, descripcion: params.descripcion))
        flash.message = message(code: 'default.updated.message', args: ["Configuración", ""])
        redirect(action: "empresa")
    }

}
