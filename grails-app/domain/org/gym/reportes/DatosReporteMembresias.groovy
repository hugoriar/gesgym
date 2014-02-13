package org.gym.reportes

import org.gym.*

class DatosReporteMembresias {

    String estadoMembresia
    Date desde
    Date hasta

    String plan
    Long diasCongelacion
    String promocionDeMatricula
    Date fechaInicio
    Date fechaFin
    Date inicioBonificacion
    Date finBonificacion
    String personalTrainerAsignado
    String pago
    String matricula
    Date lastUpdated //ultima actualización
    Date dateCreated

    Long matriculaId
    String rut
    String nombre
    String apellidoPaterno
    String apellidoMaterno
    String fechaMatricula
    String comunaUsuario
    String ciudadUsuario
    Integer fono
    Integer fonoCelular
    String direccionEmpresa
    String ciudadEmpresa
    String comunaEmpresa
    Integer fonoTrabajo
    String email
    String nombreEmpresa
    String ocupacion
    String sexo
    String fechaNacimiento
    String nombreContactoEmergencia
    String apellidoPaternoContactoEmergencia
    String apellidoMaternoContactoEmergencia
    Integer fonoCelularContactoEmergencia
    String medioDePago
    String autorizadoPor
    Integer numeroDeBoleta
    Integer monto
    String montoMatricula
    String montoPlan
    String montoTotal
    String nombreBanco = ""
    String numeroCheque = ""
    String fechaVencimiento = ""
    String montoCheque

    static mapping = {
    }

    static constraints = {
    }


    public DatosReporteMembresias(UserSocio socio, HistorialMembresias historialMembresias, EstadoMembresia estado){
        /*DireccionUsuario direccionUsuario = socio.domicilio
        Empresa empresa = socio.empresa
        ContactoEmergencia contactoEmergencia = socio.contactoEmergencia
        Pago pago = historialMembresias.pago
        Matricula matricula = historialMembresias?.matricula*/

        this.nombre = socio.nombre?:"-"
        this.apellidoPaterno = socio.apellidoPaterno?:"-"
        this.apellidoMaterno = socio.apellidoMaterno?:"-"
        this.rut = (Integer.toString(socio?.rut))+"-"+(Character.toString(socio?.dv))
        this.estadoMembresia = estado.estado?:"-"
        this.fechaFin = historialMembresias.fechaFin.format('dd/MM/yyyy')?:"-"


        /*//    Fila 0
        this.matriculaId = matricula?.id

//    Fila 1 (UserSocio)

        this.fechaMatricula = matricula?.fechaMatricula?.format('dd/MM/yyyy')
//    Fila 2 (DireccionUsuario)
        this.direccionUsuario = direccionUsuario.toStringCalle()
        this.ciudadUsuario = direccionUsuario.ciudadUsuario
        this.comunaUsuario = direccionUsuario.ciudadUsuario.comuna
        this.fono = socio.fono
        this.fonoCelular = socio.fonoCelular
//    Fila 3 (Empresa)
        this.direccionEmpresa = empresa?.direccionEmpresa?.toStringCalle()
        this.ciudadEmpresa = empresa?.direccionEmpresa?.ciudadEmpresa
        this.comunaEmpresa = empresa?.direccionEmpresa?.ciudadEmpresa?.comuna
        this.fonoTrabajo = socio.fonoTrabajo
        this.email = socio.email
//    Fila 4 (Empresa)
        this.nombreEmpresa =  empresa?.nombreEmpresa
        this.ocupacion = socio.ocupacion?.nombre
        this.sexo = socio.sexo
        this.fechaNacimiento = socio?.fechaNacimiento?.format('dd/MM/yyyy')
//    Fila 5 (ContactoEmergencia)
        this.nombreContactoEmergencia = contactoEmergencia.nombreContactoEmergencia
        this.apellidoPaternoContactoEmergencia = contactoEmergencia.apellidoPaternoContactoEmergencia
        this.apellidoMaternoContactoEmergencia = contactoEmergencia.apellidoMaternoContactoEmergencia
        this.fonoCelularContactoEmergencia = contactoEmergencia.fonoCelularContactoEmergencia
//    Fila 7 (HistorialMembresias)
        this.medioDePago = pago?.medioDePago
        this.autorizadoPor = historialMembresias.autorizadoPor
//    Fila 8
        this.numeroDeBoleta = pago.numeroDeBoleta
        this.plan = historialMembresias.plan
        this.fechaInicio =  historialMembresias.fechaInicio.format('dd/MM/yyyy')
        this.fechaFin = historialMembresias.fechaFin.format('dd/MM/yyyy')

        Integer montoMatricula, montoPlan
        if (matricula) {
            if (matricula.pagoMatriculaId) {
                this.montoMatricula =  String.format("\$ %,d", matricula.pagoMatricula.monto?:0)
                montoMatricula = matricula.pagoMatricula.monto?:0
            } else {
                this.montoMatricula = String.format("\$ %,d", 0)
                montoMatricula = 0
            }
        } else {
            this.montoMatricula = String.format("\$ %,d", 0)
            montoMatricula = 0
        }

        if (pago) {
            this.montoPlan = String.format("\$ %,d", pago.monto?:0)
            montoPlan = pago.monto?:0
        } else {
            this.montoPlan = String.format("\$ %,d", 0)
            montoPlan = 0
        }

        this.montoTotal = String.format("\$ %,d", (montoMatricula?:0) + (montoPlan?:0))

//    Fila 9 (HistorialMembresias)
        this.diasCongelacion = historialMembresias.diasCongelacion

        this.nombreBanco = ""
        this.numeroCheque = ""
        this.fechaVencimiento = ""
        this.montoCheque = ""

        this.observacionesContrato = matricula?.observacionesMatricula*/
    }
}
