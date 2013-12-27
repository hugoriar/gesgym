package org.gym

/**
 * UserSocio
 * A domain class describes the data object and it's mapping to the database
 */
class UserSocio extends User {

    static searchable = true
    Ocupacion ocupacion
    EstadoMembresia estadoMembresia

    static hasMany = [historialMembresias: HistorialMembresias ]
    static hasOne = [instructor: UserPersonalInstructor, matricula: Matricula, empresa: Empresa]
    static belongsTo = [UserPersonalInstructor]

    static constraints = {
        ocupacion           blank: false, nullable: false
        historialMembresias blank: true, nullable: true
        estadoMembresia     blank: false
        matricula           blank: true, nullable: true
        instructor          blank: true, nullable: true
        empresa             blank: true, nullable: true
        lastUpdated         display: false
        dateCreated         display: false
    }

    HistorialMembresias ultimoPlan(){
        return this.historialMembresias.last()
    }


    static mapping = {
        table "usuarios_socios"
    }

}