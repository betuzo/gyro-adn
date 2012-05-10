package com.gyro.adn.domain

class Archivo {

	static belongsTo = [campania: Campania]

	String descripcion
	String ruta

    static constraints = {
    	descripcion blank:false
    	ruta blank:false
    }

    String toString(){
    	return descripcion
  	}
}
