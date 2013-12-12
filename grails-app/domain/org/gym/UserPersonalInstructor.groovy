package org.gym

/**
 * UserPersonalPT
 * A domain class describes the data object and it's mapping to the database
 */
class UserPersonalInstructor extends User{

    CargoInterno cargo
    boolean esPersonalTrainer

    static hasMany = [alumnos: UserSocio]

    static mapping = {
        table "usuarios_instructores"
    }

    static constraints = {
        fechaNacimiento     blank: false, nullable: false
        email               blank: false, nullable: false, email: true
        fonoCelular         blank: false, nullable: false
        alumnos             blank: true, nullable: true
        cargo               blank: false, nullable: false, editable: false
        esPersonalTrainer   blank: false, nullable: false
    }

}
