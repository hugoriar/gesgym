package org.gym.fichaMedica

import org.gym.User

class CondicionMedica {
    String condicion // alergía, fractura, operación
    Profesional profesional
    String medicamento

    static belongsTo	= [usuario: User]

    static constraints = {
        condicion blank: true, nullable: true
        profesional blank: true, nullable: true
        medicamento blank: true, nullable: true
    }

    String toString() { return condicion }
}
