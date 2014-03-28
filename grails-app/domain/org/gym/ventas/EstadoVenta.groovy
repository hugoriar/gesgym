package org.gym.ventas

class EstadoVenta {
    String codigo
    String nombre
    String descripcion

    static constraints = {
        codigo (blank: false, nullable: false, size: 2..10, unique: true)
        nombre (blank: false, nullable: false, size: 5..50)
        descripcion blank: true, nullable: true, maxSize: 1500
    }

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${nombre} (${codigo})"
    }
}
