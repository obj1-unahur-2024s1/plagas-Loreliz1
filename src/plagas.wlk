import elementos.*

class Plagas{
	var property poblacion	
	
	method poblacion() = poblacion	
	method transmiteEnfermedad() = poblacion >= 10
	method efectoDelAtaque() { poblacion=  poblacion *1.1}
}

class Cucarachas inherits Plagas {
	var pesoPromedio
	
	method pesoPromedio() = pesoPromedio
	method pesoPromedio(unValor)= pesoPromedio + unValor
	method NivelDeDanio() = poblacion / 2
	override method transmiteEnfermedad() {
		return
		super() and pesoPromedio >= 10
	}
	
	override method efectoDelAtaque() {
		super()  
		self.pesoPromedio(2) 
	}
}
	
class Pulgas inherits Plagas {
	method NivelDeDanio() = poblacion * 2
}	

class Garrapatas inherits Pulgas{
	override method efectoDelAtaque() {
		poblacion = poblacion * 1.2}
}

class Mosquitos inherits Plagas{
	method NivelDeDanio() = poblacion
	override method transmiteEnfermedad() =
		super() and poblacion/3 == 0

}

