/*
 * Faltó implementar el método masAutosustentable(). Te dejo una posible solución. 
 */

import plantas.*
import parcelas.*


object inta{
	const property parcelas=[]
	
	
	method agregarParcela(unaParcela)=parcelas.add(unaParcela)
	method promedioDePlantas(){
		return self.sumaDeTodasLasPlantasDeParcela()/self.cantidadDeParcelas()
	}
	method sumaDeTodasLasPlantasDeParcela(){
		return parcelas.sum({
			p=>p.totalDePlanta()
		})
	}
	method cantidadDeParcelas()=parcelas.size()
	
	method parcelasConMasDeCuatro() = parcelas.filter({p=>p.tieneMasDeCuatro()})
	method masAutosustentable(){
		self.parcelasConMasDeCuatro().max({p=>p.cantidadBienAsociadas()})
	}
}