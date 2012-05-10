package com.gyro.adn.domain

class Campania {

	String nombre
	Producto producto
	JefeCampania jefeCampania
	CompaniaContacto contacto
	double precio
	String tipoCampania
	Date fechaInicio
	Date fechaFin
	String fase
	String cid

	static hasMany = [citas: Cita, 
					  pagos: Pago, 
					  archivos: Archivo]

    static constraints = {
    	nombre nullable:false, unique:true
    	producto nullable:false
    	jefeCampania nullable:false
    	contacto nullable:false
    	precio nullable:true, blank:true
    	tipoCampania inList: ["Tipo1", "Tipo2", "Tipo3"]
    	fechaInicio nullable:false
    	fechaFin nullable:false, min : new Date()
    	fase inList: ["Contacto", "Diseño", "Emailing", "Preparacion", "Fin"]
    }

    String toString(){
    	return "${nombre} - ${producto}"
  	}
}
