package org.control.reportes

import org.control.Empresa
import org.control.UserSocio
import org.control.ContactoEmergencia
import org.control.DireccionUsuario
import org.control.HistorialMembresias
import org.control.Matricula
import org.control.Pago
import org.control.UserSocio
import org.control.ContactoEmergencia
import org.control.DireccionUsuario
import org.control.Empresa
import org.control.HistorialMembresias
import org.control.Matricula
import org.control.Pago
import org.control.UserSocio

class DatosContratoUsuario {

//    Fila 0
    Long matriculaId
    String rut

//    Fila 1 (UserSocio)
    String nombre
    String apellidoPaterno
    String apellidoMaterno
//    (Matricula)
    String fechaMatricula

//    Fila 2 (DireccionUsuario)
    String direccionUsuario
    String comunaUsuario
    String ciudadUsuario
    Integer fono
    Integer fonoCelular

//    Fila 3 (Empresa)
//    DireccionEmpresa direccionEmpresa
    String direccionEmpresa
//    Ciudad ciudadEmpresa
    String ciudadEmpresa
    String comunaEmpresa
    Integer fonoTrabajo
    String email

//    Fila 4 (Empresa)
    String nombreEmpresa
    String ocupacion
    String sexo
    String fechaNacimiento

//    Fila 5 (ContactoEmergencia)
    String nombreContactoEmergencia
    String apellidoPaternoContactoEmergencia
    String apellidoMaternoContactoEmergencia
    Integer fonoCelularContactoEmergencia

//    Fila 7 (HistorialMembresias)
    String medioDePago
    String autorizadoPor

//    Fila 8
    Integer numeroDeBoleta
    String plan
    String fechaInicio
    String fechaFin
    Integer monto
    String montoMatricula
    String montoPlan
    String montoTotal

//    Fila 9 (HistorialMembresias)
    Long diasCongelacion

    String nombreBanco = ""
    String numeroCheque = ""
    String fechaVencimiento = ""
    String montoCheque

    String observacionesContrato

    static mapping = {
    }

    static constraints = {
    }

    public /*DatosContratoUsuario*/ datosContratoUsuario(UserSocio socio,
                                                     DireccionUsuario direccionUsuario,
                                                     Empresa empresa,
                                                     ContactoEmergencia contactoEmergencia,
                                                     HistorialMembresias historialMembresias,
                                                     Pago pago,
                                                     Matricula matricula){
        //    Fila 0
        this.matriculaId = matricula.id
        this.rut = (Integer.toString(socio.rut))+"-"+(Character.toString(socio.dv))
//    Fila 1 (UserSocio)
        this.nombre = socio.nombre
        this.apellidoPaterno = socio.apellidoPaterno
        this.apellidoMaterno = socio.apellidoMaterno
        this.fechaMatricula = matricula.fechaMatricula
//    Fila 2 (DireccionUsuario)
        this.direccionUsuario = direccionUsuario.toStringCalle()
        this.ciudadUsuario = direccionUsuario.ciudadUsuario
        this.comunaUsuario = direccionUsuario.ciudadUsuario.comuna
        /*this.direccionUsuario = socio.domicilio.toStringCalle()
        this.ciudadUsuario = socio.domicilio.ciudadUsuario.nombre*/
        this.fono = socio.fono
        this.fonoCelular = socio.fonoCelular
//    Fila 3 (Empresa)
        this.direccionEmpresa = empresa.direccionEmpresa.toStringCalle()
        this.ciudadEmpresa = empresa.direccionEmpresa.ciudadEmpresa
        this.comunaEmpresa = empresa.direccionEmpresa.ciudadEmpresa.comuna
        this.fonoTrabajo = socio.fonoTrabajo
        this.email
//    Fila 4 (Empresa)
        this.nombreEmpresa =  empresa.nombreEmpresa
        this.ocupacion = socio.ocupacion.nombre
        this.sexo = socio.sexo
        this.fechaNacimiento = socio.fechaNacimiento
//    Fila 5 (ContactoEmergencia)
        this.nombreContactoEmergencia = contactoEmergencia.nombreContactoEmergencia
        this.apellidoPaternoContactoEmergencia = contactoEmergencia.apellidoPaternoContactoEmergencia
        this.apellidoMaternoContactoEmergencia = contactoEmergencia.apellidoMaternoContactoEmergencia
        this.fonoCelularContactoEmergencia = contactoEmergencia.fonoCelularContactoEmergencia
//    Fila 7 (HistorialMembresias)
        this.medioDePago = pago.medioDePago
        this.autorizadoPor = historialMembresias.autorizadoPor
//    Fila 8
        this.numeroDeBoleta = pago.numeroDeBoleta
        this.plan = historialMembresias.plan
        this.fechaInicio = historialMembresias.fechaInicio
        this.fechaFin = historialMembresias.fechaFin
        this.monto = pago.monto
//    Fila 9 (HistorialMembresias)
        this.diasCongelacion = historialMembresias.diasCongelacion
    }

    public DatosContratoUsuario (UserSocio socio, HistorialMembresias historialMembresias){
        DireccionUsuario direccionUsuario = socio.domicilio
        Empresa empresa = socio.empresa
        ContactoEmergencia contactoEmergencia = socio.contactoEmergencia

//        HistorialMembresias historialMembresias = socio.historialMembresias.last()
        Pago pago = historialMembresias?.pago
        Matricula matricula = historialMembresias?.matricula

        //    Fila 0
        this.matriculaId = matricula?.id
        this.rut = (Integer.toString(socio.rut))+"-"+(Character.toString(socio.dv))
//    Fila 1 (UserSocio)
        this.nombre = socio.nombre?:"-"
        this.apellidoPaterno = socio.apellidoPaterno
        this.apellidoMaterno = socio.apellidoMaterno
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
        this.autorizadoPor = historialMembresias?.autorizadoPor
//    Fila 8
        this.numeroDeBoleta = pago?.numeroDeBoleta
        this.plan = historialMembresias?.plan
        this.fechaInicio =  historialMembresias?.fechaInicio?.format('dd/MM/yyyy')
        this.fechaFin = historialMembresias?.fechaFin?.format('dd/MM/yyyy')

        Integer montoMatricula, montoPlan
        if (matricula) {
            if (matricula.pagoMatricula) {
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
        this.diasCongelacion = historialMembresias?.diasCongelacion

        this.nombreBanco = ""
        this.numeroCheque = ""
        this.fechaVencimiento = ""
        this.montoCheque = ""

        this.observacionesContrato = matricula?.observacionesMatricula
    }
}
