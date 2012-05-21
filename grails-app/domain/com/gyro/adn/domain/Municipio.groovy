package com.gyro.adn.domain

class Municipio {

	String nombreCorto
	String nombreCompleto

	static belongsTo = [estado: Estado]

    static constraints = {
    	nombreCorto blank:false
    	nombreCompleto nullable:true, blank:true
    }

    String toString(){
        return "${nombreCorto}"
    }
}
