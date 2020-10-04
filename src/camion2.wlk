import cosas2.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.cambio()
	}
	
	method cargarCosas(cosass){
		cosas.addAll(cosass)
		cosas.forEach({c=>c.cambio()})
	}
	
	method descargarCosa(unaCosa) {
		cosas.remove(unaCosa)
	} 
	
	method  todoPesoPar() {
		return cosas.all({carga=>carga.peso().even()})
	}
	
	method  hayAlgunoQuePesa(peso) {
		return cosas.any({carga => carga.peso() == peso})
	}
	
	method  elDeNivel(nivel) {
		return cosas.find({carga => carga.nivelPeligrosidad() == nivel})
	}
	
	method  pesoTotal() {
		return cosas.sum({ carga => carga.peso()}) + 1000
	}
	
	method  excedidoDePeso() {
		return self.pesoTotal() > 2500
	}
	
	method  objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({carga=>carga.nivelPeligrosidad() > nivel})
	}
	
	method  objetosMasPeligrososQue(cosa) {
		return cosas.filter({carga=>carga.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}
	
	method  puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() and cosas.all({carga=>carga.nivelPeligrosidad() < nivelMaximoPeligrosidad}) 
	}
	
	method  tieneAlgoQuePesaEntre(min, max) {
		return cosas.any({carga=>carga.peso().between(min, max)})
	}
	
	method  cosaMasPesada() {
		return cosas.max({carga=>carga.peso()})
	}
	
	method pesos() {
		return cosas.map({cosa=>cosa.peso()})
	}
	
	method totalBultos() {
		return cosas.map({carga => carga.bulto()}).asSet().sum()
	}
}

