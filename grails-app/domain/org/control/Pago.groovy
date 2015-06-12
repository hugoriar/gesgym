package org.control

class Pago {
    Integer monto
    MedioPago medioDePago
    Date fecha
    Integer numeroDeBoleta
    byte[] fotoBoleta
    Boolean pagoConfirmado

    Date dateCreated //fecha de creación
    Date lastUpdated //ultima actualización

    static belongsTo = [socio: UserSocio, historialMembresias: HistorialMembresias, matricula: Matricula]
    static hasMany = [cheque: Cheque]

    static constraints = {
        monto           blank: true, nullable: true
        medioDePago     blank: true, nullable: true
        fecha           blank: true, nullable: true
        numeroDeBoleta  blank: true, nullable: true
        fotoBoleta      blank: false, nullable: true, maxSize: 1638400 /* 1600K */
        pagoConfirmado  blank: true, nullable: true
        socio           blank: true, nullable: true
        historialMembresias blank: true, nullable: true
        matricula           blank: true, nullable: true
        lastUpdated     display: false
        dateCreated     display: false

    }

    def utilService
    def mapValoresAntiguos = [:]

    def afterInsert() {
        withNewSession {
            utilService.logOperacion("save", domainClass.logicalPropertyName, id, socio, null, null, null, null)
        }
    }

    def beforeUpdate() {
        for (campo in this.getDirtyPropertyNames()) {
            mapValoresAntiguos.put(campo, this.getPersistentValue(campo))
        }
        return true
    }

    def afterUpdate() {
        mapValoresAntiguos.each {
            utilService.logOperacion("Actualizar", domainClass.logicalPropertyName, id, socio, it.key.toString(), it.value, this."$it.key", null)
        }
        return true
    }

    def beforeDelete() {
        mapValoresAntiguos.put("id", id)
        mapValoresAntiguos.put("valorAntiguo", this.toString())
        mapValoresAntiguos.put("socio", socio)
        return true
    }

    def afterDelete() {
        withNewSession {
            utilService.logOperacion("Eliminar", domainClass.logicalPropertyName, mapValoresAntiguos.id, mapValoresAntiguos.socio, null, mapValoresAntiguos.valorAntiguo, null, null)
        }
    }

    String toString() {
//        return (monto?String.format("\$ %,d", monto)+" ("+ (medioDePago?.nombre?:"Sin Medio de Pago") + ", " + (fecha?.dateString?"fecha de pago: "+fecha?.dateString:"Sin Fecha") + ", " + (numeroDeBoleta?"boleta N°"+numeroDeBoleta:"Sin Boleta") +")":"Sin Cobro")
        return (monto?String.format("\$ %,d", monto)+" ("+ (medioDePago?.nombre?:"Sin Medio de Pago") + ", " + (fecha?.dateString?"fecha de pago: "+fecha?.dateString:"Sin Fecha") + ", " + (numeroDeBoleta?"boleta N°"+numeroDeBoleta:"Sin Boleta") +")":"Sin Cobro "+pagoConfirmado?" ":"Pago NO confirmado")
    }

}
