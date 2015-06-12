package org.control

/**
 * Configuracion
 * A domain class describes the data object and it's mapping to the database
 */
class ConfiguracionBytes {

    /* Default (injected) attributes of GORM */
    String nombre
    byte[] valor
    String descripcion

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

    static mapping = {
        cache true
    }

    static constraints = {
        nombre      nullable: false, blank: false
        valor       nullable: false, blank: false, maxSize: 1024 * 1024 * 2
        descripcion nullable: true, blank: true, maxSize: 1500
    }

    static String getValor(String nombre){
        findByNombre(nombre)?.valor
    }

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${nombre}";
	}
}
