package org.gym

/**
 * UserSocio
 * A domain class describes the data object and it's mapping to the database
 */
class UserSocio extends User {

    static searchable = true
    Ocupacion ocupacion
    EstadoMembresia estadoMembresia
//    Matricula matricula

    static hasMany = [historialMembresias: HistorialMembresias, visitas: Visita, logCambiosDeEstado: LogCambiosDeEstado]
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

    static mapping = {
        table "usuarios_socios"
    }

}