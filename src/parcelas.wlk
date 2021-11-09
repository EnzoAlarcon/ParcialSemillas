import plantas.*

class Parcela {
	const property ancho
	const property largo
	const property horasAlSol
	var property plantas = #{}
	
	method superficie() {
		return ancho * largo
	}
	
	method cantidadMaxPlantas() {
		return if (ancho > largo) {self.superficie() / 5} else {self.superficie() / 3 + largo}
	}
	
	method tieneComplicaciones() {
		return plantas.all({ p => p.toleranciaAlSol() > horasAlSol })
	}
	
	method hayLugarParaPlantar() {
		return self.cantidadMaxPlantas() > plantas.size()
	}
	
	method plantaToleraElSolDeParcela(planta) {
		return (planta.toleranciaAlSol() - horasAlSol).abs() <= 2
	}
	
	method plantar(planta) {
		if (self.hayLugarParaPlantar() and self.plantaToleraElSolDeParcela(planta)) {plantas.add(planta)}
		else {self.error("La planta no puede ser plantada en esta parcela")}
	}
	
	
	
}

