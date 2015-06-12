package org.control

import groovy.time.TimeCategory
import org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib
import org.control.ContactoEmergencia
import org.control.DireccionEmpresa
import org.control.DireccionUsuario
import org.control.Empresa
import org.control.EstadoMembresia
import org.control.HistorialMembresias
import org.control.LogCambiosDeEstado
import org.control.Matricula
import org.control.Modalidad
import org.control.Pago
import org.control.UserSocio
import org.control.fichaMedica.CondicionMedica
import org.control.fichaMedica.Profesional
import org.control.ventas.FotoProducto
import org.joda.time.DateTime
import org.springframework.context.i18n.LocaleContextHolder
import org.springframework.context.MessageSource
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.security.SecureRandom
import java.text.SimpleDateFormat

//transient  springSecurityService

/**
 * UserService
 * A service class encapsulates the core business logic of a Grails application
 */
class UserService implements MessageSourceAware{
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm")
    private MessageSource messageSource;
    def utilService

    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    def grailsApplication
    def springSecurityService

    def saveSocio(params, userInstance){
        //       Guardamos la empresa
        def empresaInstance = new Empresa(params)
        // Si el usuario tiene empresa...
        if  (empresaInstance?.nombreEmpresa){
//          ...se le asigna la dirección a la empresa...
            empresaInstance.direccionEmpresa = new DireccionEmpresa(params)
//          ...y se guarda...
            if (!empresaInstance.save()) {
                return
            } else  {
//              ... y se le asigna la empresa al usuario
                userInstance.empresa = empresaInstance
            }
        }

        userInstance = save(params, userInstance)
        return userInstance
    }

    def savePersonal(params, userInstance){
//        def userInstance = new UserPersonal(params)
        save(params, userInstance)
    }

    def saveInstructor(params, userInstance){
//        def userInstance = new UserPersonalInstructor(params)
        save(params, userInstance)
    }

    def save(params, userInstance) {
        // Guardamos el "Contacto de Emergencia"
        userInstance.contactoEmergencia= new ContactoEmergencia(params)

        // Guardamos el Domicilio
        userInstance.domicilio         = new DireccionUsuario(params)

        // Guardamos la "Condición Médica" (si es que tiene)
        def condicionMedicaInstance = new CondicionMedica(params)
        if (condicionMedicaInstance?.condicion) {
            userInstance.condicionMedica = condicionMedicaInstance
            // Guardamos al "Profesional Tratante" de la condición médica del usuario (si es que tiene)
            def profesionalInstance = new Profesional(params)
            if (profesionalInstance?.nombreProfesional) {
                // ...se guarda...
                if (!profesionalInstance.save()) {
//                    render(view: "create", model: [userSocioInstance: userSocioInstance])
                    return
                } else {
                    // ... y se le asigna el profesional tratante a la condición médica del usuario
                    userInstance.condicionMedica.profesional = profesionalInstance
                }
            }
        }

//        def password = ""
//        if (!userInstance.password) {
//            password = new BigInteger(130, new SecureRandom()).toString(32)
//            userInstance.password = new Sha512Hash(password).toHex()
//            userInstance.password = springSecurityService.encodePassword(password)
//        }
//        userInstance.passwordChangeRequiredOnNextLogon = true
        if (!userInstance.save()) {
            if (userInstance.hasErrors()){
                return [condicion: Boolean.FALSE, errores: userInstance.errors.fieldErrors]
            }
        }
        /*sendMail {
            to userInstance.email
            from grailsApplication.config.grails.mail.username
            subject "Su cuenta ha sido creada exitosamente!"
            body """Hola ${userInstance.nombre} ${userInstance.apellidoPaterno},\n
Su cuenta ha sido creada exitosamente!\n
Este es su usuario : ${userInstance.username}
Este es su password* : ${password}
* Se le pedirá cambiarlo en su próximo inicio de sesión\n
Puede acceder haciendo click en el siguiente enlace ${new ApplicationTagLib().createLink(absolute: true, uri: '/')}\n\n
Saludos cordiales,\n
${grailsApplication.config.company.name}
${grailsApplication.config.company.address}
${grailsApplication.config.company.phone}
${grailsApplication.config.company.city}
${grailsApplication.config.company.country}""".toString()
        }*/

        return userInstance
    }

