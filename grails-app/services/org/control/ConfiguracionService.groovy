package org.control

import grails.validation.ValidationException
import org.control.Configuracion
import org.control.Enrolamiento
import org.control.HistorialMembresias
import org.control.Matricula
import org.control.Pago
import org.control.Plan
import org.control.UserPersonal
import org.control.UserSocio

/**
 * ConfiguracionService
 * A service class encapsulates the core business logic of a Grails application
 */
class ConfiguracionService {

    static transactional = true

    def procesaEnrolamiento(){
        Integer cont = 0
        String mensaje, resumen = ""
        // Agarramos todas las matrículas
        List <Enrolamiento> listEnrolamiento = new Enrolamiento().findAll()
        listEnrolamiento.each(){
            newItem(it.fechaEnrolamiento, it.enroladoPor, it.user)
        }
    }

    def procesaMatriculas(){
        Integer cont = 0
        String mensaje, resumen = ""
        // Agarramos todas las matrículas
        List <UserSocio> listUserSocio = new UserSocio().findAll()
        listUserSocio.each(){

            /* MATRICULA */
            Matricula matriculaInstance = Matricula.findBySocio(it)
            if (!matriculaInstance){
                matriculaInstance = new Matricula(
                        fechaMatricula: new Date(0, 1, 1),
                        matriculadoPor: UserPersonal.findById(1),
                        dateCreated: new Date(),
                        socio: it)
            }
            // Si la matricula no tiene pago, se le crea y asigna uno
            if ((matriculaInstance?.pagoMatriculaId == 0) || (matriculaInstance.pagoMatriculaId == null)) {
                // ... y le actualizamos la matrícula
                matriculaInstance.pagoMatricula = new Pago()
                if (!matriculaInstance.dateCreated) matriculaInstance.dateCreated = new Date()
                try {
                    matriculaInstance.save(flush: true)
                    //  log.info "Guardado "+matriculaInstance.id
                    cont++
                    resumen+="Guardado matriculaInstance "+matriculaInstance.id+"\n"
                }
                catch (ValidationException e) {
                    // deal with exception
                    log.debug e.fullMessage
                }
            }

            /* HISTORIALMEMBRESIA*/
            Boolean salvarHistorialMembresiasInstance
            HistorialMembresias historialMembresiasInstance = HistorialMembresias.findByUsuario(it)
            if (!historialMembresiasInstance){
                historialMembresiasInstance = new HistorialMembresias(
                        plan: Plan.findById(1),
                        diasCongelacion: 0,
                        fechaInicio: new Date(0, 1, 1),
                        fechaFin: new Date(0, 1, 1),
                        dateCreated: new Date(),
                        autorizadoPor: UserPersonal.findById(1),
                        usuario: it)
            }
            // Si la matricula no tiene pago, se le crea y asigna uno
            if ((historialMembresiasInstance.pagoId == 0) || (historialMembresiasInstance.pagoId == null)) {
                historialMembresiasInstance.pago = new Pago()
                salvarHistorialMembresiasInstance = true
            }
            // Si no tiene su matricula asignada, se la busca y se crea
            if ((historialMembresiasInstance.matriculaId == 0) || (historialMembresiasInstance.matriculaId == null)) {
//                historialMembresiasInstance.matricula = Matricula.findBySocio(it)
                historialMembresiasInstance.matricula = matriculaInstance
                salvarHistorialMembresiasInstance = true
            }
            if (salvarHistorialMembresiasInstance){
                try {
                    historialMembresiasInstance.save(flush: true)
                    //  log.info "Guardado "+matriculaInstance.id
                    cont++
                    resumen+="Guardado historialMembresiasInstance "+historialMembresiasInstance.id+"\n"
                }
                catch (ValidationException e) {
                    // deal with exception
                    log.debug e.fullMessage
                }
            }
        }
    }
    /*mensaje = "Cantidad de registros procesados: "+cont+"\n\n"+resumen
    Integer contMatriculas = 0
    String query = "from HistorialMembresias where matricula_id = 0"
    List <HistorialMembresias> listHistorialMembresias = HistorialMembresias.executeQuery(query)
    listHistorialMembresias.each {
        Matricula matricula = new Matricula(
                fechaMatricula: new Date(),
                matriculadoPor: UserPersonal.findById(1),
                socio:          it.usuario,
                pagoMatricula:  new Pago()
        )
        if (matricula.save(flush: true)){
            it.dateCreated = new Date()
            it.matricula = matricula
            contMatriculas++
        }
    }*/
//        return mensaje+= " ***** Matrículas nuevas: " +contMatriculas+ " ***** "

