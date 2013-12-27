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
    }

    String toString() { return plan.nombre + " ("+ fechaInicio.dateString + " al " + fechaFin.dateString + ", \$"+pago.monto+")"}
}
