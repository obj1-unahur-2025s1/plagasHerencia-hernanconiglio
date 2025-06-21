import elementos.*


class Plaga {
    var poblacion
    method transmiteEnfermedades() = poblacion >= 10
    method efectoDeAtacar() {
        poblacion = poblacion + poblacion * 0.1
    }
    method atacar(unElemento) {
        unElemento.efectoDelAtaque(self)
        self.efectoDeAtacar()
    }
}

class Cucarachas inherits Plaga {
    var pesoPromedioBicho
    method daño() = poblacion / 2
    override method transmiteEnfermedades() = super() && pesoPromedioBicho >= 10
    override method efectoDeAtacar() {
        super()
        pesoPromedioBicho = pesoPromedioBicho + 2
    }
}

class Mosquitos inherits Plaga {
    method daño() = poblacion
    override method transmiteEnfermedades() = poblacion % 3 == 0 && super()
}

class Pulgas inherits Plaga {
    method daño() = poblacion * 2
}

class Garrapatas inherits Pulgas {
        override method efectoDeAtacar() {
            poblacion = poblacion + poblacion * 0.2
    }
}