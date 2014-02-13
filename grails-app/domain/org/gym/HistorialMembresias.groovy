package org.gym

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
//        matricula               ignoreNotFound: true
        lastUpdated             display: true, editable: false
        dateCreated             display: true, editable: false
    }

    String toString() {
        return "Fecha de Contrato: "+ matricula?.fechaMatricula?.dateString +", Plan: "+ plan.nombre + " ("+ fechaInicio.dateString + " al " + fechaFin.dateString + ", "+String.format("\$%,d",pago.monto?:0)+")"
    }

   /* def onLoad() {
        if ((fechaFin < new Date()) && (this == usuario.getHistorialMembresias().last())) {
                log.debug "Loading ${id}"
        }
    }*/
//    String toString() { return "Fecha de Contrato: "+ matricula?.fechaMatricula?.dateString +", Plan: "+ plan.nombre + " ("+ fechaInicio.dateString + " al " + fechaFin.dateString + ", "+String.format("\$%,d",pago.monto?:0)+")"}
//    String toString() { return plan.nombre + " ("+ fechaInicio.dateString + " al " + fechaFin.dateString + ", \$"+pago.monto+")"}
}
