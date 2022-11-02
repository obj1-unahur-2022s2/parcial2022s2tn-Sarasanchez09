import plantas.*

class Parcela {
	var property ancho
	var property largo
	var property horasDeSol 
	const property planta=[] 
	
	method plantarUnaPlanta(unaPlanta){
	if(self.cantidadMaxima()>self.totalDePlanta()||self.horasDeSol()>2)
		planta.add(unaPlanta)
	}
 	method superficie()=ancho*largo
	method cantidadMaxima(){if(ancho>largo) 
		return self.superficie()/5 else return self.superficie()/3 + largo}
	method tieneComplicaciones(){
		return planta.any({p=>p.horasDeSolTolera()<horasDeSol})
	}
	method mayorAltura(){return planta.max({p=>p.altura()}) }
	method totalDePlanta(){
		return planta.size()
	}
	
}
