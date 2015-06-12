package org.control

import grails.plugins.springsecurity.Secured
import org.joda.time.DateTime
import org.springframework.dao.DataIntegrityViolationException

import java.text.DateFormatSymbols
import java.text.SimpleDateFormat

class PagoController {
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm")
    def listMeses = new ArrayList<String>(['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'])
    def userService
    def pagoService
    def utilService
    def exportService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

/*    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
        List<Pago> pagoInstanceList = Pago.findAll{monto != null}
        [pagoInstanceList: pagoInstanceList, pagoInstanceTotal: pagoInstanceList.size()]
    }*/

    def listOld(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
        List<Pago> pagoInstanceList = Pago.findAllByMontoIsNotNull()
        List pagoMapList = new ArrayList()

        List<HistorialMembresias> historialMembresiaInstanceList = HistorialMembresias.list()
        List historialMembresiaInstanceMap = new ArrayList()
        for (historialMembresiaInstance in historialMembresiaInstanceList) {
//        historialMembresiaInstanceList.each {
            if (historialMembresiaInstance.pago && (historialMembresiaInstance.pago?.monto > 0)) {
                historialMembresiaInstanceMap.add([
                        fechaDeCobro   : historialMembresiaInstance.pago.fecha?.getTime(),
                        fechaDeCreacion: historialMembresiaInstance.pago.dateCreated?.getTime(), // con hora
                        concepto       : "Membresía",
                        usuario        : historialMembresiaInstance.usuario,
                        medioDePago    : historialMembresiaInstance.pago?.medioDePago,
                        numeroDeBoleta : historialMembresiaInstance.pago?.numeroDeBoleta,
                        monto          : historialMembresiaInstance.pago?.monto,
                        pago           : historialMembresiaInstance?.pago,
                        pagoId         : historialMembresiaInstance.pago?.id,
                        matriculaId    : historialMembresiaInstance?.matriculaId ?: null,
                ])
            }
        }
        pagoMapList.addAll(historialMembresiaInstanceMap)

        Matricula matriculaInstance
        List<Matricula> matriculaInstanceMap = new ArrayList()


        def start = System.nanoTime()
        for (historialMembresiaInstance in historialMembresiaInstanceMap) {
            if (historialMembresiaInstance.getAt("matriculaId")) {
                matriculaInstance = Matricula.get(historialMembresiaInstance.getAt("matriculaId") as Long)
            }
        }
        println System.nanoTime() - start

        /*historialMembresiaInstanceMap.each {
            if (it.getAt("matriculaId")){
                matriculaInstance = Matricula.findById(it.getAt("matriculaId"))*/
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
        /*  }
      }*/
        pagoMapList.addAll(matriculaInstanceMap)

        [pagoInstanceList: pagoInstanceList, pagoInstanceTotal: pagoMapList.size(), pagoMapList: pagoMapList]
//        [pagoInstanceList: pagoInstanceList, pagoInstanceTotal: pagoInstanceList.size(), pagoMapList: pagoMapList]
    }

