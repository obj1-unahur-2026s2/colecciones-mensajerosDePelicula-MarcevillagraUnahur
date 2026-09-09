import destinos.*

class Paquete {
  var property estaPago = false
  var property destino = puenteDeBrooklyn

  method precio() = 50

  method pagar() {
    estaPago = true
  }

  method puedeSerEntregadoPor(mensajero) = self.estaPago() and destino.dejaPasar(mensajero)
}

object paquete inherits Paquete {}

object paquetito {
  method precio() = 0

  method estaPago() = true

  method puedeSerEntregadoPor(mensajero) = true
}

class PaquetonViajero {
  const property destinos = []
  var montoPagado = 0

  method montoPagado() = montoPagado

  method precio() = 100 * destinos.size()

  method pagar(monto) {
    montoPagado += monto
  }

  method estaPago() = montoPagado >= self.precio()

  method mensajeroPasaPorTodos(mensajero) = destinos.all({ d => d.dejaPasar(mensajero) })

  method puedeSerEntregadoPor(mensajero) = self.estaPago() and self.mensajeroPasaPorTodos(mensajero)
}

class PaqueteFragil inherits Paquete {
  override method puedeSerEntregadoPor(mensajero) = super(mensajero) and mensajero.peso() < 100
}
