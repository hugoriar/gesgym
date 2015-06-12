package org.control

class HistorialMembresias {

    Plan plan
    Long diasCongelacion
    PromocionMatricula promocionDeMatricula
    Date fechaInicio
    Date fechaFin
    Date inicioBonificacion
    Date finBonificacion
    UserPersonalInstructor personalTrainerAsignado
    Pago pago
    Matricula matricula
    Date lastUpdated //ultima actualización
    Date dateCreated

    static belongsTo = [usuario: UserSocio, autorizadoPor: UserPersonal]

    static constraints = {
        plan                    blank: false, nullable: false
        diasCongelacion         blank: false, nullable: false
        promocionDeMatricula    blank: true, nullable: true
        fechaInicio             blank: false, nullable: false
        fechaFin                blank: false, nullable: false
        autorizadoPor           blank: false, nullable: false
        inicioBonificacion      blank: true, nullable: true
        finBonificacion         blank: true, nullable: true
        personalTrainerAsignado blank: true, nullable: true
        pago                    blank: false, nullable: false
        lastUpdated             display: true, editable: false
        dateCreated             display: true, editable: false
    }

    def utilService
    def mapValoresAntiguos = [:]

    def afterInsert() {
        withNewSession {
            utilService.logOperacion("save", domainClass.logicalPropertyName, id, usuario, null, null, null, null)
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
            utilService.logOperacion("Actualizar", domainClass.logicalPropertyName, id, usuario, it.key.toString(), it.value, this."$it.key", null)
        }
        return true
    }

    def beforeDelete() {
        mapValoresAntiguos.put("id", id)
        mapValoresAntiguos.put("valorAntiguo", this.toString())
        mapValoresAntiguos.put("socio", usuario)
        return true
    }

    def afterDelete() {
        withNewSession {
            utilService.logOperacion("Eliminar", domainClass.logicalPropertyName, mapValoresAntiguos.id, mapValoresAntiguos.socio, null, mapValoresAntiguos.valorAntiguo, null, null)
        }
    }

    String toString() {
        return "Fecha de Contrato: "+ matricula?.fechaMatricula?.dateString +", Plan: "+ plan.nombre + " ("+ fechaInicio.dateString + " al " + fechaFin.dateString + ", "+String.format("\$%,d",pago.monto?:0)+")"
    }
}
