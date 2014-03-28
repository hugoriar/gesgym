package org.gym.ventas

/**
 * FotoProducto
 * A domain class describes the data object and it's mapping to the database
 */
class FotoProducto {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String nombreFotoProducto
    String descripcionFotoProducto
    String tooltipFotoProducto
    byte[] fotoProducto

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

	static belongsTo	= [Producto]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [productos: Producto]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        nombreFotoProducto      nullable: false, blank: false
        descripcionFotoProducto nullable: true, blank: true
        tooltipFotoProducto     nullable: true, blank: true
        fotoProducto            nullable: false, blank: false, maxSize: 1638400 /* 1600K */
    }

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${nombreFotoProducto}";
	}
}
