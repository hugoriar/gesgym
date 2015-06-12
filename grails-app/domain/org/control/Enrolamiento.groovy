package org.control

class Enrolamiento {
    Date fechaEnrolamiento
    UserPersonal enroladoPor

    static belongsTo = [user: UserSocio]

    static constraints = {
        fechaEnrolamiento   blank: false, nullable: false
        enroladoPor         blank: false, nullable: false
    }

    static mapping = {
    }

    /*String toString() {
        String monto
        return fechaMatricula.dateString + monto}*/
//    String toString() { return matriculadoPor.nombre +" "+matriculadoPor.apellidoPaterno +" "+matriculadoPor.apellidoMaterno +" ("+ fechaMatricula.dateString +") "}
}
