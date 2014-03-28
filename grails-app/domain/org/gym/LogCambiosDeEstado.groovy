package org.gym

/**
 * LogCambiosDeEstado
 * A domain class describes the data object and it's mapping to the database
 */
class LogCambiosDeEstado {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated
    Date fechaDeOperacion
    Modalidad modalidad
//    UserSocio socio
    EstadoMembresia estadoAntiguo
    EstadoMembresia estadoNuevo
    String observaciones

	static belongsTo	= [socio: UserSocio]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        fechaDeOperacion    nullable: false, blank: false
        modalidad           nullable: false, blank: false
        socio               nullable: false, blank: false
        estadoAntiguo       nullable: false, blank: false
        estadoNuevo         nullable: false, blank: false
        observaciones       nullable: true, blank: true
    }

    public ultimoLogCambiosDeEstado(){
        return findAll().sort{it.fechaDeOperacion}?.last()
    }

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${fechaDeOperacion.toString()} ${socio} - de $estadoAntiguo a $estadoNuevo";
	}
}
