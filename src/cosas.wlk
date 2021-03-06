object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos {
	var property ladrillos = null
	const peso = 2
	
	method Cargados(){return ladrillos}
	method cargar(cantidad){ ladrillos = cantidad}
	method peso() { return ladrillos * peso }
	method nivelPeligrosidad() { return 2 }
}

object arenaAGranel {
	var property peso = null
	
	method cargar(kilos){peso = kilos}
	method peso() { return peso }
	method nivelPeligrosidad() { return 10 }
}
 
object bateriaAntiaerea {
	var estaArmada = true
	
	method desarmar(){ estaArmada = not estaArmada	}
	method peso() { return return if(estaArmada){300}else{200}}
	method nivelPeligrosidad() {return if (estaArmada){100} else {0}}
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
}

object residuosRadioactivos {
	var property peso = null
	
	method cargar(kilos){peso = kilos}
	method peso() { return peso }
	method nivelPeligrosidad() { return 200 }
}

object embalajeDeSeguridad {
	var property carga = null
	
	method embalarA(cosa){
		carga = cosa
	}
	method peso() { return carga.peso() }
	method nivelPeligrosidad() { return carga.nivelPeligrosidad() / 2 }
}
	
