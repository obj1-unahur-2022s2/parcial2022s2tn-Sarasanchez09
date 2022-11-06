/*
 * Como sugerencia, los nombres de las colecciones suelen ser en plural (plantas).
 * 
 * El método plantarUnaPlanta(unaPlanta) debía arrojar error si no se podía plantar por 
 * no cumplir con las condiciones solicitadas. Y también estaba errónea la condición 
 * de la cantidad de sol que tolera la planta. Te dejo una posible solución.
 * 
 * Para que el método mayorAltura() retorne el valor numérico de la altura de la planta
 * hay que llamar al método altura(), ya que el método max retorna el objeto de la subclase
 * que hereda de Planta.
 * 
 * Faltó implementar las subclases ParcelaEcologica y ParcelaIndustrial
 * 
 * Faltó implementar el método seAsociaBien(unaPlanta)
 * 
 * Te agrego el método tieneMasDeCuatro() para poder usarlo en la solución del método
 * masAutosustentable() del objeto inta.
 */

import plantas.*

class Parcela {
	var property ancho
	var property largo
	var property horasDeSol 
	const property planta=[] 
	
	method plantarUnaPlanta(unaPlanta){
		if(self.cantidadMaxima()<=self.totalDePlanta() 
		|| self.horasDeSol()>= unaPlanta.horasDeSolTolera()+2)
			self.error("no se puede plantar")
		planta.add(unaPlanta)
	}
	
 	method superficie()=ancho*largo
	method cantidadMaxima(){if(ancho>largo) 
		return self.superficie()/5 else return self.superficie()/3 + largo}
	method tieneComplicaciones(){
		return planta.any({p=>p.horasDeSolTolera()<horasDeSol})
	}
	method mayorAltura(){return planta.max({p=>p.altura()}).altura()}
	method totalDePlanta(){
		return planta.size()
	}
	method seAsociaBien(unaPlanta)
	
	method tieneMasDeCuatro() = self.totalDePlanta() > 4
	method cantidadBienAsociadas() = planta.count({p=>self.seAsociaBien(p)})
}

class ParcelaEcologica inherits Parcela {
	override method seAsociaBien(unaPlanta) {return 
		!self.tieneComplicaciones() and unaPlanta.esParcelaIdeal(self)
	} 
}

class ParcelaIndustrial inherits Parcela {
	override method seAsociaBien(unaPlanta) {return 
		self.totalDePlanta() <= 2 and unaPlanta.esFuerte()
	} 
}