    def saveHistorialMembresias(params, userInstance){
        //       Guardamos detalles del plan
        def historialMembresias = new HistorialMembresias(params)
        historialMembresias.usuario = userInstance
        historialMembresias.pago = new Pago(params)
//        historialMembresias.pago.fecha = new Date().parse("dd-MM-yyyy", params.fecha)
        historialMembresias.matricula = Matricula.findById(Long.valueOf(params.matricula.id))
        if (!HistorialMembresias.findByMatricula(historialMembresias.matricula)){
            if (!historialMembresias.save()) {
                return historialMembresias.errors.fieldErrors.toString()
            }
        } else {
            return "Membresía duplicada, elimine la membresía y vuelva a intentarlo"
        }
    }

    def updateSocio(params, userInstance){
//        def userInstance = new UserSocio(params)

        //       Guardamos la empresa
        def empresaInstance = new Empresa(params)
        // Si el usuario tiene empresa...
        if  (empresaInstance?.nombreEmpresa){
//          ...se le asigna la dirección a la empresa...
            empresaInstance.direccionEmpresa = new DireccionEmpresa(params)
//          ...y se guarda...
            if (!empresaInstance.save()) {
//                render(view: "create", model: [userSocioInstance: userSocioInstance])
                return
            } else  {
//              ... y se le asigna la empresa al usuario
                userInstance.empresa = empresaInstance
            }
        }
        return update(params, userInstance)
    }

    def updatePassword(params, userInstance){
//        def userInstance = new UserSocio(params)


        return update(params, userInstance)
    }

    def updatePersonal(params, userInstance){
//        def userInstance = new UserPersonal(params)
        update(params, userInstance)
    }

    def updateInstructor(params, userInstance){
//        def userInstance = new UserPersonalInstructor(params)
        update(params, userInstance)
    }

    def update(params, userInstance) {
        def CommonsMultipartFile uploadedFile = params.foto
        if (uploadedFile.size == 0L) {
            params.foto = userInstance?.foto
            userInstance.properties = params
            userInstance?.foto = params.foto
        } else{
            userInstance.properties = params
        }

        // Actualizamos el "Contacto de Emergencia"
        def contactoEmergenciaInstance = ContactoEmergencia.findById(userInstance.contactoEmergenciaId)
        if (!contactoEmergenciaInstance) {
            contactoEmergenciaInstance = new ContactoEmergencia(params)
            contactoEmergenciaInstance.usuario = userInstance
        } else {
            contactoEmergenciaInstance.properties = params
        }
        if (!contactoEmergenciaInstance.save()) {
//            render(view: "edit", model: [contactoEmergenciaInstance: contactoEmergenciaInstance])
            return
        }
        userInstance.contactoEmergencia = contactoEmergenciaInstance

        // Actualizamos el Domicilio
        def direccionInstance = DireccionUsuario.findById(userInstance.domicilioId)
        if (!direccionInstance) {
            direccionInstance = new DireccionUsuario(params)
            direccionInstance.usuario = userInstance
        } else {
            direccionInstance.properties = params
        }
        if (!direccionInstance.save()) {
//            render(view: "edit", model: [direccionInstance: direccionInstance])
            return
        }
        userInstance.domicilio = direccionInstance

        // Actualizamos la "Condición Médica"
        def condicionMedicaInstance = CondicionMedica.findById(userInstance.condicionMedicaId)
        if (!condicionMedicaInstance) {
            condicionMedicaInstance = new CondicionMedica(params)
            condicionMedicaInstance.usuario = userInstance
        } else {
            condicionMedicaInstance.properties = params
        }
        condicionMedicaInstance.usuario = userInstance
        if (!condicionMedicaInstance.save()) {
//            render(view: "edit", model: [condicionMedicaInstance: condicionMedicaInstance])
            return
        }
        userInstance.condicionMedica = condicionMedicaInstance

        // Actualizamos al "Profesional Tratante"
        def profesionalInstance = Profesional.findById(userInstance.condicionMedicaId)
        if (!profesionalInstance) {
            profesionalInstance = new Profesional(params)
        } else {
            profesionalInstance.properties = params
        }
        if (!profesionalInstance.save()) {
//            render(view: "edit", model: [profesionalInstance: profesionalInstance])
            return
        }
        userInstance.condicionMedica.profesional = profesionalInstance

        return userInstance
    }