    def list() {
        params.max = Math.min(params.max ?: 10, 100)
        List<Pago> pagoInstanceList = Pago.findAllByMontoIsNotNull(params)

        List<Pago> historialMembresiasList = HistorialMembresias.findAllByPagoIsNotNull().pago
        List<Pago> matriculaList = Matricula.findAllByPagoMatriculaIsNotNull().pagoMatricula
        List pagoMapList = new ArrayList()

        List<HistorialMembresias> historialMembresiaInstanceList = HistorialMembresias.list()
        List historialMembresiaInstanceMap = new ArrayList()
        for (historialMembresiaInstance in historialMembresiaInstanceList) {
//        historialMembresiaInstanceList.each {
            if (historialMembresiaInstance.pago && (historialMembresiaInstance.pago?.monto > 0)) {
                historialMembresiaInstanceMap.add([
                        fechaDeCobro   : historialMembresiaInstance.pago.fecha?.getTime(),
                        fechaDeCreacion: historialMembresiaInstance.pago.dateCreated?.getTime(), // con hora
                        concepto       : "Membresía",
                        usuario        : historialMembresiaInstance.usuario,
                        medioDePago    : historialMembresiaInstance.pago?.medioDePago,
                        numeroDeBoleta : historialMembresiaInstance.pago?.numeroDeBoleta,
                        monto          : historialMembresiaInstance.pago?.monto,
                        pago           : historialMembresiaInstance?.pago,
                        pagoId         : historialMembresiaInstance.pago?.id,
                        matriculaId    : historialMembresiaInstance?.matriculaId ?: null,
                ])
            }
        }
        pagoMapList.addAll(historialMembresiaInstanceMap)

        Matricula matriculaInstance
        List<Matricula> matriculaInstanceMap = new ArrayList()


        def start = System.nanoTime()
        for (historialMembresiaInstance in historialMembresiaInstanceMap) {
            if (historialMembresiaInstance.getAt("matriculaId")) {
                matriculaInstance = Matricula.get(historialMembresiaInstance.getAt("matriculaId") as Long)
            }
        }
        println System.nanoTime() - start

        /*historialMembresiaInstanceMap.each {
            if (it.getAt("matriculaId")){
                matriculaInstance = Matricula.findById(it.getAt("matriculaId"))*/
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
        /*  }
      }*/
        pagoMapList.addAll(matriculaInstanceMap)

        [pagoInstanceList: pagoInstanceList, pagoInstanceTotal: pagoMapList.size(), pagoMapList: pagoMapList]
//        [pagoInstanceList: pagoInstanceList, pagoInstanceTotal: pagoInstanceList.size(), pagoMapList: pagoMapList]
    }


    def buscador() {
        log.debug "Listando pagos"

        def result = pagoService.busca(params)

        render(view: "buscador",
                model: [
                        userSocioInstance  : params?.userSocioInstance,
                        userSocioInstanceId: params?.userSocioInstanceId,
                        medioPagoInstanceId: params?.medioPagoInstanceId,
                        numeroBoleta       : params?.numeroBoleta,
                        planList           : userService.getListaPlan() as List<Plan>,
                        concepto           : params?.concepto,
                        usarFechas         : params?.usarFechas,
                        sort               : params?.sort,
                        order              : params?.order,
                        max                : params?.max,
                        periodo            : params?.periodo,
                        desde              : sdf.format(params?.desde),
                        hasta              : sdf.format(params?.hasta),
                        pagoMapList        : result.pagoMapList,
                        pagoMapSuma        : result.pagoMapSuma,
                        contMem            : result.contMem,
                        contMat            : result.contMat,
                        contRen            : result.contRen,
                        contNuevos         : result.contNuevos
                ])
    }

