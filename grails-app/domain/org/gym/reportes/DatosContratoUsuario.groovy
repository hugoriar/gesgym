package org.gym.reportes

import org.gym.ContactoEmergencia
import org.gym.DireccionUsuario
import org.gym.Empresa
import org.gym.HistorialMembresias
import org.gym.Matricula
import org.gym.Pago
import org.gym.UserSocio

class DatosContratoUsuario {

//    Fila 0
    Long matriculaId
    String rut

//    Fila 1 (UserSocio)
    String nombre
    String apellidoPaterno
    String apellidoMaterno
//    (Matricula)
    Date fechaMatricula

//    Fila 2 (DireccionUsuario)
    String direccionUsuario
    /*String calleUsuario
    Integer numeroUsuario
    String departamentoUsuario
    *//*Sector sectorUsuario*//*
    String sectorUsuario*/
    /*Ciudad ciudadUsuario*/
    String comunaUsuario
    String ciudadUsuario
    Integer fono
    Integer fonoCelular

//    Fila 3 (Empresa)
//    DireccionEmpresa direccionEmpresa
    String direccionEmpresa
    /*String calleEmpresa
    Integer numeroEmpresa
    String oficinaEmpresa
    Sector sectorEmpresa
    String sectorEmpresa*/
//    Ciudad ciudadEmpresa
    String ciudadEmpresa
    String comunaEmpresa
    Integer fonoTrabajo
    String email

//    Fila 4 (Empresa)
    String nombreEmpresa
//    Ocupacion
    String ocupacion
//    Sexo
    String sexo
    Date fechaNacimiento

//    Fila 5 (ContactoEmergencia)
    String nombreContactoEmergencia
    String apellidoPaternoContactoEmergencia
    String apellidoMaternoContactoEmergencia
//    Integer fonoCasaContactoEmergencia
    Integer fonoCelularContactoEmergencia
    /*Integer fonoTrabajoContactoEmergencia*/

//    Fila 7 (HistorialMembresias)
//    Pago
    String medioDePago
//    HistorialMembresias
    String autorizadoPor

//    Fila 8
//    Pago pago
    Integer numeroDeBoleta
//    HistorialMembresias - Plan
    String plan
//    PromocionMatricula promocionDeMatricula
//    Plan plan
    Date fechaInicio
    Date fechaFin
//    Date inicioBonificacion
//    Date finBonificacion
//    UserPersonalInstructor personalTrainerAsignado
    Integer monto
    Integer montoMatricula
    Integer montoPlan
    Integer montoTotal

//    Fila 9 (HistorialMembresias)
    Long diasCongelacion



    static mapping = {
    }

    static constraints = {
    }

    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}

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

    public DatosContratoUsuario (UserSocio socio){
        DireccionUsuario direccionUsuario = socio.domicilio
        Empresa empresa = socio.empresa
        ContactoEmergencia contactoEmergencia = socio.contactoEmergencia
        HistorialMembresias historialMembresias = socio.historialMembresias.last()
        Pago pago = historialMembresias.pago
        Matricula matricula = socio.matricula

        //    Fila 0
        this.matriculaId = matricula.id
        this.rut = (Integer.toString(socio.rut))+"-"+(Character.toString(socio.dv))
//    Fila 1 (UserSocio)
        this.nombre = socio.nombre?:"-"
        this.apellidoPaterno = socio.apellidoPaterno
        this.apellidoMaterno = socio.apellidoMaterno
        this.fechaMatricula = matricula.fechaMatricula
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
        this.fechaNacimiento = socio.fechaNacimiento
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
        this.fechaInicio = historialMembresias.fechaInicio
        this.fechaFin = historialMembresias.fechaFin
        this.montoMatricula = pago.monto
        this.montoPlan = pago.monto
        this.montoTotal = this.montoMatricula + this.montoPlan
//    Fila 9 (HistorialMembresias)
        this.diasCongelacion = historialMembresias.diasCongelacion
    }
}
