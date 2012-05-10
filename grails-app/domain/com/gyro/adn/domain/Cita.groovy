package com.gyro.adn.domain

class Cita {

	static belongsTo = [campania: Campania]

	String descripcion
	Date fecha
	String direccion
	String codigoPostal
	Municipio municipio

    static constraints = {
    	descripcion blank:false
    	fecha nullable:false
    	direccion blank:false
    	codigoPostal blank:false
    	municipio nullable:false
    }

    String toString(){
        return "${descripcion} - ${fecha}"
    }
}
