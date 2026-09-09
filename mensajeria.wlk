import mensajeros.*
import paquetes.*

object mensajeria {
  const mensajeros = []
  const paquetesPendientes = []
  var facturacion = 0

  method mensajeros() = mensajeros

  method paquetesPendientes() = paquetesPendientes

  method facturacion() = facturacion

  method contratar(unMensajero) {
    mensajeros.add(unMensajero)
  }

  method despedir(unMensajero) {
    mensajeros.remove(unMensajero)
  }

  method despedirATodos() {
    mensajeros.clear()
  }

  method reiniciar() {
    mensajeros.clear()
    paquetesPendientes.clear()
    facturacion = 0
  }

  method cantidadMensajeros() = mensajeros.size()

  method esGrande() = self.cantidadMensajeros() > 2

  method primerEmpleado() = mensajeros.first()

  method ultimoEmpleado() = mensajeros.last()

  method puedeEntregarPrimerEmpleado(unPaquete) = unPaquete.puedeSerEntregadoPor(self.primerEmpleado())

  method pesoUltimoMensajero() = self.ultimoEmpleado().peso()

  method puedeEntregar(unPaquete) = mensajeros.any({ m => unPaquete.puedeSerEntregadoPor(m) })

  method mensajerosQuePuedenLlevar(unPaquete) = mensajeros.filter({ m => unPaquete.puedeSerEntregadoPor(m) })

  method pesoTotal() = mensajeros.sum({ m => m.peso() })

  method promedioPeso() = self.pesoTotal() / self.cantidadMensajeros()

  method tieneSobrepeso() = self.promedioPeso() > 500

  method enviar(unPaquete) {
    if (self.puedeEntregar(unPaquete)) {
      facturacion += unPaquete.precio()
    } else {
      paquetesPendientes.add(unPaquete)
    }
  }

  method enviarTodos(conjuntoDePaquetes) {
    conjuntoDePaquetes.forEach({ p => self.enviar(p) })
  }

  method paquetePendienteMasCaro() = paquetesPendientes.max({ p => p.precio() })

  method enviarPaquetePendienteMasCaro() {
    const masCaro = self.paquetePendienteMasCaro()
    if (self.puedeEntregar(masCaro)) {
      facturacion += masCaro.precio()
      paquetesPendientes.remove(masCaro)
    }
  }
}
