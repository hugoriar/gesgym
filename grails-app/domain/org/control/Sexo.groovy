package org.control

class Sexo {
    String sexo

    static constraints = {
        sexo blank: false
    }

    String toString() { return sexo }
}
