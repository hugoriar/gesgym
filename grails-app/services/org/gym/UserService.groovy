package org.gym

import org.gym.fichaMedica.CondicionMedica
import org.gym.fichaMedica.Profesional

import java.security.SecureRandom

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

        userInstance = save(params, userInstance)
        saveHistorialMembresias(params, userInstance)
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
//                render(view: "create", model: [shiroUserInstance: shiroUserInstance])
            return null
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


    }

