package org.gym

import org.gym.fichaMedica.CondicionMedica

class User {

//    transient springSecurityService

//    String idSocio
    String username
    String password
    String nombre
    String apellidoPaterno
    String apellidoMaterno
    Integer rut
    Character dv
    byte[] foto
    Date fechaNacimiento
    Sexo sexo
    Integer fono
    Integer fonoCelular
    Integer fonoTrabajo
    String email

    static hasOne		= [domicilio: DireccionUsuario, condicionMedica: CondicionMedica, contactoEmergencia: ContactoEmergencia]

    boolean enabled = true
    boolean accountExpired = false
    boolean accountLocked = false
    boolean passwordExpired = false

    Date dateCreated //fecha de creación
    Date lastUpdated //ultima actualización

	static constraints = {
//        idSocio             blank: false, nullable: true, unique: true, editable: false
        id                  display: true, editable: false
        version             display: true, editable: false
        username            blank: false, nullable: true, unique: true/*, display: false*/
        password            blank: false, nullable: true, password: true/*, display: false*/
        nombre              blank: false, nullable: false
        apellidoPaterno     blank: false, nullable: false
        apellidoMaterno     blank: false, nullable: false
        rut                 blank: false, nullable: false, unique: true, size: 7..8
        dv                  blank: false, nullable: false/*, size: 1..1, inList: ["0","1","2","3","4","5","6","7","8","9","k","K"]*/
        foto                blank: false, nullable: true, maxSize: 1638400 /* 1600K */
        fechaNacimiento     blank: false, nullable: true
        sexo                blank: false, nullable: false
        fono                blank: true, nullable: true
        fonoCelular         blank: true, nullable: true
        fonoTrabajo         blank: true, nullable: true
        email               blank: true, nullable: true, email: true
        domicilio           blank: true, nullable: true
        condicionMedica     blank: true, nullable: true
        contactoEmergencia  blank: false, nullable: false
        lastUpdated         display: true, editable: false
        dateCreated         display: true, editable: false
        enabled             display: false
        accountExpired      display: false
        accountLocked       display: false
        passwordExpired     display: false
	}

	static mapping = {
        tablePerSubclass true
        table "usuarios"
		password column:        '`password`'
        lastUpdated column:     'ultima_actualizacion'
        dateCreated column:     'fecha_creacion'
        enabled column:         'habilitado'
        accountExpired column:  'cuenta_expirada'
        accountLocked column:   'cuenta_bloqueada'
        passwordExpired column: '`password_expirado`'
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role } as Set
    }
    def beforeInsert() {
//        encodePassword()
    }

    def beforeUpdate() {
        /*if (isDirty('password')) {
            encodePassword()
        }*/
    }

    protected void encodePassword() {
//		password = springSecurityService.encodePassword(password)
	}

    public boolean validaRut(Integer rut, char dv){
        int M=0,S=1,T=rut;
//        int M=0,S=1,T=Integer.parseInt(rut);
        for(;T!=0;T/=10) S=(S+T%10*(9-M++%6))%11;
//        System.out.println((char)(S!=0?S+47:75));
        return (dv.equals((char)(S!=0?S+47:75)))
        /*if (dv.equals((char)(S!=0?S+47:75))) {
            return true
        } else {
            return false
        }*/
    }

    String toString() { return nombre+" "+apellidoPaterno+" "+apellidoMaterno }

}