    def getUsuariosFiltrados(params){
        /*Date desde              = params.desde?(new SimpleDateFormat("dd-MM-yyyy").parse(params.desde?.toString())):(new Date())
        Date hasta              = params.hasta?(new SimpleDateFormat("dd-MM-yyyy").parse(params.hasta?.toString())):(new Date())*/
        Date desde              = params.desde ? sdf.parse(params.desde) : new DateTime().minusDays(7).withTimeAtStartOfDay().toDate()
        Date hasta              = params.hasta ? sdf.parse(params.hasta) : new DateTime().plusDays(1).withTimeAtStartOfDay().minusMinutes(1).toDate()
        Long estadoMembresiaId  = Long.valueOf(params?.estadoMembresiaId?:0L)
        Long planId             = Long.valueOf(params?.planId?:0L)
        String sort             = params?.sort?:"historialMembresias.fechaFin"
        Boolean soloExpirados   = params?.soloExpirados?Boolean.valueOf(params.soloExpirados):false
        Boolean soloInactivos   = params?.soloInactivos?Boolean.valueOf(params.soloInactivos):false
        Boolean usarFechas      = params?.usarFechas?Boolean.valueOf(params.usarFechas):false
        String order            = params?.order?:"asc"
        String operacion        = params?.operacion?:null

        // Retorna listado de usuarios filtrado y ordenado
        return getUsuariosFiltrados(estadoMembresiaId, planId, desde, hasta, sort, order, soloExpirados, soloInactivos, usarFechas, operacion)
    }

