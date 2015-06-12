package org.control

import org.joda.time.DateTime
import org.springframework.context.MessageSource
import org.springframework.context.MessageSourceAware

import java.text.SimpleDateFormat

/**
 * UserService
 * A service class encapsulates the core business logic of a Grails application
 */
class LogOperacionService implements MessageSourceAware{
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm")
    private MessageSource messageSource;

    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    def grailsApplication

    def busca(params) {
        log.debug "Listando logs"

        params?.userSocioInstanceId = params?.userSocioInstance ? params?.userSocioInstanceId : ""
        params?.usarFechas = Boolean.parseBoolean(String.valueOf(((params?.usarFechas == "on") || (String.valueOf(params?.usarFechas).equalsIgnoreCase("true")))? "true" : "false"))
        params?.observaciones = Boolean.parseBoolean(String.valueOf(((params?.observaciones == "on") || (String.valueOf(params?.observaciones).equalsIgnoreCase("true")))? "true" : "false"))
        params.desde = params.desde ? sdf.parse(params.desde) : new DateTime().minusDays(7).withTimeAtStartOfDay().toDate()
        params.hasta = params.hasta ? sdf.parse(params.hasta) : new DateTime().plusDays(1).withTimeAtStartOfDay().minusMinutes(1).toDate()

        def resultLogOperaciones = bringLogOperaciones(params)
        [logOperacionesInstanceList: resultLogOperaciones.logOperacionesInstanceList]
    }


    def bringLogOperaciones(params){
        def logOperacionesInstanceList = LogOperacion.createCriteria().list() {                                                         /*    FILTROS:     */
            and{
                if (params?.userSocioInstanceId)        eq("socio", UserSocio.get(params.userSocioInstanceId))                          // Socio
                if (params?.autorizadoPorId)            eq("personal", UserPersonal.get(params.autorizadoPorId))                        // Personal
                if (params?.usarFechas)                 between("dateCreated", params.desde, params.hasta)                              // Fecha
                if (params?.observaciones)              isNotNull("observaciones")                                                      // Observaciones
                if (params?.logEntidadInstanceId)       eq("entidad", LogEntidad.get(params?.logEntidadInstanceId))                     // Entidad
                if (params?.logAtributoInstanceId)      eq("atributo", LogAtributo.get(params?.logAtributoInstanceId))                  // Atributo
                if (params?.logTipoOperacionInstanceId) eq("tipoOperacion", LogTipoOperacion.get(params?.logTipoOperacionInstanceId))   // Tipo de operacion
            }
            order(params.sort?:"id", params.order?:"desc")
        }
        return [logOperacionesInstanceList: logOperacionesInstanceList]
    }


}
