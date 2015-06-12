package org.control

import org.control.calendario.Horario

/**
 * UserSocio
 * A domain class describes the data object and it's mapping to the database
 */
class UserSocio extends User {

//    static searchable = true
    Ocupacion ocupacion
    EstadoMembresia estadoMembresia
//    Matricula matricula

    static hasMany = [historialMembresias: HistorialMembresias, visitas: Visita, logCambiosDeEstado: LogCambiosDeEstado, horarios: Horario]
    static hasOne = [/*instructor: UserPersonalInstructor, *//*matricula: Matricula, */empresa: Empresa, enrolamiento: Enrolamiento]
    static belongsTo = [instructor: UserPersonalInstructor]
    static transients = ['cantVisitas']

    static constraints = {
        ocupacion           blank: false, nullable: false
        historialMembresias blank: true, nullable: true
        estadoMembresia     blank: false
//        matricula           blank: true, nullable: true
        instructor          blank: true, nullable: true
        empresa             blank: true, nullable: true
        enrolamiento        blank: true, nullable: true
        lastUpdated         display: false
        dateCreated         display: false
    }

    HistorialMembresias getUltimoPlan(){
        return this.historialMembresias.max {it.fechaFin}
    }

    Visita getUltimaVisita(){
        return this.visitas.max {it.fechaDeVisita}
    }

    def getCantVisitas() {
        def visitaUsuario = Visita.findAllByUsuario(this, [sort:'id',order:'asc']).size()
    }

    Integer getCantVisitasFecha(Date desde, Date hasta){
        def visitaUsuario = Visita.findAllByUsuarioAndFechaDeVisitaBetween(this, desde, hasta).size()
        if (visitaUsuario > 0) {
            return visitaUsuario
        } else {
            return null
        }
    }

    def getFonos(Boolean checkFono, Boolean checkFonoCelular, Boolean checkFonoTrabajo, int maxFonos, String separador){
        int contFonos = 0
        String fonos = ""
        if (this.fono && checkFono){
            fonos += this.fono
            contFonos++
        }
        if (this.fonoCelular && checkFonoCelular){
            if (contFonos>0) fonos+=separador
            fonos += this.fonoCelular
            contFonos++
        }
        if (this.fonoTrabajo && checkFonoTrabajo){
            if (contFonos>=maxFonos) {
                return fonos
            } else if (contFonos>0) fonos+=separador
            fonos += this.fonoTrabajo
            contFonos++
        }
        if (contFonos != 0){
            return fonos
        } else {
            return "S/N"
        }
    }

    Boolean esNuevo(){
        return this.historialMembresias.size() <= 1
    }

    Boolean esNuevo(Date fecha){
         this.historialMembresias.each {
             if (/*(it.pago.dateCreated.date(desde)) ||*/ it.pago.dateCreated.after(fecha)) {
                 return false
             }
         }
//        return this.historialMembresias.size() <= 1
    }

    Boolean esNuevo(Date desde, Date hasta){
         this.historialMembresias.each {
             if (/*(it.pago.dateCreated.date(desde)) ||*/ (it.pago.dateCreated.after(desde) && it.pago.dateCreated.before(hasta)) ){
                 return true
             }
         }
//        return this.historialMembresias.size() <= 1
    }

    static mapping = {
        table "usuarios_socios"
        cache true
    }

    /*def springSecurityService
    def utilService
    def mapValoresAntiguos = [:]

    def afterInsert() {
        withNewSession {
            utilService.logOperacion("save", domainClass.logicalPropertyName, id, this, null, null, null, null)
        }
    }

    def beforeUpdate() {
        for (campo in this.getDirtyPropertyNames()) {
            mapValoresAntiguos.put(campo, this.getPersistentValue(campo))
        }
        return true
    }

    def afterUpdate() {
        mapValoresAntiguos.each {
            utilService.logOperacion("Actualizar", domainClass.logicalPropertyName, id, this, it.key.toString(), it.value, this."$it.key", null)
        }
        return true
    }

    def beforeDelete() {
        for (campo in this.getDirtyPropertyNames()) {
            mapValoresAntiguos.put(campo, this.getPersistentValue(campo))
        }
        return true
    }

    def afterDelete() {
        utilService.logOperacion("Eliminar", domainClass.logicalPropertyName, Long.valueOf(mapValoresAntiguos.id), this, null, null, null, mapValoresAntiguos.toString())
    }*/

}