    def comparar() {
        log.debug "Listando pagos"

        params.userSocioInstanceId = params?.userSocioInstance ? params?.userSocioInstanceId : ""
        params.concepto = params?.concepto ?: ""
        params.usarFechas = "true"

        params.anioPrimero = params.anioPrimero ?: new DateTime().year
        params.mesPrimero = params.mesPrimero ? listMeses.indexOf(params.mesPrimero)+1 : new DateTime().monthOfYear
        DateTime fechaPrimero = new DateTime((params.anioPrimero as int), (params.mesPrimero),1,0,0)
        params.desde = sdf.format(fechaPrimero.withTimeAtStartOfDay().toDate())
        params.hasta = sdf.format(fechaPrimero.plusMonths(1).minusMinutes(1).toDate())
        def resultPagosSerie1 = pagoService.busca(params)

        params.desde = null
        params.hasta = null

        params.anioSegundo = params.anioSegundo ?: fechaPrimero.minusMonths(1).year
        params.mesSegundo = params.mesSegundo ? listMeses.indexOf(params.mesSegundo)+1 : fechaPrimero.minusMonths(1).monthOfYear
        DateTime fechaSegundo = new DateTime((params.anioSegundo as int), (params.mesSegundo),1,0,0)
        params.desde = sdf.format(fechaSegundo.withTimeAtStartOfDay().toDate())
        params.hasta = sdf.format(fechaSegundo.plusMonths(1).minusMinutes(1).toDate())
        def resultPagosSerie2 = pagoService.busca(params)

        ArrayList<String> meses = new ArrayList<>()
        new DateFormatSymbols().months.each{ mes ->
            if (mes) meses.add(mes.capitalize())
        }
        render(view: "comparar",
                model: [
                        userSocioInstance  : params?.userSocioInstance,
                        userSocioInstanceId: params?.userSocioInstanceId,
                        medioPagoInstanceId: params?.medioPagoInstanceId,
                        numeroBoleta       : params?.numeroBoleta,
                        concepto           : params?.concepto,
                        usarFechas         : params?.usarFechas,
                        sort               : params?.sort,
                        order              : params?.order,
                        max                : params?.max,
                        periodo            : params?.periodo,
                        /*desde              : params?.desde,
                        hasta              : params?.hasta,*/
                        anioPrimero        : params?.anioPrimero,
                        mesPrimero         : params?.mesPrimero,
                        anioSegundo        : params?.anioSegundo,
                        mesSegundo         : params?.mesSegundo,
                        pagoMapList1       : resultPagosSerie1.pagoMapList,
                        pagoMapSuma1       : resultPagosSerie1.pagoMapSuma?:0,
                        contMem1           : resultPagosSerie1.contMem,
                        contMat1           : resultPagosSerie1.contMat,
                        contRen1           : resultPagosSerie1.contRen,
                        contNue1           : resultPagosSerie1.contNuevos,
                        pagoMapList2       : resultPagosSerie2.pagoMapList,
                        pagoMapSuma2       : resultPagosSerie2.pagoMapSuma?:0,
                        contMem2           : resultPagosSerie2.contMem,
                        contMat2           : resultPagosSerie2.contMat,
                        contRen2           : resultPagosSerie2.contRen,
                        contNue2           : resultPagosSerie2.contNuevos,
                        meses              : meses
                ])
    }

