package org.control

import org.control.calendario.Horario
/**
 * CursoEspecial
 * A domain class describes the data object and it's mapping to the database
 */
class CursoEspecial {

    /* Default (injected) attributes of GORM */
    String nombre
    byte[] foto
//    Date fechaInicioVigencia
//    Date fechaTerminoVigencia
//    Long valor
    String descripcion
    boolean vigente = true // false: obsoleto

    /* Automatic timestamping of GORM */
    Date dateCreated //fecha de creación
    Date lastUpdated //ultima actualización

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    static hasMany		= [horario: Horario]	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping

    static mapping = {
    }

    static constraints = {
        nombre blank: false
//        fechaInicioVigencia blank: false
//        fechaTerminoVigencia blank: false
//        valor       blank: false, nullable: false
        descripcion blank: false, maxSize: 1000
        foto        blank: true, nullable: true, maxSize: 1638400 /* 1600K */
        horario     blank: true, nullable: true
        vigente     blank: false, nullable: false
        lastUpdated display: false
        dateCreated display: false
    }

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${nombre}";
	}
}


