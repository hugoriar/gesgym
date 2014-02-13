package org.gym

class Matricula {
    Date fechaMatricula
    UserPersonal matriculadoPor
    UserSocio referidoPor
    Date lastUpdated //ultima actualización
    Date dateCreated
    Pago pagoMatricula
    String observacionesMatricula

    static belongsTo = [socio: UserSocio]

    static constraints = {
        fechaMatricula          blank: false, nullable: false
        matriculadoPor          blank: false, nullable: false
        referidoPor             blank: true, nullable: true
        lastUpdated             display: true, editable: false
        dateCreated             display: true, editable: false
        pagoMatricula           blank: false, nullable: false
        observacionesMatricula  blank: true, nullable: true, maxSize: 1000
    }

    static mapping = {
        lastUpdated column: 'ultima_actualizacion'
    }

    String toString() {
        return (pagoMatricula.monto?String.format("\$ %,d", pagoMatricula?.monto):"(Matrícula Sin Cobro)") + " - Matriculado por: "+matriculadoPor?.nombre +" "+matriculadoPor?.apellidoPaterno +" "+matriculadoPor?.apellidoMaterno +" ("+ fechaMatricula?.dateString +") "
    }
}
