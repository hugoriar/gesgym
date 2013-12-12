import org.gym.CargoInterno
import org.gym.Especializacion
import org.gym.Parentesco
import org.gym.Plan
import org.gym.ubicacion.Ciudad
import org.gym.EstadoMembresia
import org.gym.MedioPago
import org.gym.Ocupacion
import org.gym.ubicacion.Comuna
import org.gym.ubicacion.Provincia
import org.gym.ubicacion.Region
import org.gym.ubicacion.Sector
import org.gym.Sexo
import org.gym.fichaMedica.Profesional

class BootStrap {

//    transient springSecurityService
    def init = { servletContext ->

        println "### Subiendo aplicación"

        print "### Creando region(es)... "
        if (!Region.count()){
            new Region(numero: "15", nombre: "Arica y Parinacota").save(failOnError: true)
            new Region(numero: "1", nombre: "Tarapacá").save(failOnError: true)
            new Region(numero: "2", nombre: "Antofagasta").save(failOnError: true)
            new Region(numero: "3", nombre: "Atacama").save(failOnError: true)
            new Region(numero: "4", nombre: "Coquimbo").save(failOnError: true)
            new Region(numero: "5", nombre: "Valparaíso").save(failOnError: true)
            new Region(numero: "6", nombre: "Libertador General Bernardo O'Higgins").save(failOnError: true)
            new Region(numero: "7", nombre: "Maule").save(failOnError: true)
            new Region(numero: "8", nombre: "Biobío").save(failOnError: true)
            new Region(numero: "9", nombre: "Araucanía").save(failOnError: true)
            new Region(numero: "14", nombre: "Los Ríos").save(failOnError: true)
            new Region(numero: "10", nombre: "Los Lagos").save(failOnError: true)
            new Region(numero: "11", nombre: "Aysén del General Carlos Ibáñez del Campo").save(failOnError: true)
            new Region(numero: "12", nombre: "Magallanes y de la Antártica Chilena").save(failOnError: true)
            new Region(numero: "13", nombre: "Metropolitana de Santiago").save(failOnError: true)
        }
        print "OK"

        print "### Creando provincia(s)... "
        if (!Provincia.count()){
            new Provincia(nombre: "Isla de Pascua", region: Region.findByNombre("Valparaíso")).save(failOnError: true)
            new Provincia(nombre: "Los Andes", region: Region.findByNombre("Valparaíso")).save(failOnError: true)
            new Provincia(nombre: "Marga Marga", region: Region.findByNombre("Valparaíso")).save(failOnError: true)
            new Provincia(nombre: "Petorca", region: Region.findByNombre("Valparaíso")).save(failOnError: true)
            new Provincia(nombre: "Quillota", region: Region.findByNombre("Valparaíso")).save(failOnError: true)
            new Provincia(nombre: "San Antonio", region: Region.findByNombre("Valparaíso")).save(failOnError: true)
            new Provincia(nombre: "San Felipe de Aconcagua", region: Region.findByNombre("Valparaíso")).save(failOnError: true)
            new Provincia(nombre: "Valparaíso", region: Region.findByNombre("Valparaíso")).save(failOnError: true)
        }
        print "OK"

        print "### Creando comuna(s)... "
        if (!Comuna.count()){
            new Comuna(nombre: "Casablanca", provincia: Provincia.findByNombre("Valparaíso")).save(failOnError: true)
            new Comuna(nombre: "Concón", provincia: Provincia.findByNombre("Valparaíso")).save(failOnError: true)
            new Comuna(nombre: "Juan Fernández", provincia: Provincia.findByNombre("Valparaíso")).save(failOnError: true)
            new Comuna(nombre: "Puchuncaví", provincia: Provincia.findByNombre("Valparaíso")).save(failOnError: true)
            new Comuna(nombre: "Quintero", provincia: Provincia.findByNombre("Valparaíso")).save(failOnError: true)
            new Comuna(nombre: "Valparaíso", provincia: Provincia.findByNombre("Valparaíso")).save(failOnError: true)
            new Comuna(nombre: "Viña del Mar", provincia: Provincia.findByNombre("Valparaíso")).save(failOnError: true)
        }
        print "OK"

        print "### Creando ciudad(es)... "
        if (!Ciudad.count()){
            new Ciudad(nombre: "Viña del Mar", comuna: Comuna.findByNombre("Viña del Mar")).save(failOnError: true)
        }
        print "OK"

        print "### Creando sector(es)... "
        if (!Sector.count()){
            new Sector(nombre: "Plan de Viña", ciudad: Ciudad.findById(1)).save(failOnError: true)
            new Sector(nombre: "Reñaca", ciudad: Ciudad.findById(1)).save(failOnError: true)
            new Sector(nombre: "Gómez Carreño", ciudad: Ciudad.findById(1)).save(failOnError: true)
        }
        println "OK"

        print "### Creando parentesco(s)... "
        if (!Parentesco.count()){
            new Parentesco(nombre: "Cónyuge", descripcion: "Cónyuge").save(failOnError: true)
            new Parentesco(nombre: "Pareja", descripcion: "Pareja").save(failOnError: true)
            new Parentesco(nombre: "Padre", descripcion: "Padre").save(failOnError: true)
            new Parentesco(nombre: "Madre", descripcion: "Madre").save(failOnError: true)
            new Parentesco(nombre: "Hijo/a", descripcion: "Hijo o hija").save(failOnError: true)
            new Parentesco(nombre: "Hermano/a", descripcion: "Hermano o hermana").save(failOnError: true)
            new Parentesco(nombre: "Compañero/a de trabajo", descripcion: "Compañero o compañera de trabajo").save(failOnError: true)
            new Parentesco(nombre: "Otro familiar", descripcion: "Otro familiar").save(failOnError: true)
            new Parentesco(nombre: "Otro", descripcion: "Otro").save(failOnError: true)
        }
        println "OK"

        print "### Creando sexos... "
        if (!Sexo.count()){
            new Sexo(sexo: "Masculino").save(failOnError: true)
            new Sexo(sexo: "Femenino").save(failOnError: true)
        }
        println "OK"

        print "### Creando membresía(s)... "
        if (!Plan.count()){
            new Plan(nombre: "Normal", fechaInicioVigencia: new Date(1980, 01, 01), fechaTerminoVigencia: new Date(2200, 31, 31), descripcion: "Esta es la membresía normal", valor: 100000, vigente: true).save(failOnError: true)
            new Plan(nombre: "Vip", fechaInicioVigencia: new Date(1980, 01, 01), fechaTerminoVigencia: new Date(2200, 31, 31), descripcion: "Esta es la membresía vip", valor: 200000, vigente: true).save(failOnError: true)
            new Plan(nombre: "Personalizado", fechaInicioVigencia: new Date(1980, 01, 01), fechaTerminoVigencia: new Date(2200, 31, 31), descripcion: "Esta es la membresía personalizado", valor: 300000, vigente: true).save(failOnError: true)
        }
        println "OK"

/*        print "### Creando contacto(s) de emergencia... "
        if (!ContactoEmergencia.count()){
            new ContactoEmergencia(nombreContactoEmergencia: "Cecilia", apellidoPaternoContactoEmergencia: "Araya", apellidoMaternoContactoEmergencia: "Navea", fonoCasaContactoEmergencia: 123, fonoCelularContactoEmergencia: 456, fonoTrabajoContactoEmergencia: 789).save(failOnError: true)
            new ContactoEmergencia(nombreContactoEmergencia: "Jaqueline", apellidoPaternoContactoEmergencia: "Castillo", apellidoMaternoContactoEmergencia: "Herrera", fonoCasaContactoEmergencia: 1, fonoCelularContactoEmergencia: 2, fonoTrabajoContactoEmergencia: 3).save(failOnError: true)
            new ContactoEmergencia(nombreContactoEmergencia: "Luisa", apellidoPaternoContactoEmergencia: "Espinoza", apellidoMaternoContactoEmergencia: "Rodríguez", fonoCasaContactoEmergencia: 1, fonoCelularContactoEmergencia: 2, fonoTrabajoContactoEmergencia: 3).save(failOnError: true)
        }
        println "OK"*/



        print "### Creando estado(s) de membresía(s)... "
        if (!EstadoMembresia.count()){
            new EstadoMembresia(estado: "Activo", descripcion: "").save(failOnError: true)
            new EstadoMembresia(estado: "Inactivo", descripcion: "").save(failOnError: true)
            new EstadoMembresia(estado: "Congelado", descripcion: "").save(failOnError: true)
            new EstadoMembresia(estado: "No vigente", descripcion: "").save(failOnError: true)
        }
        println "OK"

        print "### Creando ocupación(es)... "
        if (!Ocupacion.count()){
            new Ocupacion(nombre: "Trabajador", descripcion: "").save(failOnError: true)
            new Ocupacion(nombre: "Estudiante", descripcion: "").save(failOnError: true)
            new Ocupacion(nombre: "Cesante", descripcion: "").save(failOnError: true)
            new Ocupacion(nombre: "Otro", descripcion: "").save(failOnError: true)
        }
        println "OK"

        print "### Creando especialización(es)... "
        if (!Especializacion.count()){
            new Especializacion(nombreEspecializacion: "Kinesiología").save(failOnError: true)
            new Especializacion(nombreEspecializacion: "Medicina General").save(failOnError: true)
            new Especializacion(nombreEspecializacion: "Otro").save(failOnError: true)
        }
        println "OK"

        print "### Creando profesional(es)... "
        if (!Profesional.count()){
//            new Profesional(nombreProfesional: "Doctor 1", fonoProfesional: 123456, especializacionProfesional: "Medicina General").save(failOnError: true)
        }
        println "OK"

/*
        print "### Creando ficha(s) médica(s)... "
        if (!CondicionMedica.count()){
            new CondicionMedica(condicion: "Sano", profesional: Profesional.findById(1), medicamento: "").save(failOnError: true)
        }
        println "OK"
*/

        print "### Creando medio(s) de pago(s)... "
        if (!MedioPago.count()){
            new MedioPago(nombre: "Efectivo", descripcion: "Paga en efectivo").save(failOnError: true)
            new MedioPago(nombre: "Tarjeta de crédito", descripcion: "Paga en efectivo").save(failOnError: true)
            new MedioPago(nombre: "Cheque(s)", descripcion: "Paga en efectivo").save(failOnError: true)
            new MedioPago(nombre: "Otro", descripcion: "Paga en efectivo").save(failOnError: true)
        }
        println "OK"

/*        print "### Creando historial(es) membresía(s)... "
        if (!HistorialMembresias.count()){
            new HistorialMembresias(medioPago: MedioPago.findById(1)).save(failOnError: true)
        }
        println "OK"*/

        print "### Creando cargo(s)... "
        if (!CargoInterno.count()){
            new CargoInterno(nombreCargo: "Administrativo", descripcionCargo: "Realiza tareas de gestión de la empresa").save(failOnError: true)
            new CargoInterno(nombreCargo: "Gerencia", descripcionCargo: "Realiza tareas de gerencia de la empresa").save(failOnError: true)
            new CargoInterno(nombreCargo: "Instructor", descripcionCargo: "Realiza tareas de entrenador de socios").save(failOnError: true)
            new CargoInterno(nombreCargo: "Aseo", descripcionCargo: "Realiza tareas de aseo en la empresa").save(failOnError: true)
            new CargoInterno(nombreCargo: "Otro", descripcionCargo: "Realiza otras tareas en la empresa").save(failOnError: true)
        }
        println "OK"

      /*  print "### Creando usuario(s) de personal... "
        if (!UserPersonal.count()){
            new UserPersonal(
                    nombre: "Andrea",
                    apellidoPaterno: "APaterno",
                    apellidoMaterno: "AMaterno",
                    rut: 15829818,
                    dv: "k",
                    fechaNacimiento: new Date(1984, 06, 11),
                    sexo: Sexo.findById(2),
                    domicilio: null,
                    fono: 2476908,
                    fonoCelular: 83168826,
                    fonoTrabajo: 2698929,
                    email: "andrea@spafitnessclub.cl",
                    contactoEmergencia: ContactoEmergencia.findById(1),
                    enabled: true,
                    accountExpired: false,
                    accountLocked: false,
                    passwordExpired: false,
                    cargo: CargoInterno.findById(1),
            ).save(failOnError: true)
        }
        println "OK"*/
 /*
       print "### Creando usuario(s) PT... "
        if (!UserPersonalPT.count()){
            new UserPersonalPT(
                    username: "gino",
                    password: springSecurityService.encodePassword("12345"),
                    idSocio: "3",
                    nombre: "Gino",
                    apellidoPaterno: "APaterno",
                    apellidoMaterno: "AMaterno",
                    rut: 15829818,
                    dv: "k",
                    fechaNacimiento: new Date(1984, 06, 11),
                    sexo: Sexo.findById(2),
                    domicilio: null,
                    fono: 2476908,
                    fonoCelular: 83168826,
                    fonoTrabajo: 2698929,
                    email: "gino@spafitnessclub.cl",
                    contactoEmergencia: ContactoEmergencia.findById(2),
                    enabled: true,
                    accountExpired: false,
                    accountLocked: false,
                    passwordExpired: false,
                    fichaMedica : CondicionMedica.findById(1),
                    cargo: CargoInterno.findById(2),
                    alumnos: null
            ).save(failOnError: true)
        }
        println "OK"

        print "### Creando usuario(s) socio(s)... "
        if (!UserSocio.count()){
            new UserSocio(
                    username: "admin",
                    password: springSecurityService.encodePassword("12345"),
                    idSocio: "1",
                    nombre: "Hugo",
                    apellidoPaterno: "Riveros",
                    apellidoMaterno: "Araya",
                    rut: 15829818,
                    dv: "k",
                    fechaNacimiento: new Date(1984, 06, 11),
                    sexo: Sexo.findById(1),
                    domicilio: null,
                    fono: 2476908,
                    fonoCelular: 83168826,
                    fonoTrabajo: 2698929,
                    email: "hugoriar@gmail.com",
                    ocupacion: Ocupacion.findById(1),
                    empresa: Empresa.findById(1),
                    plan: Membresia.findById(1),
                    estadoMembresia: EstadoMembresia.findById(1),
                    contactoEmergencia: ContactoEmergencia.findById(3),
                    matricula: Matricula.findById(1),
                    enabled: true,
                    accountExpired: false,
                    accountLocked: false,
                    passwordExpired: false,
                    fichaMedica : CondicionMedica.findById(1),
                    historialMembresias: HistorialMembresias.findById(1),
                    pt: null
            ).save(failOnError: true)
        }
        println "OK"*/

    }
    def destroy = {
        println "### Adiós!"
    }
}
