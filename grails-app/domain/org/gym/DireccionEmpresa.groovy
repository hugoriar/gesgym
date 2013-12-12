package org.gym

import org.gym.ubicacion.Ciudad
import org.gym.ubicacion.Sector

/**
 * DireccionEmpresa
 * A domain class describes the data object and it's mapping to the database
 */
class DireccionEmpresa {

    /* Default (injected) attributes of GORM */
    String calleEmpresa
    Integer numeroEmpresa
    String oficinaEmpresa
    Sector sectorEmpresa
    Ciudad ciudadEmpresa
    Long codigoPostalEmpresa

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

	static belongsTo	= [empresa: Empresa]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        calleEmpresa    blank: true, nullable: true
        numeroEmpresa   blank: true, nullable: true
        oficinaEmpresa  blank: true, nullable: true
        sectorEmpresa   blank: true, nullable: true
        ciudadEmpresa   blank: true, nullable: true
        codigoPostalEmpresa blank: true, nullable: true
    }

    /*
     * Methods of the Domain Class
     */
    public String toStringCalle() {
        return "${calleEmpresa+(numeroEmpresa?" "+numeroEmpresa:"")+(oficinaEmpresa?", " +oficinaEmpresa:"")}";
    }

	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${calleEmpresa}";
	}
}
