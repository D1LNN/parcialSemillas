import Plantas.*

//Parcelas
class Parcela {

	var property ancho
	var property largo
	var property horasDeSolQueRecibe
	const property plantas = #{}

	method superficie() = ancho * largo

	method cantidadDePlantasQueTolera() = if (ancho > largo) self.superficie() / 5 else self.superficie() / 3 + largo

	method tieneComplicaciones() = plantas.any({ pl => pl.horasDeSolToleradas() < horasDeSolQueRecibe })

	method plantar(planta) {
		if (self.cantidadDePlantasQueTolera() > plantas.size() or (horasDeSolQueRecibe - planta.horasDeSolToleradas()) < 2) plantas.add(planta) else self.error("Error: la parcela no tolera mas plantas o la parcela recibe al menos 2 horas más de sol que los que la planta tolera.")
	}

	method seAsociaBien(plata)

	method procentajeDePlantasBienAsociadas() = plantas.count({ pl => self.seAsociaBien(pl) }) * 100 / plantas.size()

}

class ParcelaEcologica inherits Parcela {

	override method seAsociaBien(planta) = not self.tieneComplicaciones() and planta.esParcelaIdeal(self)

}

class ParcelaIndustrial inherits Parcela {

	override method seAsociaBien(planta) = self.plantas().size() <= 2 and planta.esFuerte()

}

