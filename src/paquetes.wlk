import mensajeros.*
import destinos.*

object paquete {
	var property precio
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

object paquetito {
	var property destino
	method precio() = 0
	method puedeSerEntregadoPor(mensajero) = true
}

object paqueton {
	const property destinos = []
	var pagosACuenta = 0
	method pagarACuenta(cuanto) {
		pagosACuenta += cuanto.min(self.precio() - pagosACuenta)
	}
	method precio() = 100 * destinos.size()
	method agregarDestino(destino) {
		destinos.add(destino)
	}
	method estaPago() = pagosACuenta == self.precio()
	method puedeSerEntregadoPor(mensajero) = self.estaPago() && destinos.all{destino => destino.dejaPasar(mensajero) }
}