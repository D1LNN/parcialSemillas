import Parcelas.*

//INTA
object inta {

	const property parcelas = #{}

	method promedioDePlantas() = parcelas.sum({ pcl => pcl.plantas().size() }) / parcelas.size()

	method parcelaMasAutoSustentable() = parcelas.filter({ pcl => pcl.plantas().size() > 4 }).max({ pcl => pcl.procentajeDePlantasBienAsociadas() })

	method agregarParcela(parcela) {
		parcelas.add(parcela)
	}

}

