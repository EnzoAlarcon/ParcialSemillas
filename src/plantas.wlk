class Planta {
	var property anioDeObtencion = 0
	var property altura = 0
	
	method toleranciaAlSol()
	
	method esFuerte() {
		return self.toleranciaAlSol() > 10
	}
	
	method daNuevasSemillas() {
		return self.esFuerte()
	}
	
}

class Menta inherits Planta {
	
	override method toleranciaAlSol() {
		return 6
	}
	
	override method daNuevasSemillas() {
		return super() or altura > 0.4
	}
	
	method espacioQueOcupa() {
		return altura * 3
	}
	
	method esParcelaIdeal(parcela) {
		return parcela.superficie() > 6
	}
	
}

class Soja inherits Planta {
	
	override method toleranciaAlSol() {
		var tolerancia
		
		if (altura < 0.5) {tolerancia = 6}
		else if (altura.between(0.5,1)) {tolerancia = 7}
		else {tolerancia = 9}
		
		return tolerancia
	}
	
	override method daNuevasSemillas() {
		return super() or anioDeObtencion > 2007 and altura > 1
	}
	
	method espacioQueOcupa() {
		return altura / 2
	}
	
	method esParcelaIdeal(parcela) {
		return parcela.horasAlSol() == self.toleranciaAlSol()
	}
}

class Quinoa inherits Planta {
	
	var property toleranciaAlSol
	
	method espacioQueOcupa() = 0.5
	
	override method daNuevasSemillas() {
		return super() or anioDeObtencion < 2005
	}
	
	method esParcelaIdeal(parcela) {
		return parcela.plantas().all({ p => p.altura() < 1.5 })
	}
	
	
}

class SojaTransgenica inherits Soja {
	
	override method daNuevasSemillas() = false

}

class Hierbabuena inherits Menta {
	
	override method espacioQueOcupa() {
		return super() * 2
	}
	
	override method esParcelaIdeal(parcela) {
		return parcela.cantidadMaxPlantas() == 1
	} 
}


