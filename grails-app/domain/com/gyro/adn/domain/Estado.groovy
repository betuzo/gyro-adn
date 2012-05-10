package com.gyro.adn.domain

class Estado {

	String nombre

	static belongsTo = [pais: Pais]

	static hasMany = [municipios: Municipio]

    static constraints = {
    	nombre blank:false
    }

    String toString(){
        return "${nombre}"
    }
}
