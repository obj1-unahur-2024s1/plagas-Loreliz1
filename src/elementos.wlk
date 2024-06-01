import plagas.*

class Elemento{
	method efectoDeAtacar(plaga){
		plaga.efectoDelAtaque() 
	}	
}


class Hogar inherits Elemento{
	var nivelDeMugre 
	var confort
	
	method nivelDeMugre() = nivelDeMugre
	method nivelDeMugre(unaCantidad){nivelDeMugre = nivelDeMugre + unaCantidad} 
	
	method recibeAtaque(plaga) {
		 self.nivelDeMugre( plaga.NivelDeDanio()* -1) 
		 self.efectoDeAtacar(plaga)
	}
	method esBueno()= nivelDeMugre <= confort / 2
}

class Huerta inherits Elemento {
	var capacidadDeProduccion
	
	method capacidadDeProduccion() = capacidadDeProduccion
	method capacidadDeProduccion(unaCantidad){capacidadDeProduccion=capacidadDeProduccion + unaCantidad } 
	method recibeAtaque(plaga) {
		const disminucion = plaga.NivelDeDanio()* 0.1 +
		if (plaga.transmiteEnfermedad())  10   else 0
		self.capacidadDeProduccion(disminucion *-1)
		self.efectoDeAtacar(plaga)
	}
	method esBueno()= capacidadDeProduccion > nivelDeProduccion.nivel()
}

object nivelDeProduccion{
	var property nivel
}

class Mascota inherits Elemento {
	var nivelDeSalud 
	
	method nivelDeSalud() = nivelDeSalud
	method nivelDeSalud(unaCantidad) {nivelDeSalud= nivelDeSalud + unaCantidad} 
	method recibeAtaque(plaga){		
		if (plaga.transmiteEnfermedad()) self.nivelDeSalud(plaga.NivelDeDanio()*-1)  
	    self.efectoDeAtacar(plaga) 
	}
	method esBueno()= nivelDeSalud > 250
}

class Barrios {
	const elementos = []
	
	method agregaeElementos(elemento) = elementos.add(elemento)
	method esCopado() {return 
	self.cantidadeElementosBuenos() > elementos.size() - self.cantidadeElementosBuenos() 
	}
	method cantidadeElementosBuenos() {return elementos.sum({e => e.esBueno() })} 
}