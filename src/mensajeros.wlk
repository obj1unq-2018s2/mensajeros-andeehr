import destinos.*

object roberto {
	var pesoInicial = 90
	var property transporte = bicicleta
	method pesoTotal() = transporte.peso() + pesoInicial
	method puedeLlamar() = false
	method puedeLlegarADestino(destino) = destino.dejaPasar(self)
}

object bicicleta {
	method peso() = 8
}

object camion {
	var property acoplados = 1
	method peso() = 500 * acoplados
}

object chuckNorris {
	method pesoTotal() = 900
	method puedeLlamar() = true
	method puedeLlegarADestino(destino) = destino.dejaPasar(self)
}

object neo {
	var property tieneCredito = true
	method pesoTotal() = 0
	method puedeLlamar() = tieneCredito
	method puedeLlegarADestino(destino) = destino.dejaPasar(self)
}

object paquete {
	var estaPago = false
	var property destino
	method pagar(){
		if (!estaPago){
			estaPago = true
		}
	}
	method puedeSerEntregadoPor(mensajero){
		return estaPago && mensajero.puedeLlegarADestino(destino)
	}
}