package org.control.fichaMedica

import org.control.User

class FichaMedica {

    static belongsTo = [usuario: User]
    static hasMany = [condicionesMedicas: CondicionMedica]

    static constraints = {
    }
}
