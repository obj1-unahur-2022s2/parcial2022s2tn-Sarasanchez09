/*
 * El dominio propuesto en el ejercicio indicaba que la solución debía
 * encararse implementando una superclase Planta, ya que existen varios
 * atributos y métodos que son comunes a todas las variedades de plantas.
 * En tu solución se repite mucho código. Te dejo las correcciones para que
 * las analices detalladamente.
 * 
 * En el metodo horasDeSolTolera() de la clase Soja se está evaluando 
 * condiciones de más por faltar el else if. Te dejo la corrección.
 * 
 * En el método daNuevaSemilla() de la clase Soja, faltó evaluar la altura.
 * 
 * En el método esParcelaIdeal(unaParcela) de Quinoa no estaba correcta la condición.
 * 
 */
 
 


import parcelas.*

class Planta {
	var property anoDeObtencion
	var property altura
	
	method horasDeSolTolera()
	method espacio()
	method daNuevaSemilla() = self.esFuerte()
	method esFuerte() = self.horasDeSolTolera()>10
	method esParcelaIdeal(unaParcela)
}

class Menta inherits Planta {

	override method horasDeSolTolera()=6
	override method daNuevaSemilla(){return self.esFuerte()||altura>0.4}
	override method espacio(){return altura*3}
	override method esParcelaIdeal(unaParcela)=unaParcela.superficie()>6
	
}

class Soja inherits Planta{
	
	override method horasDeSolTolera(){
		if (self.esToleranteEntre()) return 7 
		else if(altura>1) return 9 else return 6
		
	}
	method esToleranteEntre(){return altura.between(0.5,1)}
	override method daNuevaSemilla(){return super() || (anoDeObtencion>2007 && altura > 1)}
	override method espacio(){return altura/2}
	override method esParcelaIdeal(unaParcela)=unaParcela.horasDeSol()==self.horasDeSolTolera()
}

class Quinoa inherits Planta{
	var property horasDeSolTolera
	
	override method daNuevaSemilla(){return super()||anoDeObtencion<2005}
	override method espacio(){return 0.5}
	override method esParcelaIdeal(unaParcela){return unaParcela.mayorAltura()<=1.5}
}
class SojaTransgenica inherits Soja{
	
	override method daNuevaSemilla()=false
	override method esParcelaIdeal(unaParcela)=unaParcela.cantidadMaxima()==1
}

class Hierbabuena  inherits Menta{
	override method espacio()=super()*2
}
