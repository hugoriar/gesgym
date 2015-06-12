package org.control

import org.joda.time.DateTime
import org.springframework.context.MessageSource
import org.springframework.context.MessageSourceAware
import java.text.SimpleDateFormat


/**
 * UserService
 * A service class encapsulates the core business logic of a Grails application
 */
class PagoService implements MessageSourceAware{
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm")
    private MessageSource messageSource;

    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    def grailsApplication

    def busca(params) {
        log.debug "Listando pagos"

        params?.userSocioInstanceId = params?.userSocioInstance ? params?.userSocioInstanceId : ""
        params?.usarFechas = Boolean.parseBoolean(String.valueOf(((params?.usarFechas == "on") || (String.valueOf(params?.usarFechas).equalsIgnoreCase("true")))? "true" : "false"))
        params.desde = params.desde ? sdf.parse(params.desde) : new DateTime().minusDays(7).withTimeAtStartOfDay().toDate()
        params.hasta = params.hasta ? sdf.parse(params.hasta) : new DateTime().plusDays(1).withTimeAtStartOfDay().minusMinutes(1).toDate()

        def resultPagos = bringPagos(params)

        params.sort = params.sort ?: 'fechaDeCobro'
        List pagoMapList = params.order?.equalsIgnoreCase("asc") ? (resultPagos.pagoMapList?.sort {it."$params.sort"}) : (resultPagos.pagoMapList.sort { it."$params.sort" }?.reverse())
        int contRenovacion = 0
        List<UserSocio> listSocios = (pagoMapList.usuario as List<UserSocio>).unique().each {
            if ((it) && (it.historialMembresias.size() > 1)) contRenovacion++
        }
        [
                pagoMapList        : pagoMapList,
                pagoMapSuma        : pagoMapList.sum { it.monto },
                contMem            : resultPagos.contMem,
                contMat            : resultPagos.contMat,
                contRen            : contRenovacion,
                contNuevos         : listSocios.size() - contRenovacion
        ]
    }


    def bringPagos(params){
        def contMem = 0
        def contMat = 0
        Long planId          = Long.valueOf(params?.planId?:0L)
        Long autorizadoPorId = Long.valueOf(params?.autorizadoPorId?:0L)
        Boolean esNuevo      = (params?.antiguedad == "Socios Nuevos") ? Boolean.TRUE : Boolean.FALSE
        Long sexoId          = Long.valueOf(params.sexoId?:0L)
        def pagoInstanceList = Pago.createCriteria().list() {                                                                        /*    FILTROS:     */
            and{
                if (params?.userSocioInstanceId) {                                                                                       // Usuario
                    def usuario = UserSocio.get(params?.userSocioInstanceId)
                    Collection<Pago> colPago = usuario.historialMembresias.pago + usuario.historialMembresias.matricula.pagoMatricula
                    'in'("id", colPago.id)
                }
                if (params?.usarFechas)          between("fecha", params.desde, params.hasta)                                            // Fecha
                if (params?.pagoConfirmado)      eq("pagoConfirmado", params?.pagoConfirmado == "Si" ? Boolean.TRUE : Boolean.FALSE)     // Pago Confirmado
                if (params?.medioPagoInstanceId) eq("medioDePago", MedioPago.get(params?.medioPagoInstanceId as Long))                   // Medio de Pago
                if (params?.numeroBoleta)        eq("numeroDeBoleta", Integer.valueOf(params?.numeroBoleta as String))                   // Número de Boleta
                notEqual('monto', 0)
            }
        }
        List pagoMapList = new ArrayList()
        if (pagoInstanceList) {
            if(( String.valueOf(params?.concepto).equals('Membresías') || ((params?.concepto=="") || (params?.concepto==null)) )){  // Concepto
                def historialMembresiaInstanceList = HistorialMembresias.createCriteria().list() {
                    'in'("pago", pagoInstanceList.flatten())
                    pago{
                        notEqual('monto', 0)
                    }
                }
                for (historialMembresiaInstance in historialMembresiaInstanceList) {
                    if (historialMembresiaInstance?.usuario) {
                        if ((planId == 0) || (historialMembresiaInstance?.planId == planId)) {                                          // Plan
                            if ((autorizadoPorId == 0) || (historialMembresiaInstance?.autorizadoPorId == autorizadoPorId)) {           // Operador
                                if ((params?.antiguedad == null) || (historialMembresiaInstance?.usuario?.esNuevo() == esNuevo)) {         // Antiguedad
                                    if ((params?.sexoId == null) || (historialMembresiaInstance?.usuario?.sexoId == sexoId)) {          // Sexo
                                        pagoMapList.add(formatPago(historialMembresiaInstance.pago, "Membresía", historialMembresiaInstance, historialMembresiaInstance.autorizadoPor))
                                        contMem++
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if(( String.valueOf(params?.concepto).equals('Matrículas') || ((params?.concepto=="") || (params?.concepto==null)) )){   // Concepto
                def matriculaInstanceList = Matricula.createCriteria().list() {
                    'in'("pagoMatricula", pagoInstanceList.flatten())
                    pagoMatricula{
                        notEqual('monto', 0)
                    }
                }
                for (matriculaInstance in matriculaInstanceList) {
                    HistorialMembresias historialMembresiaInstance = matriculaInstance.membresia?(matriculaInstance?.membresia):(HistorialMembresias.findByMatricula(matriculaInstance))
                    if (historialMembresiaInstance?.usuario) {
                        if ((planId == 0) || (historialMembresiaInstance?.planId == planId)) {                                          // Plan
                            if ((autorizadoPorId == 0) || (historialMembresiaInstance?.autorizadoPorId == autorizadoPorId)) {           // Operador
                                if (((params?.antiguedad == null) || (params?.antiguedad == "")) || (historialMembresiaInstance?.usuario?.esNuevo() == esNuevo)) {        // Antiguedad
                                    if ((params?.sexoId == null) || (historialMembresiaInstance?.usuario?.sexoId == sexoId)) {          // Sexo
                                        pagoMapList.add(formatPago(matriculaInstance.pagoMatricula, "Matrícula", historialMembresiaInstance, matriculaInstance.matriculadoPor))
                                        contMat++
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return [pagoMapList: pagoMapList, contMem: contMem, contMat: contMat]
    }

    def formatPago(Pago pago, String concepto, HistorialMembresias membresiaPadre, UserPersonal autorizadoPor){[
            fechaDeCobro        : pago.fecha?.getTime(),
            fechaDeCreacion     : pago.dateCreated?.getTime(),
//            fechaDeCobro        : pago.dateCreated?.getTime(),
            concepto            : concepto,
            usuario             : membresiaPadre?.usuario,
            usuarioNombre       : membresiaPadre?.usuario?.nombre,
            esNuevo             : membresiaPadre?.usuario?.esNuevo(),
            sexo                : membresiaPadre?.usuario?.sexo?.sexo,
            medioDePago         : pago?.medioDePago,
            numeroDeBoleta      : pago?.numeroDeBoleta,
            monto               : pago?.monto,
            pagoId              : pago?.id,
            pagoConfirmado      : pago?.pagoConfirmado,
            autorizadoPor       : autorizadoPor,
            autorizadoPorNombre : autorizadoPor?.nombre,
            plan                : membresiaPadre?.plan
    ]}

}
