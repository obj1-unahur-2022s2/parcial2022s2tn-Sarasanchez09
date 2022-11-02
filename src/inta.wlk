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
	
	method masAutosustentable(){
		
	}
}