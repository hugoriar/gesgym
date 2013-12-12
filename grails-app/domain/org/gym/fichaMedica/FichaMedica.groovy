package org.gym.fichaMedica

import org.gym.User

class FichaMedica {

    static belongsTo = [usuario: User]
    static hasMany = [condicionesMedicas: CondicionMedica]

    static constraints = {
    }
}
