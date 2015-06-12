package org.control

import org.springframework.context.MessageSource
import org.springframework.context.MessageSourceAware

import java.text.SimpleDateFormat

/**
 * UserService
 * A service class encapsulates the core business logic of a Grails application
 */
class UtilService implements MessageSourceAware{
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm")
    private MessageSource messageSource;

    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    def grailsApplication
    def springSecurityService

    String splitCamelCase(String s) {
        return s.replaceAll(
                String.format("%s|%s|%s",
                        "(?<=[A-Z])(?=[A-Z][a-z])",
                        "(?<=[^A-Z])(?=[A-Z])",
                        "(?<=[A-Za-z])(?=[^A-Za-z])"
                ),
                " "
        );
    }

    def enviarMail(String email, String asunto, String cuerpo){
        sendMail {
            to email
            from grailsApplication.config.grails.mail.username
            subject asunto
            body cuerpo
        }
    }

    def fechaFormateada = { value ->
        return (new SimpleDateFormat('EEEE dd-MM-yy').format(value)).capitalize()
    }

    def fechaFormateadaSinDia = { value ->
        return new SimpleDateFormat('dd-MM-yy').format(value)
    }

    def logCambiosDeEstado(Date fechaDeOperacion, UserSocio socio, EstadoMembresia estadoAntiguo, EstadoMembresia estadoNuevo, Modalidad modalidad, String observaciones){
        def logCambiosDeEstadoInstance = new LogCambiosDeEstado(fechaDeOperacion: fechaDeOperacion, socio: socio, estadoAntiguo: estadoAntiguo, estadoNuevo: estadoNuevo, modalidad: modalidad, observaciones: observaciones)
        if (!logCambiosDeEstadoInstance.save()) {
            return
        }
    }

    def logOperacion(String tipoOperacion, String entidad, Long idEntidad, UserSocio socio, String nombreAtributo, valorAntiguo, valorNuevo, String observaciones){
        UserPersonal personal = springSecurityService.getCurrentUser() as UserPersonal
        LogEntidad entidadInstance = LogEntidad.findByNombreTabla(entidad)
            new LogOperacion(
                    tipoOperacion: LogTipoOperacion.findByAccion(tipoOperacion),
                    entidad:       entidadInstance,
                    idEntidad:     idEntidad,
                    modalidad:     personal?Modalidad.findByModalidad("Manual"):Modalidad.findByModalidad("Automático"),
                    personal:      personal,
                    socio:         socio,
                    atributo:      nombreAtributo ? (LogAtributo.findByEntidadAndNombre(entidadInstance, nombreAtributo)?:null) : null,
                    valorAntiguo:  valorAntiguo?String.valueOf(valorAntiguo):null,
                    valorNuevo:    valorNuevo?String.valueOf(valorNuevo):null,
                    observaciones: observaciones
            ).save()
    }

}

