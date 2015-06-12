package org.control

class Empresa {
    String nombreEmpresa
    DireccionEmpresa direccionEmpresa
    String fonoEmpresa

    static hasMany		= [usuarios: User]


    static constraints = {
        nombreEmpresa       blank: true, nullable: true
        direccionEmpresa    blank: true, nullable: true
        fonoEmpresa         blank: true, nullable: true
    }

    String toString() { return nombreEmpresa }
}