    def newItem(Date fechaMatricula, UserPersonal matriculadoPor, UserSocio socio){
        // Creamos una matrícula nueva...
        Matricula matriculaInstance = new Matricula()
        matriculaInstance.fechaMatricula = fechaMatricula
        matriculaInstance.matriculadoPor = matriculadoPor
        matriculaInstance.pagoMatricula = new Pago()
        matriculaInstance.socio = socio
        if (matriculaInstance) {
            try {
//                ... y la guardamos
                matriculaInstance.save(flush: true)

//                Recuperamos la Membresía del usuario de esa matricula y le actualizamos el índice de matrícula
                HistorialMembresias historialMembresiasInstance = HistorialMembresias.findByUsuario(socio)
                historialMembresiasInstance.matricula = matriculaInstance
                historialMembresiasInstance.dateCreated = new Date()

                if(!historialMembresiasInstance.fechaInicio) historialMembresiasInstance.fechaInicio = new Date(0, 1, 1)
                if(!historialMembresiasInstance.fechaFin) historialMembresiasInstance.fechaFin = new Date(0, 1, 1)
                if(!historialMembresiasInstance.autorizadoPor) historialMembresiasInstance.autorizadoPor = UserPersonal.findById(1)

                try {
                    historialMembresiasInstance.save(flush: true)
                    log.info "Guardado Historial: "+historialMembresiasInstance.id + " Guardado Matricula: "+matriculaInstance.id
                } catch (ValidationException e) {
                    // deal with exception
                    log.info e.fullMessage
                }
//                cont++
//                resumen+="Guardado "+matriculaInstance.id+"\n"
            } catch (ValidationException e) {
                // deal with exception
                log.info e.fullMessage
            }
        }
    }
/*    def procesaYOrdenaMatriculas(){
        Integer cont = 0
        String mensaje, resumen = ""
        // Agarramos todas las matrículas
        List <Matricula> listMatriculas = new Matricula().findAll()
        listMatriculas.each(){
            // Buscamos la membresía de cada usuario...
            HistorialMembresias historialMembresiasInstance = HistorialMembresias.findByUsuario(it.socio)
            if (historialMembresiasInstance) {
                // ... y le actualizamos la matrícula
                historialMembresiasInstance.setMatricula(it)
                historialMembresiasInstance.setDateCreated(new Date())
                try {
                    historialMembresiasInstance.save(flush: true)
//                    log.info "Guardado "+historialMembresiasInstance.id
                    cont++
                    resumen+="Guardado "+historialMembresiasInstance.id+"\n"

                }
                catch (ValidationException e) {
                    // deal with exception
                    log.debug e.fullMessage
                }
            }
        }
        mensaje = "Cantidad de registros procesados: "+cont+"\n\n"+resumen
        Integer contMatriculas = 0
        String query = "from HistorialMembresias where matricula_id = 0"
        List <HistorialMembresias> listHistorialMembresias = HistorialMembresias.executeQuery(query)
        listHistorialMembresias.each {
            Matricula matricula = new Matricula(
                    fechaMatricula: new Date(),
                    matriculadoPor: UserPersonal.findById(1),
                    socio:          it.usuario,
                    pagoMatricula:  new Pago()
            )
            if (matricula.save(flush: true)){
                it.dateCreated = new Date()
                it.matricula = matricula
                contMatriculas++
            }
        }
        return mensaje+= " ***** Matrículas nuevas: " +contMatriculas+ " ***** "
    }*/

/*    def procesaYOrdenaMatriculas(){
        Integer cont = 0
        String mensaje, resumen = ""
        // Agarramos todas las matrículas
        List <Matricula> listMatriculas = new Matricula().findAll()
        listMatriculas.each(){
            // Buscamos la membresía de cada usuario...
            HistorialMembresias historialMembresiasInstance = HistorialMembresias.findByUsuario(it.socio)
            if (historialMembresiasInstance) {
                // ... y le actualizamos la matrícula
                historialMembresiasInstance.setMatricula(it)
                historialMembresiasInstance.setDateCreated(new Date())
                try {
                    historialMembresiasInstance.save(flush: true)
//                    log.info "Guardado "+historialMembresiasInstance.id
                    cont++
                    resumen+="Guardado "+historialMembresiasInstance.id+"\n"

                }
                catch (ValidationException e) {
                    // deal with exception
                    log.debug e.fullMessage
                }
            }
        }
        mensaje = "Cantidad de registros procesados: "+cont+"\n\n"+resumen
        Integer contMatriculas = 0
        String query = "from HistorialMembresias where matricula_id = 0"
        List <HistorialMembresias> listHistorialMembresias = HistorialMembresias.executeQuery(query)
        listHistorialMembresias.each {
            Matricula matricula = new Matricula(
                    fechaMatricula: new Date(),
                    matriculadoPor: UserPersonal.findById(1),
                    socio:          it.usuario,
                    pagoMatricula:  new Pago()
            )
            if (matricula.save(flush: true)){
                it.dateCreated = new Date()
                it.matricula = matricula
                contMatriculas++
            }
        }
        return mensaje+= " ***** Matrículas nuevas: " +contMatriculas+ " ***** "
    }*/

    def nuevaConfiguracion(String nombre, String valor){
        def configuracionInstance = Configuracion.findByNombre(nombre)
        if (!configuracionInstance) {
            configuracionInstance = new Configuracion()
            configuracionInstance.nombre = nombre
        }
        configuracionInstance.valor = valor

        if (!configuracionInstance.save(flush: true)) {
        }
    }

    def nuevaConfiguracionBytes(ConfiguracionBytes configuracionBytes){
        def configuracionInstance = ConfiguracionBytes.findByNombre(configuracionBytes.nombre)
        if (!configuracionInstance) {
            configuracionInstance = new ConfiguracionBytes()
            configuracionInstance.nombre = configuracionBytes.nombre
        }
        configuracionInstance.valor = configuracionBytes.valor

        if (!configuracionInstance.save(flush: true)) {
        }
    }
}
