package org.gym

import org.springframework.dao.DataIntegrityViolationException

class PagoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

/*    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
        List<Pago> pagoInstanceList = Pago.findAll{monto != null}
        [pagoInstanceList: pagoInstanceList, pagoInstanceTotal: pagoInstanceList.size()]
    }*/

    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
        List<Pago> pagoInstanceList = Pago.findAll{monto != null}
        List pagoMapList = new ArrayList()

        List<HistorialMembresias> historialMembresiaInstanceList = HistorialMembresias.list()
        List historialMembresiaInstanceMap = new ArrayList()
        historialMembresiaInstanceList.each {
            if (it.pago && (it.pago?.monto>0)){
                historialMembresiaInstanceMap.add([
                        fechaDeCobro:   it.pago.fecha?.getTime(),
                        fechaDeCreacion:it.pago.dateCreated?.getTime(), // con hora
                        concepto:       "Membresía",
                        usuario:        it.usuario,
                        medioDePago:    it.pago?.medioDePago,
                        numeroDeBoleta: it.pago?.numeroDeBoleta,
                        monto:          it.pago?.monto,
                        pago:           it?.pago,
                        pagoId:         it.pago?.id,
                        matriculaId:    it?.matriculaId?:null,
                ])
            }
        }
        pagoMapList.addAll(historialMembresiaInstanceMap)

        def matriculaInstance
        List matriculaInstanceMap = new ArrayList()
        historialMembresiaInstanceMap.each {
            if (it.getAt("matriculaId")){
                matriculaInstance = Matricula.findById(it.getAt("matriculaId"))
                /*matriculaInstanceMap.add([
                        fechaDeCobro:   matriculaInstance.pagoMatricula.fecha?.getTime(),
                        fechaDeCreacion:matriculaInstance.pagoMatricula.dateCreated?.getTime(), // con hora
                        concepto:       "Matrícula",
                        usuario:        UserSocio.findById(Long.getLong(it.getAt("matriculaId") as String)),
                        medioDePago:    matriculaInstance.pagoMatricula?.medioDePago,
                        numeroDeBoleta: matriculaInstance.pagoMatricula?.numeroDeBoleta,
                        monto:          matriculaInstance.pagoMatricula?.monto,
                        pago:           matriculaInstance?.pagoMatricula,
                        pagoId:         matriculaInstance.pagoMatricula?.id,
                        matriculaId:    matriculaInstance?.id
                ])*/
            }
        }
        pagoMapList.addAll(matriculaInstanceMap)

        [pagoInstanceList: pagoInstanceList, pagoInstanceTotal: pagoMapList.size(), pagoMapList: pagoMapList]
//        [pagoInstanceList: pagoInstanceList, pagoInstanceTotal: pagoInstanceList.size(), pagoMapList: pagoMapList]
    }

    def create() {
        [pagoInstance: new Pago(params)]
    }

    def save() {
        def pagoInstance = new Pago(params)
        if (!pagoInstance.save(flush: true)) {
            render(view: "create", model: [pagoInstance: pagoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pago.label', default: 'Pago'), pagoInstance.id])
        redirect(action: "show", id: pagoInstance.id)
    }

    def show(Long id) {
        def pagoInstance = Pago.get(id)
        if (!pagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pago.label', default: 'Pago'), id])
            redirect(action: "list")
            return
        }

        [pagoInstance: pagoInstance]
    }

    def edit(Long id) {
        def pagoInstance = Pago.get(id)
        if (!pagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pago.label', default: 'Pago'), id])
            redirect(action: "list")
            return
        }

        [pagoInstance: pagoInstance]
    }

    def update(Long id, Long version) {
        def pagoInstance = Pago.get(id)
        if (!pagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pago.label', default: 'Pago'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pagoInstance.version > version) {
                pagoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'pago.label', default: 'Pago')] as Object[],
                        "Another user has updated this Pago while you were editing")
                render(view: "edit", model: [pagoInstance: pagoInstance])
                return
            }
        }

        pagoInstance.properties = params

        if (!pagoInstance.save(flush: true)) {
            render(view: "edit", model: [pagoInstance: pagoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pago.label', default: 'Pago'), pagoInstance.id])
        redirect(action: "show", id: pagoInstance.id)
    }

    def delete(Long id) {
        def pagoInstance = Pago.get(id)
        if (!pagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pago.label', default: 'Pago'), id])
            redirect(action: "list")
            return
        }

        try {
            pagoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pago.label', default: 'Pago'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pago.label', default: 'Pago'), id])
            redirect(action: "show", id: id)
        }
    }
}
