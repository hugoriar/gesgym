package org.control

/**
 * LogCambiosDeEstado
 * A domain class describes the data object and it's mapping to the database
 */
class LogTipoOperacion {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    /* Automatic timestamping of GORM */
    Date    dateCreated
    String  nombre
    String  accion
    String  color
    String  icono
    String  observaciones

//	static belongsTo	= [usuario: UserPersonal]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        nombre        nullable: false, blank: false
        accion        nullable: true, blank: true
        color         nullable: true, blank: true
        icono         nullable: true, blank: true
        observaciones nullable: true, blank: true
    }

    public ultimoLogOperacion(){
        return findAll().sort{it.dateCreated}?.last()
    }

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return nombre
	}
}
