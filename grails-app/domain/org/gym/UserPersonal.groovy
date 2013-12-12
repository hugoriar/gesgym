package org.gym

/**
 * UserPersonal
 * A domain class describes the data object and it's mapping to the database
 */
class UserPersonal extends User{

//    transient springSecurityService
    static searchable = true
    CargoInterno cargo

    static mapping = {
        table "usuarios_personal"
    }

    static constraints = {
        fechaNacimiento     blank: false, nullable: false
        email               blank: false, nullable: false, email: true
        fonoCelular         blank: false, nullable: false
        cargo               blank: false, nullable: false, editable: false
    }


}