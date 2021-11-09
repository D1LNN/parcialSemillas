//Plantas
class Planta {

	var property anioDeObtencion
	var property altura

	method horasDeSolToleradas()

	method esFuerte() = self.horasDeSolToleradas() > 10

	method daNuevasSemillas() = self.esFuerte() or self.condicionAlternativa()

	method espacioQueOcupa()

	method condicionAlternativa()

	method esParcelaIdeal(parcela)

}

class Menta inherits Planta {

	override method horasDeSolToleradas() = 6

	override method espacioQueOcupa() = altura * 3

	override method condicionAlternativa() = altura > 0.4

	override method esParcelaIdeal(parcela) = parcela.superficie() > 6

}

class Soja inherits Planta {

	override method horasDeSolToleradas() = if (altura < 0.5) 6 else if (altura > 1) 9 else 7

	override method espacioQueOcupa() = altura / 2

	override method condicionAlternativa() = anioDeObtencion > 2007 and altura > 1

	override method esParcelaIdeal(parcela) = self.horasDeSolToleradas() == parcela.horasDeSolQueRecibe()

}

class Quinoa inherits Planta {

	var property horasDeSolToleradas

	override method espacioQueOcupa() = 0.5

	override method condicionAlternativa() = anioDeObtencion < 2005

	override method esParcelaIdeal(parcela) = not parcela.plantas().any({ pl => pl.altura() > 1.5})

}

class SojaTransgenica inherits Soja {

	override method daNuevasSemillas() = false

	override method esParcelaIdeal(parcela) = parcela.cantidadDePlantasQueTolera() == 1

}

class Hierbabuena inherits Menta {

	override method espacioQueOcupa() = super() * 2

}

