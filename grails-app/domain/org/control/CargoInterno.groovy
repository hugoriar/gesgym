package org.control

/**
 * CargoInterno
 * A domain class describes the data object and it's mapping to the database
 */
class CargoInterno {

    String nombreCargo
    String descripcionCargo

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

    static mapping = {
    }

    static constraints = {
        nombreCargo         blank: false, nullable: false
        descripcionCargo    blank: true, nullable: true, maxSize: 10000
    }

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${nombreCargo}";
	}
}
