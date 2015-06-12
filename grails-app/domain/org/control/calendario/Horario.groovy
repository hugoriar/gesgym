package org.control.calendario

import org.control.CursoEspecial
import org.control.User
import org.control.UserSocio

/**
 * Horario
 * A domain class describes the data object and it's mapping to the database
 */
class Horario {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String nombre
//    User usuario
    CursoEspecial curso
    String color
    String textColor

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

	static belongsTo	= [CursoEspecial/*, User*/]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static belongsTo	= [curso: CursoEspecial, usuario: User]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [fechas: EventRec/*, usuarios: User*/]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        nombre      blank: false, nullable: false
        curso       blank: false, nullable: false
//        usuario     blank: true, nullable: true
        fechas      blank: true, nullable: true
        color       blank: true, nullable: true
        textColor   blank: true, nullable: true
    }

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${nombre}";
	}
}
