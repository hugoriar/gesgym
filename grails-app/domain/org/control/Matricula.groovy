package org.control

class Matricula {
    Date fechaMatricula
    UserPersonal matriculadoPor
    UserSocio referidoPor
    Date lastUpdated //ultima actualización
    Date dateCreated
    Pago pagoMatricula
    String observacionesMatricula

    static belongsTo = [socio: UserSocio, membresia: HistorialMembresias]
//    static belongsTo = [socio: UserSocio]

    static constraints = {
        fechaMatricula          blank: false, nullable: false
        matriculadoPor          blank: false, nullable: false
        referidoPor             blank: true, nullable: true
        lastUpdated             display: true, editable: false
        dateCreated             display: true, editable: false
        pagoMatricula           blank: true, nullable: true
        membresia               blank: true, nullable: true
        observacionesMatricula  blank: true, nullable: true, maxSize: 1000
    }

    static mapping = {
        lastUpdated column: 'ultima_actualizacion'
    }

    def utilService
    def mapValoresAntiguos = [:]

    def afterInsert() {
        withNewSession {
            utilService.logOperacion("save", domainClass.logicalPropertyName, id, socio, null, null, null, null)
        }
    }

    def beforeUpdate() {
        for (campo in this.getDirtyPropertyNames()) {
            mapValoresAntiguos.put(campo, this.getPersistentValue(campo))
        }
        return true
    }

    def afterUpdate() {
        mapValoresAntiguos.each {
            utilService.logOperacion("Actualizar", domainClass.logicalPropertyName, id, socio, it.key.toString(), it.value, this."$it.key", null)
        }
        return true
    }

    def beforeDelete() {
        mapValoresAntiguos.put("id", id)
        mapValoresAntiguos.put("valorAntiguo", this.toString())
        mapValoresAntiguos.put("socio", socio)
        return true
    }

    def afterDelete() {
        withNewSession {
            utilService.logOperacion("Eliminar", domainClass.logicalPropertyName, mapValoresAntiguos.id, mapValoresAntiguos.socio, null, mapValoresAntiguos.valorAntiguo, null, null)
        }
    }

    String toString() {
        return (pagoMatricula?.monto?String.format("\$ %,d", pagoMatricula?.monto):"(Matrícula Sin Cobro)") + " - Matriculado por: "+matriculadoPor?.nombre +" "+matriculadoPor?.apellidoPaterno +" "+matriculadoPor?.apellidoMaterno +" ("+ fechaMatricula?.dateString +") "
    }
}
