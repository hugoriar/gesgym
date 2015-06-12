package org.control

/**
 * LogEntidad
 * A domain class describes the data object and it's mapping to the database
 */
class LogAtributo {
    def utilService

    /* Automatic timestamping of GORM */
    String nombre
    String nombreReal
    Boolean esIndice

    static belongsTo = [entidad: LogEntidad]

    static mapping = {
    }

    static constraints = {
        nombre     nullable: false, blank: false
        nombreReal nullable: false, blank: false
        esIndice   nullable: true, blank: true
    }

    def nombreFormateado() {
        return nombre ? utilService.splitCamelCase(nombre.capitalize()) : null
    }

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return nombre ? utilService.splitCamelCase(nombre.capitalize()) : null
	}
}
