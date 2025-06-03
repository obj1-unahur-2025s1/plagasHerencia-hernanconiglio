class Hogar {
    var mugre
    var confort
    method esBueno() = confort >= mugre / 2
    method efectoAtaque(plaga) {
        mugre = mugre + plaga.daño()
    }
}

class Huerta {
    var produccion
    method esBueno() = produccion > nivelMinimoProduccion.valor()
    method efectoAtaque(plaga) {
        produccion = produccion - (plaga.daño() * 0.10 + if(plaga.transmiteEnfermedades()) 10 else 0)
    }
}

object nivelMinimoProduccion {
    var property valor = 100
}

class Mascota {
    var salud
    method esBueno() = salud > 250
    method efectoAtaque(plaga) {
        if(plaga.transmiteEnfermedades()) {salud = (salud - plaga.daño()).max(0)}
    }
}

class Barrio {
    const elementos = []
    method esBueno(unElemento) = unElemento.esBueno()
    method esCopado() = self.cantElementosBuenos() > self.cantElementosMalos()
    method cantElementosBuenos() = elementos.count({e=>e.esBueno()})
    method cantElementosMalos() = elementos.size() - self.cantElementosBuenos()
}