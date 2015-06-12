package org.control

import org.control.ubicacion.Ciudad
import org.control.ubicacion.Sector
import org.control.ubicacion.Ciudad
import org.control.ubicacion.Sector
import org.control.ubicacion.Ciudad
import org.control.ubicacion.Sector

/**
 * DireccionUsuario
 * A domain class describes the data object and it's mapping to the database
 */
class DireccionUsuario {

    String calleUsuario
    Integer numeroUsuario
    String departamentoUsuario
    Sector sectorUsuario
    Ciudad ciudadUsuario

	static belongsTo	= [usuario: User]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        calleUsuario        blank: false, nullable: false
        numeroUsuario       blank: false, nullable: false
        departamentoUsuario blank: true, nullable: true
        sectorUsuario       blank: true, nullable: true
        ciudadUsuario       blank: false, nullable: false
    }

    /*
     * Methods of the Domain Class
     */

    public String toStringCalle() {
        return "${calleUsuario+(numeroUsuario?" "+numeroUsuario:"")+(departamentoUsuario?", " +departamentoUsuario:"")}";
    }

 /*   public String toStringCalle() {
        return "${calleUsuario+(numeroUsuario?" "+numeroUsuario:"")+(departamentoUsuario?", " +departamentoUsuario:"")+(sectorUsuario?", " +sectorUsuario:"")+(ciudadUsuario?", " +ciudadUsuario:"")}";
    }*/

    @Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
        return "${calleUsuario+(numeroUsuario?" "+numeroUsuario:"")+(departamentoUsuario?", " +departamentoUsuario:"")+(sectorUsuario?", " +sectorUsuario:"")+(ciudadUsuario?", " +ciudadUsuario:"")}";
	}
}