    def generaReportesPagos() {
        log.debug "Listando usuarios"

        params?.userSocioInstanceId = params?.userSocioInstance ? params?.userSocioInstanceId : ""
        params?.usarFechas = ((params?.usarFechas == "on") || (params?.usarFechas == "true")) ? Boolean.TRUE : Boolean.FALSE
        params.desde = params.desde ? sdf.parse(params.desde) : new DateTime().minusDays(7).withTimeAtStartOfDay().toDate()
        params.hasta = params.hasta ? sdf.parse(params.hasta) : new DateTime().plusDays(1).withTimeAtStartOfDay().minusMinutes(1).toDate()

        List pagoMapList = pagoService.bringPagos(params).pagoMapList

        params.sort = params.sort ?: 'fechaDeCobro'
        pagoMapList = params.order?.equalsIgnoreCase("asc") ? (pagoMapList.sort {
            it."$params.sort"
        }) : (pagoMapList.sort { it."$params.sort" }.reverse())

        params.format = "pdf"
        response.contentType = grailsApplication.config.grails.mime.types[params.format]
        String tituloPDF = "Reporte de Pagos" +
                "${params?.userSocioInstance ? (" usuario " + params?.userSocioInstance) : ""}" +
                "${params?.medioPagoInstanceId ? (" medio de pago " + MedioPago.get(params?.medioPagoInstanceId).nombre) : ""}" +
                "${params?.numeroBoleta ? (" boleta " + params?.numeroBoleta) : ""}" +
                "${params?.concepto ? (" concepto " + params?.concepto) : ""}" +
                "${params?.usarFechas ? (" periodo \"" + params?.periodo + "\"") : ""}"
        if (Boolean.valueOf(params?.usarFechas)) {
            Date desde = params.desde
            Date hasta = params.hasta
            if (desde.compareTo(hasta)) {
                response.setHeader("Content-disposition", "inline; filename=Estados_${utilService.fechaFormateada(desde)}_al_${utilService.fechaFormateada(hasta)}.${params.extension}")
                // ó attachment
                tituloPDF += " con fecha entre el " + utilService.fechaFormateada(desde) + " y el " + utilService.fechaFormateada(hasta)
            } else {
                response.setHeader("Content-disposition", "inline; filename=Estados_${utilService.fechaFormateada(desde)}.${params.extension}")
                tituloPDF += " con fecha el día " + utilService.fechaFormateada(desde)
            }

        }
        tituloPDF += " (" + pagoMapList.size() + " resultados). Total ingreso" + (params?.usarFechas ? (" periodo: ") : ": ") + String.format("\$%,d", Integer.valueOf(params.pagoMapSuma ?: 0)) + ".-"

        List fields = ["pagoId", "fechaDeCobro", "fechaDeCobro.hora", "concepto", "usuario", "medioDePago", "numeroDeBoleta", "pagoConfirmado", "autorizadoPor", "monto"]
        Map labels = ["pagoId": "Id", "fechaDeCobro": "Fecha", "fechaDeCobro.hora": "Hora", "concepto": "Concepto", "usuario": "Usuario", "medioDePago": "Medio de Pago", "numeroDeBoleta": "Boleta", "pagoConfirmado": "Confirmado", "autorizadoPor": "Autorizado por", "monto": "Monto"]

        // Formatter closure
        def upperCase = { domain, value ->
            return value.toUpperCase()
        }

        def aFecha = { domain, value ->
            if (domain.fechaDeCobro != null) {
                return (new Date(domain.fechaDeCobro).format("EEE dd-MM-yy")).capitalize()
            } else {
                return ""
            }
        }

        def aHora = { domain, value ->
            if (domain.fechaDeCobro != null) {
                return (new Date(domain.fechaDeCobro).format("HH:mm"))
            } else {
                return ""
            }
        }

        def aFono = { domain, value ->
            return domain?.getFonos(true, true, false, 2, " - ");
        }

        def aEmail = { domain, value ->
            return domain?.email?.toLowerCase();
        }

        def aRut = { domain, value ->
            return (String.format("%,d", value)) + "-" + (Character.toString(domain.dv));
        }

        def aMonto = { domain, value ->
            return (String.format("\$ %,d", value ?: 0));
        }

        def aConfirmado = { domain, value ->
            return domain?.pagoConfirmado ? "Si" : "No";
        }

        Map formatters = [fechaDeCobro: aFecha, "fechaDeCobro.hora": aHora, pagoConfirmado: aConfirmado, monto: aMonto]
//        Map formatters = [fechaDeCobro: aFecha, "fechaDeCobro.hora": aHora, concepto: aConcepto, usuarioNombre: aUsuario, medioDePago: aMedioDePago, numeroDeBoleta: aBoleta, pagoConfirmado: aConfirmado, autorizadoPorNombre: aAutorizado por, monto: aMonto]
//        Map formatters = [nombre: upperCase, apellidoPaterno: upperCase, apellidoMaterno: upperCase, "historialMembresias.fechaFin": aFecha, fono: aFono, email: aEmail, ultimaVisita: aUltimaVisita, enrolado: aEnrolado]
        Map parameters = [title: tituloPDF, "pdf.orientation": "landscape", "column.widths": [0.05, 0.1, 0.05, 0.1, 0.19, 0.1, 0.06, 0.1, 0.19, 0.06]]
//        Map parameters = [title: tituloPDF, "pdf.orientation": "landscape", "column.widths": [0.12, 0.12, 0.12, 0.12, 0.2, 0.06, 0.06, 0.1, 0.1]]

        exportService.export(params.format, response.outputStream, pagoMapList, fields, labels, formatters, parameters)
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

    @Secured(['permitAll'])
    def avatar_image = {
        def avatarUser = Pago.get(params.id)
        if (!avatarUser || !avatarUser.fotoBoleta/* || !avatarUser.avatarType*/) {
            response.sendError(404)
            return;
        }
//        response.setContentType(avatarUser.avatarType)
        response.setContentLength(avatarUser.fotoBoleta.size())
        OutputStream out = response.getOutputStream();
        out.write(avatarUser.fotoBoleta);
        out.close();
    }
}
