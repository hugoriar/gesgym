package org.control

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.joda.time.DateTime
import org.joda.time.LocalDate
import org.joda.time.Seconds

/**
 * WsController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class WsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    /*@Secured(['permitAll'])
    def retornaHorarios(){
        def usuario = UserSocio.get(params?.id)
        def now = new Date()
        def response = [:]
        def autorizado = false
        def mensaje = "Hubo un problema, comuníquese con un operador."

        // Discrimina según curso
        usuario.horarios.each { horario ->
            horario.fechas.each { fecha ->
                if (fecha.dayOfWeek == now.day){
                    Date endOri = fecha.end_date
                    Date end = new Date(hours: endOri.hours, minutes: endOri.minutes, seconds: endOri.seconds)
                    Date startOri = fecha.start_date
                    Date start = new Date(hours: startOri.hours, minutes: startOri.minutes, seconds: startOri.seconds)

                    if ((now >= start) && (now <= end)){
                        autorizado = true
                        response.curso = horario.curso
                        mensaje = "Autorizado a ingresar al curso "+ horario.curso.nombre+" ("+horario.nombre+")"
                    }
                }
            }
        }

        if ( !autorizado && (usuario.estadoMembresia.estado.equalsIgnoreCase("Activo"))) {
            autorizado = true
            mensaje = "Autorizado a ingresar al recito"
        }

        //response.nombre = usuario.nombre
        response.autorizado = autorizado
        response.mensaje = mensaje
        System.out.println(mensaje)
        render response as JSON
    }*/

    @Secured(['permitAll'])
    def discrimina(){
        def usuario = UserSocio.get(params?.id)
        def minutosGracia = params?.gracia as Integer
        def now = new Date()
        def response = [:]
        def autorizado = false
        def mensaje = "Hubo un problema, comuníquese con un operador."
        def curso = ""

        // Discrimina según curso
        usuario.horarios.each { horario ->
            horario.fechas.each { fecha ->
                if (fecha.dayOfWeek == now.day){
                    Date endOri = fecha.end_date
                    Date end = new Date(hours: endOri.hours, minutes: endOri.minutes, seconds: endOri.seconds)
                    Date startOri = new Date(hours: fecha.start_date.hours, minutes: fecha.start_date.minutes, seconds: fecha.start_date.seconds)
                    //System.out.println("Date original "+startOri.toString()+" menos "+minutosGracia+" = ")
                    if (startOri.minutes < 10){
                        startOri.hours = startOri.hours -1
                        startOri.minutes = startOri.minutes + 60
                    }
                    startOri.minutes = startOri.minutes - minutosGracia
                    Date start = new Date(hours: startOri.hours, minutes: startOri.minutes, seconds: startOri.seconds)
                    //System.out.println(start.toString())

                    if ((now >= start) && (now <= end)){
                        autorizado = true
                        curso = horario.curso.nombre+" ("+horario.nombre+")"
                        response.cursoId = horario.cursoId
                        mensaje = "Autorizado a ingresar al curso "+ horario.curso.nombre+" ("+horario.nombre+")"
                    }
                }
            }
        }

        if ( !autorizado && (usuario.estadoMembresia.estado.equalsIgnoreCase("Activo"))) {
            autorizado = true
            mensaje = "Autorizado a ingresar al recinto"

            List<Visita> visitaInstanceList = new Visita().findAllWhere(usuario: usuario)
            if (!visitaInstanceList.isEmpty()){
                def visitaInstance = visitaInstanceList.last()
                LocalDate lastFechaLocalDate = LocalDate.fromDateFields(visitaInstance.fechaDeVisita)
                DateTime horaLastVisita = new DateTime(visitaInstance.horaDeEntrada);
                DateTime dateTimeLastVisita = new DateTime(lastFechaLocalDate.getYear(), lastFechaLocalDate.getMonthOfYear(), lastFechaLocalDate.getDayOfMonth(), horaLastVisita.getHourOfDay(), horaLastVisita.getMinuteOfHour(), horaLastVisita.getSecondOfMinute())
                if ((dateTimeLastVisita.toDateMidnight()) == (new DateTime(new Date()).toDateMidnight())) {
                    if (Seconds.secondsBetween(dateTimeLastVisita, DateTime.now()).seconds > 20) {
                        mensaje = "Usted ya ingresó hoy a las " + visitaInstance.horaDeEntrada.format("HH:mm") + ", no puede ingresar nuevamente."
                        autorizado = false
                    }
                }
            }
        }

        response.curso = curso
        response.autorizado = autorizado
        response.mensaje = mensaje
        return response
    }

    @Secured(['permitAll'])
    def ultimaVisita(){
//        def usuario = UserSocio.get(params?.id)
        /*def curso
        def cursoId*/
        def autorizado = false
        def mensaje = "Hubo un problema, comuníquese con un operador."
        def response = [:]
//        def diaOk = true

        /*def visitaInstance = new Visita().findAllWhere(usuario: usuario).last()
        if (visitaInstance){
                if ((new DateTime(visitaInstance.fechaDeVisita).toDateMidnight()) == (new DateTime(new Date()).toDateMidnight())){
                    mensaje = "Usted ya ingreso hoy a las "+visitaInstance.horaDeEntrada.format("HH:mm")+", no puede ingresar nuevamente."
                    diaOk = false
                    autorizado = false
                }
        }

        if ((!visitaInstance) || (diaOk)){*/
            def result = discrimina()
            /*curso = result.curso
            cursoId = result.cursoId
            autorizado = result.autorizado
            mensaje = result.mensaje*/
//        }

        response.curso = result.curso
        response.cursoId = result.cursoId
        response.autorizado = result.autorizado
        response.mensaje = result.mensaje
        System.out.println(result.mensaje)
        render response as JSON
    }

    @Secured(['permitAll'])
    def estoyVivo(){
        def response = [:]
        response.vivo = true
        response.mensaje = "Servidor andando desde el "+ Configuracion.findByNombre("uptime").valor

        render response as JSON
    }


}
