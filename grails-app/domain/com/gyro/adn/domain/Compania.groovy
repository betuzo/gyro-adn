package com.gyro.adn.domain

class Compania {

	String nombre
	String nombreLargo
	String direccion
	String codigoPostal
	Municipio municipio
	Date fechaInicioRelacion

	static hasMany = [contactos: CompaniaContacto, 
					  campanias: Campania, 
					  productos: Producto,
					  subclasificaciones: CompaniaSubclasificacion]

    static constraints = {
    	nombre blank:false
    	nombreLargo nullable:true, blank:true
    	direccion blank:false
    	codigoPostal blank:false
    	municipio nullable:false
    	fechaInicioRelacion nullable:false
    	subclasificaciones nullable:true
    }

    String toString(){
        return "${nombre}"
    }
}
