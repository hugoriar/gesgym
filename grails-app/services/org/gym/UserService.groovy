package org.gym

import org.gym.fichaMedica.CondicionMedica
import org.gym.fichaMedica.Profesional

import java.security.SecureRandom
import java.text.SimpleDateFormat

//transient  springSecurityService

/**
 * UserService
 * A service class encapsulates the core business logic of a Grails application
 */
class UserService {

    def grailsApplication
    def springSecurityService

    def complist(params){
        def query = {
            or {
                like("nasdaqSymbol", "${params.term}%") // term is the parameter send by jQuery autocomplete
                like("companyName", "${params.term}%")
            }
            projections { // good to select only the required columns.
                property("id")
                property("nasdaqSymbol")
                property("companyName")
            }
        }
        def clist = UserSocio.createCriteria().list(query) // execute  to the get the list of companies
        def userSocioSelectList = [] // to add each company details
        clist.each {
            def userSocioMap = [:] // add to map. jQuery autocomplete expects the JSON object to be with id/label/value.
            userSocioMap.put("id", it[0])
            userSocioMap.put("label", it[2])
            userSocioMap.put("value", it[2])
            userSocioMap.put("nasSymbol", it[1]) // will use this to pre-populate the Emp Id
            userSocioSelectList.add(userSocioMap) // add to the arraylist
        }
        return userSocioSelectList
    }

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

        def password = ""
        if (!userInstance.password) {
            password = new BigInteger(130, new SecureRandom()).toString(32)
//            userInstance.password = new Sha512Hash(password).toHex()
            userInstance.password = springSecurityService.encodePassword(password)
        }
//        userInstance.passwordChangeRequiredOnNextLogon = true
        if (!userInstance.save(flush: true)) {
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
        def pagoInstance = new Pago(params)
        if (!pagoInstance.save()) {
//            render(view: "create", model: [userSocioInstance: userSocioInstance])
            return
        }

        //       Guardamos detalles del plan
        def historialMembresias = new HistorialMembresias(params)
        historialMembresias.usuario = userInstance
        historialMembresias.pago = pagoInstance
        historialMembresias.matricula = Matricula.findById(Long.valueOf(params.matriculaInstanceId))
        if (!historialMembresias.save()) {
//            render(view: "create", model: [userSocioInstance: userSocioInstance])
            return
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

    def updatePersonal(params, userInstance){
//        def userInstance = new UserPersonal(params)
        update(params, userInstance)
    }

    def updateInstructor(params, userInstance){
//        def userInstance = new UserPersonalInstructor(params)
        update(params, userInstance)
    }

    def update(params, userInstance) {
        userInstance.properties = params

        // Actualizamos el "Contacto de Emergencia"
        def contactoEmergenciaInstance = ContactoEmergencia.findById(userInstance.contactoEmergenciaId)
        if (!contactoEmergenciaInstance) {
            contactoEmergenciaInstance = new ContactoEmergencia(params)
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
        Date desde              = params.desde?(new SimpleDateFormat("dd-MM-yyyy").parse(params.desde?.toString())):(new Date())
        Date hasta              = params.hasta?(new SimpleDateFormat("dd-MM-yyyy").parse(params.hasta?.toString())):(new Date())
        Long estadoMembresiaId  = Long.valueOf(params?.estadoMembresiaId?:0L)
        String sort             = params?.sort?:"historialMembresias.fechaFin"
        Boolean soloExpirados   = params?.soloExpirados?Boolean.valueOf(params.soloExpirados):false
        Boolean usarFechas      = params?.usarFechas?Boolean.valueOf(params.usarFechas):false
        String order            = params?.order?:"asc"
        String operacion        = params?.operacion?:null

        // Retorna listado de usuarios filtrado y ordenado
        return getUsuariosFiltrados(estadoMembresiaId, desde, hasta, sort, order, soloExpirados, usarFechas, operacion)
    }

    def getUsuariosFiltrados(Long estadoMembresiaId, Date desde, Date hasta, String sort, String order, Boolean soloExpirados, Boolean usarFechas, String operacion){
        List<UserSocio> userSocioInstanceList
        List<UserSocio> userSocioInstanceListTempRangoFechas = new ArrayList<UserSocio>()
        List userSocioInstanceListFechaNacimientoTemp = new ArrayList<>()
        List<UserSocio> userSocioInstanceListSoloTempExpirados = new ArrayList<UserSocio>()
        switch (estadoMembresiaId){
            case 0:
                userSocioInstanceList = UserSocio.findAll()
                break
            case -1:
                userSocioInstanceList = UserSocio.findAllByEstadoMembresiaNotEqual(EstadoMembresia.get(2))
                break
            default:
                userSocioInstanceList = UserSocio.findAllWhere(estadoMembresia: EstadoMembresia.get(estadoMembresiaId))
                break
        }

        if (!operacion?.equalsIgnoreCase("cumpleanos")){
            if (usarFechas){
                userSocioInstanceList.each {
                    if (it.historialMembresias.size()>0) {
                        if ((it.historialMembresias.last()?.fechaFin >= desde) && (it.historialMembresias.last()?.fechaFin <= hasta)){
                            userSocioInstanceListTempRangoFechas.add(it)
                        }
                    }
                }
                userSocioInstanceList = userSocioInstanceListTempRangoFechas
            }
            userSocioInstanceList = (sort.equalsIgnoreCase("historialMembresias.fechaFin"))?userSocioInstanceList.sort{if (it.historialMembresias.size()>0)it.historialMembresias.last()?.fechaFin}:userSocioInstanceList.sort{it."$sort"}
        } else {
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

        }

        if (soloExpirados){
            userSocioInstanceList.each {
                if (it.historialMembresias.size()>0){
                    if (it.historialMembresias.last()?.fechaFin < (new Date())){
                        userSocioInstanceListSoloTempExpirados.add(it)
                    }
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

    def cambiaEstadoAuto() {
        def List<UserSocio> userSocioInstanceList = new ArrayList<UserSocio>()
//        Buscamos a los HistorialMembresias "vencidos"

        // today
        Calendar hoyMedianoche = new GregorianCalendar();
// reset hour, minutes, seconds and millis
        hoyMedianoche.set(Calendar.HOUR_OF_DAY, 23);
        hoyMedianoche.set(Calendar.MINUTE, 59);
        hoyMedianoche.set(Calendar.SECOND, 59);
        hoyMedianoche.set(Calendar.MILLISECOND, 0);


        List<HistorialMembresias> listHistorialMembresias = HistorialMembresias.findAllByFechaFinLessThan(hoyMedianoche.getTime())sort { it.fechaFin }
        listHistorialMembresias.each {
            if (it.usuario.estadoMembresia?.id == 1){
                userSocioInstanceList.add(it.usuario)
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

    def ejecutaCambioEstado(UserSocio userSocioInstance, Date fechaDeOperacion, EstadoMembresia estadoAntiguo, EstadoMembresia estadoMembresiaInstance, Modalidad modalidad, Long cont) {
        userSocioInstance.estadoMembresia = estadoMembresiaInstance
        if (userSocioInstance.save()) {
            def logCambiosDeEstadoInstance = new LogCambiosDeEstado(fechaDeOperacion: fechaDeOperacion, socio: userSocioInstance, estadoAntiguo: estadoAntiguo, estadoNuevo: estadoMembresiaInstance, modalidad: modalidad)
            if (!logCambiosDeEstadoInstance.save()) {
                return
            }
            cont++
        }
        return cont
    }

    }

