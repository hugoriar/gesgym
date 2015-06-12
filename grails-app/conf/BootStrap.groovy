import org.control.CargoInterno
import org.control.Configuracion
import org.control.ContactoEmergencia
import org.control.Especializacion
import org.control.Modalidad
import org.control.Parentesco
import org.control.Plan
import org.control.Role
import org.control.User
import org.control.UserRole
import org.control.tag.EstadoTag
import org.control.tag.MarcaTag
import org.control.tag.ModeloTag
import org.control.tag.Tag
import org.control.ubicacion.Ciudad
import org.control.EstadoMembresia
import org.control.MedioPago
import org.control.Ocupacion
import org.control.ubicacion.Comuna
import org.control.ubicacion.Provincia
import org.control.ubicacion.Region
import org.control.ubicacion.Sector
import org.control.Sexo
import org.control.fichaMedica.Profesional

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

        print "### Creando modalidad(es)... "
        if (!Modalidad.count()){
            new Modalidad(modalidad: "Automatico").save(failOnError: true)
            new Modalidad(modalidad: "Manual").save(failOnError: true)
        }
        println "OK"



        print "### Creando estado(s) de membresía(s)... "
        if (!EstadoMembresia.count()){
            new EstadoMembresia(estado: "Activo", descripcion: "Activo", color: "green").save(failOnError: true)
            new EstadoMembresia(estado: "No vigente", descripcion: "No vigente", color: "red").save(failOnError: true)
            new EstadoMembresia(estado: "Congelado", descripcion: "Congelado", color: "blue").save(failOnError: true)
            new EstadoMembresia(estado: "Inactivo", descripcion: "Inactivo", color: "black").save(failOnError: true)
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

        print "### Creando marca(s) de tags... "
        if (!MarcaTag.count()){
            new MarcaTag(nombre: "Impinj").save(failOnError: true)
            new MarcaTag(nombre: "Avery Dennison").save(failOnError: true)
        }
        println "OK"

        print "### Creando estado(s) de tags... "
        if (!EstadoTag.count()){
            new EstadoTag(nombreEstado: "Activo", habilitado: true, descripcionEstado: "Activo").save(failOnError: true)
            new EstadoTag(nombreEstado: "Inactivo", habilitado: false, descripcionEstado: "Inactivo").save(failOnError: true)
        }
        println "OK"

        print "### Creando modelo(s) de tags... "
        if (!ModeloTag.count()){
            new ModeloTag(marca: MarcaTag.findByNombre("Impinj"), nombre: "uh331").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Impinj"), nombre: "uh105").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Impinj"), nombre: "inskyl3").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Impinj"), nombre: "uh3d40").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Impinj"), nombre: "uh4411").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Impinj"), nombre: "uh600").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Avery Dennison"), nombre: "AD-223").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Avery Dennison"), nombre: "AD-230").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Avery Dennison"), nombre: "AD-240").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Avery Dennison"), nombre: "AD-805").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Avery Dennison"), nombre: "AD-814").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Avery Dennison"), nombre: "AD-815").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Avery Dennison"), nombre: "AD-826").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Avery Dennison"), nombre: "AD-827").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Avery Dennison"), nombre: "AD-828").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Avery Dennison"), nombre: "AD-833").save(failOnError: true)
            new ModeloTag(marca: MarcaTag.findByNombre("Avery Dennison"), nombre: "AD-843").save(failOnError: true)
        }
        println "OK"

        print "### Creando tag(s)... "
        if (!Tag.count()){
            new Tag(modelo: ModeloTag.findByNombre("uh331"),  epc: "E280-1130-2000-2444-DBA4-00AB", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("uh105"),  epc: "3008-33B2-DDD9-0140-0000-0000", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("inskyl3"),epc: "3008-33B2-DDD9-BD07-0001-4BE3", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("uh3d40"), epc: "3008-33B2-DDD9-BD04-00BB-9644", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("uh4411"), epc: "3008-33B2-DDD9-0140-0000-0000", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("uh600"),  epc: "3008-33B2-DDD9-BD05-00D6-F3EE", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("AD-223"), epc: "AD8A-1700-1C7A-8992-1400-00F0", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("AD-230"), epc: "AD0C-0101-1C72-1990-6A00-00ED", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("AD-240"), epc: "3008-33B2-DDD9-06C0-0000-0000", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("AD-805"), epc: "AD11-2500-12F3-55FF-6A00-0065", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("AD-814"), epc: "3008-33B2-DDD9-06C0-0000-0000", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("AD-815"), epc: "3008-33B2-DDD9-06C0-0000-0000", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("AD-826"), epc: "3008-33B2-DDD9-06C0-0000-0000", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("AD-827"), epc: "3008-33B2-DDD9-06C0-0000-0000", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("AD-828"), epc: "AD14-1501-4457-EF91-5600-005F", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("AD-833"), epc: "AD04-2300-44CF-2153-4100-00D0", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
            new Tag(modelo: ModeloTag.findByNombre("AD-843"), epc: "3008-33B2-DDD9-06C0-0000-0000", estado: EstadoTag.findByNombreEstado("Activo")).save(failOnError: true)
        }
        println "OK"

        print "### Creando roles"
        def userRole = Role.findByAuthority("ROLE_USER") ?: new Role(authority: "ROLE_USER").save()
        def adminRole = Role.findByAuthority("ROLE_ADMIN") ?: new Role(authority: "ROLE_ADMIN").save()
        /*def staffRole = Role.findByAuthority("ROLE_STAFF") ?: new Role(authority: "ROLE_STAFF").save()
        def guestRole = Role.findByAuthority("ROLE_GUEST") ?: new Role(authority: "ROLE_GUEST").save()
        def superRole = Role.findByAuthority("ROLE_SUPERUSER") ?: new Role(authority: "ROLE_SUPERUSER").save()*/
        println "OK"

        print "### Creando usuario(s)... "
        if (!User.count()) {
            def adminUser = new User(
                    username: "admin",
                    password: "control1234",
                    nombre: "Usuario Administrador",
                    apellidoPaterno: "Apellido Paterno",
                    apellidoMaterno: "Apellido Materno",
                    rut: 1234,
                    dv: "k",
                    sexo: Sexo.get(1),
                    contactoEmergencia: new ContactoEmergencia(nombreContactoEmergencia: "Nombre Contacto", apellidoPaternoContactoEmergencia: "Apellido Paterno Contacto", apellidoMaternoContactoEmergencia: "Apellido Materno Contacto"),
                    enabled: true
            ).save(failOnError: true)
            UserRole.create(User.findByUsername("admin"), adminRole, true)

            /*def userUser = new User(
                    username: "user",
                    password: "user1234",
                    nombre: "Usuario de Prueba",
                    apellidoPaterno: "Apellido Paterno",
                    apellidoMaterno: "Apellido Materno",
                    rut: 12345,
                    dv: "k",
                    sexo: Sexo.get(2),
                    contactoEmergencia: new ContactoEmergencia(nombreContactoEmergencia: "Nombre Contacto", apellidoPaternoContactoEmergencia: "Apellido Paterno Contacto", apellidoMaternoContactoEmergencia: "Apellido Materno Contacto"),
                    enabled: true
            ).save(failOnError: true)
            UserRole.create(User.findByUsername("user"), userRole, true)*/
        }
        println "OK"

        print "### Actualizando uptime... "
        Configuracion uptime = Configuracion.findByNombre("uptime")
        if (!uptime){
            uptime = new Configuracion(nombre: "uptime", descripcion: "Fecha de último inicio")
        }

        uptime.valor = new Date().toString()
        uptime.save(failOnError: true, flush: true)
        println "OK"

    }
    def destroy = {
        println "### Adiós!"
    }
}
