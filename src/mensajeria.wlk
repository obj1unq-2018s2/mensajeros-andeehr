import destinos.*
import mensajeros.*

object mensajeria {
	const property mensajeros = []
	
	method contratar(alguien) {
		mensajeros.add(alguien)
 	}
 	method despedir(alguien){
 		mensajeros.remove(alguien)
 	}
 	method despedirATodos() {
 		mensajeros.forEach{ mensajero => self.despedir(mensajero)}
 	}
 	
 	method esGrande() = mensajeros.size() > 2
 	
 	method puedeSerEntregadoPorElPrimero(paquete) = paquete.puedeSerEntregadoPor(mensajeros.first())
 	
 	method pesoDelUltimo() = mensajeros.last().pesoTotal()
 
// Aca empieza la tercer parte

	method puedeSerEntregado(paquete) = mensajeros.any{mensajero => paquete.puedeSerEntregadoPor(mensajero)}
	
	method esFacilEntregar(paquete) = mensajeros.all{mensajero => paquete.puedeSerEntregadoPor(mensajero)}
	
	method mensajerosCandidatos(paquete) = mensajeros.filter{mensajero => paquete.puedeSerEntregadoPor(mensajero)}
	
	method tieneSobrepeso() = mensajeros.sum{mensajero => mensajero.pesoTotal()} > 500
	
	method enviarPaquete() {
		var envios = 0
		mensajeros.findOrElse({mensajero => paquete.puedeSerEntregadoPor(mensajero)
											envios += 1 },
											{self.error("La empresa no puede enviar el paquete en este momento")})
	}
}