import parcelas.*
class Menta {
	
	var property anoDeObtencion
	var property altura
	
	method horasDeSolTolera()=6
	method esFuerte(){return self.horasDeSolTolera()>10}
	method daNuevaSemilla(){return self.esFuerte()||altura>0.4}
	method espacio(){return altura*3}
	method esParcelaIdeal(unaParcela)=unaParcela.superficie()>6
	
}

class Soja{
	var property anoDeObtencion
	var property altura
	
	method horasDeSolTolera(){
		if (self.esToleranteEntre()) return 7 
		if(altura>1) return 9 else  return 6
		
	}
	method esToleranteEntre(){return altura.between(0.5,1)}
	method esFuerte(){return self.horasDeSolTolera()>10}
	method daNuevaSemilla(){return self.esFuerte()||anoDeObtencion>2007}
	method espacio(){return altura/2}
	method esParcelaIdeal(unaParcela)=unaParcela.horasDeSol()==self.horasDeSolTolera()
}

class Quinoa {
	var property anoDeObtencion
	var property altura
	var property horasDeSolTolera
	
	method esFuerte(){return self.horasDeSolTolera()>10}
	method daNuevaSemilla(){return self.esFuerte()||anoDeObtencion<2005}
	method espacio(){return 0.5}
	method esParcelaIdeal(unaParcela){return unaParcela.mayorAltura()>altura}
}
class SojaTransgenica inherits Soja{
	
	override method daNuevaSemilla()=false
	override method esParcelaIdeal(unaParcela)=unaParcela.cantidadMaxima()==1
}

class Hierbabuena  inherits Menta{
	override method espacio()=super()*2
}
