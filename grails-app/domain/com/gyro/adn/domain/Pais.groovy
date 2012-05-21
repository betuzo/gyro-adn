package com.gyro.adn.domain

class Pais {

	String nombreCorto
	String nombreCompleto

    static hasMany = [estados: Estado]

    static constraints = {
    	nombreCorto blank:false
    	nombreCompleto nullable:true, blank:true
    }

    String toString(){
        return "${nombreCorto}"
    }
}
