class Plaga {
    var poblacion
    method transmiteEnfermedades() = poblacion >= 10 && self.condicionAdicional()
    method condicionAdicional() = true
    method daño() = poblacion
    method efectoDeAtacar() {
        poblacion = poblacion + poblacion * 0.1
    }
    method atacar(unElemento) {
        //ojo con el orden de los mensajes!!!
        unElemento.efectoAtaque(self)
        self.efectoDeAtacar()
    }
}

class Cucarachas inherits Plaga {
    var pesoPromedioBicho
    override method daño() = super() * 0.5
    override method condicionAdicional() = pesoPromedioBicho >= 10
    override method efectoDeAtacar() {
        super()
        pesoPromedioBicho = pesoPromedioBicho + 2
    }
}

class Pulgas inherits Plaga {
    override method daño() = super() * 2
}

class Garrapatas inherits Pulgas {
    override method efectoDeAtacar() {poblacion = poblacion + poblacion * 0.2}
}

class Mosquitos inherits Plaga {
    override method condicionAdicional() = poblacion % 3 == 0
}

class Caracoles inherits Plaga {
    override method transmiteEnfermedades() = clima.llovio()
}

object clima {
    var property llovio = true
}