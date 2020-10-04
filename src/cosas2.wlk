object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto() {return 1}
	method cambio(){}
}

object bumblebee {
	var property transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bulto() {return 2}
	method cambio(){ self.transformar() }
}

object paqueteDeLadrillos {
	var property ladrillos = 0
	const peso = 2
	
	method cargados(){return ladrillos}
	method cargar(cantidad){ ladrillos = cantidad}
	method peso() { return ladrillos * peso }
	method nivelPeligrosidad() { return 2 }
	method bulto(){
		if (ladrillos <= 100){
			return 1
		}
		else if (ladrillos.between(101, 300)){
			return 2
		}
		else {
			return 3
		}
	}
	method cambio(){ladrillos += 12}
}

object arenaAGranel {
	var property peso = 0
	
	method cargar(kilos){peso = kilos}
	method peso() { return peso }
	method nivelPeligrosidad() { return 10 }
	method bulto() {return 1}
	method cambio(){peso += 20}
}
 
object bateriaAntiaerea {
	var property estaArmada = false
	
	method desarmar(){ estaArmada = not estaArmada	}
	method peso() { return return if(estaArmada){300}else{200}}
	method nivelPeligrosidad() {return if (estaArmada){100} else {0}}
	method bulto() {return if (estaArmada){2}else {1}}
	method cambio(){ estaArmada = true }
}

object contenedorPortuario {
	const cosas = []
	
	method cargados(){return cosas}
	method cargar(cosa){cosas.add(cosa)}
	method descargar(cosa){cosas.remove(cosa)}
	method peso() { return cosas.sum({carga=>carga.peso()}) + 100 }
	method nivelPeligrosidad() { 
		 if (cosas.isEmpty()){
		 	return 0
		 }
		 else{
		 	return cosas.map({carga=>carga.nivelPeligrosidad()}).max()
		 }
    }
    method bulto() {
    	return cosas.size() + 1
    }
    method cambio(){
    	cosas.forEach({carga => carga.cambio()})
    }
}

object residuosRadioactivos {
	var property peso = 0
	
	method cargar(kilos){peso = kilos}
	method peso() { return peso }
	method nivelPeligrosidad() { return 200 }
	method bulto() {return 1}
	method cambio(){peso += 15}
}

object embalajeDeSeguridad {
	var property carga = null
	
	method embalarA(cosa){
		carga = cosa
	}
	method peso() { return carga.peso() }
	method nivelPeligrosidad() { return carga.nivelPeligrosidad() / 2 }
	method bulto() {return 2}
	method cambio(){}
}
	

