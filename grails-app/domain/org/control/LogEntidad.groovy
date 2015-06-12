package org.control

/**
 * LogEntidad
 * A domain class describes the data object and it's mapping to the database
 */
class LogEntidad {

    /* Automatic timestamping of GORM */
    String nombre
    String nombreTabla

    static hasMany = [atributos: LogAtributo]

    static mapping = {
    }

    static constraints = {
        nombre nullable: false, blank: false
        nombreTabla nullable: false, blank: false
    }

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return nombre
	}
}