    def getUsuariosFiltrados(Long estadoMembresiaId, Long planId, Date desde, Date hasta, String sort, String order, Boolean soloExpirados, Boolean soloInactivos, Boolean usarFechas, String operacion){
        List<UserSocio> userSocioInstanceList
        List<UserSocio> userSocioInstanceListTempRangoFechas = new ArrayList<UserSocio>()
        List<UserSocio> userSocioInstanceListPlanes = new ArrayList<UserSocio>()
        List userSocioInstanceListFechaNacimientoTemp = new ArrayList<>()
        List<UserSocio> userSocioInstanceListSoloTempExpirados = new ArrayList<UserSocio>()
//        def start = System.currentTimeMillis()
        switch (estadoMembresiaId){
            case 0:
//                userSocioInstanceList = UserSocio.list([cache: true])
                userSocioInstanceList = UserSocio.findAll()
                break
            case -1:
                userSocioInstanceList = UserSocio.findAllByEstadoMembresiaNotEqual(EstadoMembresia.get(2))
                break
            default:
                userSocioInstanceList = UserSocio.findAllWhere(estadoMembresia: EstadoMembresia.get(estadoMembresiaId))
                break
        }
//        println "Cumpleaños: ${System.currentTimeMillis() - start} secs."*/

        if (planId != 0) {
            userSocioInstanceList.each {
                if (it.historialMembresias.size() > 0) {
                    if ((it.ultimoPlan?.planId == planId)) {
                        userSocioInstanceListPlanes.add(it)
                    }
                }
            }
            userSocioInstanceList = userSocioInstanceListPlanes
        }

//        if (!operacion?.equalsIgnoreCase("cumpleanos")){
            if (usarFechas){
                userSocioInstanceList.each {
                    if (it.historialMembresias.size()>0) {
                        //System.out.println(it.ultimoPlan?.fechaFin?.toString()+" v/s "+desde+" | "+it.ultimoPlan?.fechaFin?.toString()+" v/s "+hasta)
                        if ((it.ultimoPlan?.fechaFin >= desde) && (it.ultimoPlan?.fechaFin <= hasta)){
                            userSocioInstanceListTempRangoFechas.add(it)
                        }
                    }
                }
                userSocioInstanceList = userSocioInstanceListTempRangoFechas
            }

            userSocioInstanceList = (sort.equalsIgnoreCase("historialMembresias.fechaFin"))?userSocioInstanceList.sort{if (it.historialMembresias.size()>0)it.ultimoPlan?.fechaFin}:userSocioInstanceList.sort{it."$sort"}
            if (sort.equalsIgnoreCase("ultimaVisita")){
                userSocioInstanceList = userSocioInstanceList.sort{it.getUltimaVisita()?.fechaDeVisita}
            }
        /*} else {
            Date fechaDesdeTemp = desde?.parse("dd-MM-yyyy", desde.date+"-"+desde.month+"-1900")
            Date fechaHastaTemp = hasta?.parse("dd-MM-yyyy", hasta.date+"-"+hasta.month+"-1900")
            for (userSocioInstance in userSocioInstanceList) {
                if (userSocioInstance?.fechaNacimiento) {
                    Date fechaNacimientoTemp = userSocioInstance.fechaNacimiento?.parse("dd-MM-yyyy", userSocioInstance.fechaNacimiento.date + "-" + userSocioInstance.fechaNacimiento.month + "-1900")
                    if ((fechaNacimientoTemp >= fechaDesdeTemp) && (fechaNacimientoTemp <= fechaHastaTemp)) {
                        userSocioInstanceListFechaNacimientoTemp.add("id": userSocioInstance.id, "fechaNacimientoTemp": fechaNacimientoTemp)
                    }
                }
            }
            userSocioInstanceListFechaNacimientoTemp = (sort.equalsIgnoreCase("fechaNacimiento"))?userSocioInstanceListFechaNacimientoTemp.sort{it.fechaNacimientoTemp}:userSocioInstanceListFechaNacimientoTemp.sort{it."$sort"}

            for (userSocioInstance in userSocioInstanceListFechaNacimientoTemp) {
                def usuarioInstance = UserSocio.get(userSocioInstance.id)
                userSocioInstanceListTempRangoFechas.add(usuarioInstance)
            }
            userSocioInstanceList = userSocioInstanceListTempRangoFechas

        }*/

        if (soloExpirados){
            userSocioInstanceList.each {
                if (it.historialMembresias.size()>0){
                    if (it.getUltimoPlan().fechaFin < (new Date())){
                        userSocioInstanceListSoloTempExpirados.add(it)
                    }
                }
            }
            userSocioInstanceList = userSocioInstanceListSoloTempExpirados
        }

        if (soloInactivos){
            userSocioInstanceList.each {
                if (it.visitas.size()>0){
                    if (-(TimeCategory.minus(it.getUltimaVisita().fechaDeVisita, new Date()).days) > 30){
                        userSocioInstanceListSoloTempExpirados.add(it)
                    }
                } else {
                    userSocioInstanceListSoloTempExpirados.add(it)
                }
            }
            userSocioInstanceList = userSocioInstanceListSoloTempExpirados
        }

        userSocioInstanceList = order.equalsIgnoreCase("asc")?userSocioInstanceList:userSocioInstanceList.reverse()
        return userSocioInstanceList

    }

    def getListaEstadoMembresia(params){
        def estadoMembresiaList = new ArrayList<EstadoMembresia>()
        def estadoMembresia = new EstadoMembresia(estado: "Todos", descripcion: "Todos los registros")
        estadoMembresia.setId(0)
        estadoMembresiaList.add(estadoMembresia)
        estadoMembresia     = new EstadoMembresia(estado: "Todos Menos los Vencidos", descripcion: "Todos los usuario, menos los vencidos")
        estadoMembresia.setId(-1)
        estadoMembresiaList.add(estadoMembresia)
        estadoMembresiaList.addAll(EstadoMembresia.list())

        return estadoMembresiaList
    }

