
object roberto {
	var pesoInicial = 90
	var property viajaEnBicicleta = true
	var property acoplados = 1
	method pesoTotal(){
		if (viajaEnBicicleta){
			return pesoInicial + 8
		} else {
			return pesoInicial + 500 * acoplados // esto no me gusta, lo cambio en clase
												// mejor bici y camion objetos separados
		}
	}
	method puedeLlamar() = false
	method puedeLlegarADestino(destino) = destino.dejaPasar(self)
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

object puenteDeBrooklyn {
	method dejaPasar(mensajero) = mensajero.pesoTotal() < 1000
}

object matrix {
	method dejaPasar(mensajero) = mensajero.puedeLlamar()
}

object mensajeria {
	
	
	method contratar(alguien) {
		
 	}
}
