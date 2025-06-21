import plagas.*

class Hogar {
    var  mugre
    const confort
    method esBueno() = mugre <= confort / 2
    method efectoDelAtaque(unaPlaga) {mugre = mugre + unaPlaga.daño()}
}

class Huerta {
    var produccion
    method esBueno() = produccion > nivelMinimo.valor()
    method efectoDelAtaque(unaPlaga) {
        produccion = (produccion - (unaPlaga.daño() * 0.1 + if(unaPlaga.transmiteEnfermedades()) 10 else 0)).max(0)
    }
}

object nivelMinimo {
    var property valor = 100
}

class Mascota {
    var salud
    method esBueno() = salud > 250
    method efectoDelAtaque(unaPlaga) {
        if(unaPlaga.transmiteEnfermedades()) {salud = (salud - unaPlaga.daño()).max(0)}
    }
}

class Barrio {
    const elementos = []
    method agregarElementos(listaElementos) {elementos.addAll(listaElementos)}
    method cantElementosBuenos() = elementos.count({e=>e.esBueno()})
    method esCopado() = self.cantElementosBuenos() > self.cantElementosMalos()
    method cantElementosMalos() = elementos.size() - self.cantElementosBuenos()
    method cantElementosMalosBis() = elementos.count({e=>not e.esBueno()})
}