    def getListaPlan(){
        def planList = new ArrayList<Plan>()
        def plan = new Plan(nombre: "Todos", descripcion: "Todos los registros")
        plan.setId(0)
        planList.add(plan)
        // Para agregar otros pre-datos al dropdown
        /*plan     = new Plan(nombre: "Todos Menos los Vencidos", descripcion: "Todos los usuario, menos los vencidos")
        plan.setId(-1)
        planList.add(plan)*/
        planList.addAll(Plan.list())

        return planList
    }

    def cambiaEstadoAuto() {
        String msjeFlash
        log.info "Entrando a cambiaEstadoAutoAInactivo()..."
        def respcambiaEstadoAutoAInactivo = cambiaEstadoAutoAInactivo()
        log.info "Saliendo de cambiaEstadoAutoAInactivo()... "+respcambiaEstadoAutoAInactivo.cont+" con nuevo estado: "+respcambiaEstadoAutoAInactivo.estadoMembresiaInstance.estado
        msjeFlash = "Cambiado(s) "+respcambiaEstadoAutoAInactivo.cont+" usuario(s) con nuevo estado: "+respcambiaEstadoAutoAInactivo.estadoMembresiaInstance.estado

        log.info "Entrando a cambiaEstadoAutoAActivo()..."
        def cambiaEstadoAutoAActivo = cambiaEstadoAutoAActivo()
        log.info "Saliendo de cambiaEstadoAutoAActivo()... "+cambiaEstadoAutoAActivo.cont+" con nuevo estado: "+cambiaEstadoAutoAActivo.estadoMembresiaInstance.estado
        return msjeFlash + System.getProperty("line.separator") + "Cambiado(s) "+cambiaEstadoAutoAActivo.cont+" usuario(s) con nuevo estado: "+cambiaEstadoAutoAActivo.estadoMembresiaInstance.estado
    }

    def cambiaEstadoAutoAInactivo() {
        def List<UserSocio> userSocioInstanceList = new ArrayList<UserSocio>()
        Boolean marcarParaExpirar

        // today
        Calendar hoyMedianoche = new GregorianCalendar();
        // reset hour, minutes, seconds and millis
        hoyMedianoche.set(Calendar.HOUR_OF_DAY, 23);
        hoyMedianoche.set(Calendar.MINUTE, 59);
        hoyMedianoche.set(Calendar.SECOND, 59);
        hoyMedianoche.set(Calendar.MILLISECOND, 0);

        // Recorre a todos los usuarios activos: si cualquiera de sus membresías es mayor o igual a hoy, se le marca para NO expirarlo
        // En otras palabras, se expirará a todos los usuarios activos a menos que tengan al menos 1 membresía vigente
        List<UserSocio> listUserSocio = UserSocio.findAllByEstadoMembresia(EstadoMembresia.findById(1L))
        listUserSocio.each{
            marcarParaExpirar = true
            if (it.historialMembresias.size() > 0){
                it.historialMembresias.each {
                    if (it.fechaFin > (hoyMedianoche.getTime()-1)) marcarParaExpirar = false  // Si esta membresía expira desde hoy, el usuario debería seguir Activo
                }
                if (marcarParaExpirar) {
                    if (!userSocioInstanceList.contains(it)){
                        userSocioInstanceList.add(it)
                    }
                }
            }
        }

        def cont = 0
        def estadoMembresiaInstance = EstadoMembresia.get(2L)
        Date fechaDeOperacion = new Date()
        Modalidad modalidad = Modalidad.get(1L)
        userSocioInstanceList.each {
            cont = ejecutaCambioEstado(it, fechaDeOperacion, it.estadoMembresia, estadoMembresiaInstance, modalidad, cont)
        }
        return [cont: cont, estadoMembresiaInstance: estadoMembresiaInstance, userSocioInstanceList: userSocioInstanceList]
    }

