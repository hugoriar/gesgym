package org.gym.fichaMedica

import org.gym.Especializacion

class Profesional {
    String nombreProfesional
    Integer fonoProfesional
    Especializacion especializacionProfesional

    static hasMany = [fichasMedicasProfesional: FichaMedica]

    static constraints = {
        nombreProfesional           blank: true, nullable: true
        fonoProfesional             blank: true, nullable: true
        especializacionProfesional  blank: true, nullable: true
        fichasMedicasProfesional    blank: true, nullable: true
    }

    String toString() { return nombreProfesional/*+" ("+Especializacion.nombreEspecializacion +")"*/ }

}
