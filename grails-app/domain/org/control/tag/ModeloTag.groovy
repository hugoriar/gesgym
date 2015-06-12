package org.control.tag

import org.control.tag.Tag

/**
 * ModeloTag
 * A domain class describes the data object and it's mapping to the database
 */
class ModeloTag {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
//    String  idModelo
    String  codigoModeloTag
    String  nombre
    String  descripcion
    byte[]  foto
    Long    bitsMemoriaEpc
    Long    bitsMemoriaUsuario

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

	static belongsTo	= [marca: MarcaTag]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [tags: Tag]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
//        idModelo            blank: true, nullable: true
        codigoModeloTag     blank: true, nullable: true, unique: true
        nombre              blank: false, nullable: false, unique: true
        marca               blank: false, nullable: false
        bitsMemoriaEpc      blank: true, nullable: true
        bitsMemoriaUsuario  blank: true, nullable: true
        foto                blank: true, nullable: true, maxSize: 1638400 /* 1600K */
        descripcion         blank: true, nullable: true, maxSize: 10000
    }

    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${marca.nombre+" - "+nombre}";
	}
}
