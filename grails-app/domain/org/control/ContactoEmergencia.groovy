package org.control

class ContactoEmergencia {
    String nombreContactoEmergencia
    String apellidoPaternoContactoEmergencia
    String apellidoMaternoContactoEmergencia
    Integer fonoCasaContactoEmergencia
    Integer fonoCelularContactoEmergencia
    Integer fonoTrabajoContactoEmergencia
    Parentesco parentescoContactoEmergencia

    static belongsTo = [usuario: User]

    static constraints = {
        nombreContactoEmergencia          blank: false, nullable: false
        apellidoPaternoContactoEmergencia blank: false, nullable: false
        apellidoMaternoContactoEmergencia blank: false, nullable: false
        fonoCasaContactoEmergencia        blank: true, nullable: true
        fonoCelularContactoEmergencia     blank: true, nullable: true
        fonoTrabajoContactoEmergencia     blank: true, nullable: true
        parentescoContactoEmergencia      blank: true, nullable: true
    }

    String toString() { return nombreContactoEmergencia +" "+ apellidoPaternoContactoEmergencia +" ("+(fonoCasaContactoEmergencia?fonoCasaContactoEmergencia:" ")+" - "+(fonoCelularContactoEmergencia?fonoCelularContactoEmergencia:" ")+" - "+(fonoTrabajoContactoEmergencia?fonoTrabajoContactoEmergencia:" ")+") "}

}
