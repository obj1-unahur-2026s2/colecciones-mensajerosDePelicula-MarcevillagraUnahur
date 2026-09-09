object bicicleta {
  method peso() = 5
}

class Camion {
  var property acoplados = 1

  method peso() = acoplados * 500
}

object roberto {
  var property pesoPropio = 90
  var property transporte = bicicleta

  method peso() = pesoPropio + transporte.peso()

  method puedeLlamar() = false
}

object chuckNorris {
  method peso() = 80

  method puedeLlamar() = true
}

object neo {
  var property tieneCredito = true

  method peso() = 0

  method puedeLlamar() = tieneCredito
}

object morfeo {
  var property peso = 90

  method puedeLlamar() = true
}
