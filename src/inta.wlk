import plantas.*
import parcelas.*

object inta {
	const property parcelas = #{}
	
	method totalDePlantas() {
		return parcelas.sum({ p => p.plantasEnParcela() })
	}
	
	method totalDeParcelas() {
		return parcelas.size()
	}
	
	method promedioPlantasPorParcela() {
		return self.totalDePlantas() / self.totalDeParcelas()
	}
	
	method parcelaMasAutosustentable() {
		return parcelas.filter({ p => p.plantasEnParcela() > 4 }).max({ p => p.plantasBienAsociadas() })
	}
}