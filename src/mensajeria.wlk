import destinos.*
import mensajeros.*
import paquetes.*

object mensajeria {
	const property mensajeros = []
	const property paquetesRecibidos = []
	const property paquetesEntregados = []
	
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
 
// Aca empieza la tercer y cuarta parte

	method puedeSerEntregado(paquete) = mensajeros.any{mensajero => paquete.puedeSerEntregadoPor(mensajero)}
	
	method esFacilEntregar(paquete) = mensajeros.all{mensajero => paquete.puedeSerEntregadoPor(mensajero)}
	
	method mensajerosCandidatos(paquete) = mensajeros.filter{mensajero => paquete.puedeSerEntregadoPor(mensajero)}
	
	method tieneSobrepeso() = mensajeros.sum{mensajero => mensajero.pesoTotal()} / mensajeros.size() > 500
	
	method agregarPaquete(paquete) {
		paquetesRecibidos.add(paquete)
	}
	
	method enviarPaquete(paquete) {
		if (self.puedeSerEntregado(paquete)){
			paquetesEntregados.add(paquete)
		} else {
			self.error("La empresa no puede enviar el paquete en este momento")
		}
	}
	
	method enviarTodos() {
		paquetesRecibidos.forEach{ paquete =>
			if (self.puedeSerEntregado(paquete)) {
				paquetesEntregados.add(paquete)
	// Mi idea era paquetesRecibidos.forEach{ paquete => self.enviarPaquete(paquete)}
	// pero no funcionaba la eficacia por el error ¿Hay algo mejor para hacer?
			}
		}
	}
	
	method paqueteMasCaro() = paquetesRecibidos.max{paquete => paquete.precio()}

	method eficacia() = (paquetesEntregados.size() / paquetesRecibidos.size() * 100).truncate(0)
}