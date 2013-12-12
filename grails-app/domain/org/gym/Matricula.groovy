package org.gym

class Matricula {
    Date fechaMatricula
    UserPersonal matriculadoPor
    UserSocio referidoPor
    Date lastUpdated //ultima actualización

    static belongsTo = [socio: UserSocio]

    static constraints = {
        fechaMatricula          blank: false, nullable: false
        matriculadoPor          blank: false, nullable: false
        referidoPor             blank: true, nullable: true
        lastUpdated             display: true, editable: false
    }

    static mapping = {
        lastUpdated column: 'ultima_actualizacion'
    }

    String toString() { return matriculadoPor.nombre +" "+matriculadoPor.apellidoPaterno +" "+matriculadoPor.apellidoMaterno +" ("+ fechaMatricula.dateString +") "}
}