    def cambiaEstadoAutoAActivo() {
        def List<UserSocio> userSocioInstanceList = new ArrayList<UserSocio>()

        // today
        Calendar hoyMedianoche = new GregorianCalendar();
        // reset hour, minutes, seconds and millis
        hoyMedianoche.set(Calendar.HOUR_OF_DAY, 23);
        hoyMedianoche.set(Calendar.MINUTE, 59);
        hoyMedianoche.set(Calendar.SECOND, 59);
        hoyMedianoche.set(Calendar.MILLISECOND, 0);

        List<HistorialMembresias> listHistorialMembresias = HistorialMembresias.findAllByFechaFinGreaterThanEquals(hoyMedianoche.getTime())sort { it.fechaFin }
        listHistorialMembresias.each {
            if (it.usuario.estadoMembresia?.id == 2){               // Si el usuario está como inactivo
                if (!userSocioInstanceList.contains(it.usuario)){   // y no ha sido agregado a la lista
                    userSocioInstanceList.add(it.usuario)           // agregarlo a lista para "activar"
                }
            }
        }

        def cont = 0
        def estadoMembresiaInstance = EstadoMembresia.get(1L)
        Date fechaDeOperacion = new Date()
        Modalidad modalidad = Modalidad.get(1L)
        userSocioInstanceList.each {
            cont = ejecutaCambioEstado(it, fechaDeOperacion, it.estadoMembresia, estadoMembresiaInstance, modalidad, cont)
        }
        return [cont: cont, estadoMembresiaInstance: estadoMembresiaInstance, userSocioInstanceList: userSocioInstanceList]
    }

    def ejecutaCambioEstado(UserSocio userSocioInstance, Date fechaDeOperacion, EstadoMembresia estadoAntiguo, EstadoMembresia estadoMembresiaInstance, Modalidad modalidad, Long cont) {
        userSocioInstance.estadoMembresia = estadoMembresiaInstance
        if (userSocioInstance.save(flush: true)) {
            def logCambiosDeEstadoInstance = new LogCambiosDeEstado(fechaDeOperacion: fechaDeOperacion, socio: userSocioInstance, estadoAntiguo: estadoAntiguo, estadoNuevo: estadoMembresiaInstance, modalidad: modalidad)
            if (!logCambiosDeEstadoInstance.save()) {
                return
            }
            cont++
        } else {
            def locale = Locale.getDefault()
            def String observaciones = ""
            for (fieldErrors in userSocioInstance.errors) {
                for (error in fieldErrors.allErrors) {
                    observaciones += messageSource.getMessage(error, locale)
                }
            }
            //utilService.logCambiosDeEstado(fechaDeOperacion, userSocioInstance, estadoAntiguo, estadoMembresiaInstance, modalidad, "Modificación no realizada: "+observaciones)
            def logCambiosDeEstadoInstance = new LogCambiosDeEstado(fechaDeOperacion: fechaDeOperacion, socio: userSocioInstance, estadoAntiguo: estadoAntiguo, estadoNuevo: estadoMembresiaInstance, modalidad: modalidad, observaciones: "Modificación no realizada: "+observaciones)
            if (!logCambiosDeEstadoInstance.save()) {
                return
            }
        }
        return cont
    }

    def buscadorSocio(params){
        def query = {
            or {
                like("nombre", "${params.term}%") // term is the parameter send by jQuery autocomplete
                like("apellidoPaterno", "${params.term}%")
                like("apellidoMaterno", "${params.term}%")
//                like("rut", "${params.term}%")
            }
            projections { // good to select only the required columns.
                property("id")
                property("nombre")
                property("apellidoPaterno")
            }
        }
        def clist = UserSocio.createCriteria().list(query) // execute  to the get the list of companies
        def userSocioSelectList = [] // to add each company details
        clist.each {
            def userSocioMap = [:] // add to map. jQuery autocomplete expects the JSON object to be with id/label/value.
            userSocioMap.put("id", it[0])
            userSocioMap.put("apellidoPaterno", it[2])
//            userSocioMap.put("value", it[2])
            userSocioMap.put("nombre", it[1]) // will use this to pre-populate the Emp Id
            userSocioSelectList.add(userSocioMap) // add to the arraylist
        }
        return userSocioSelectList
    }



}

