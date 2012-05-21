package com.gyro.adn.domain

class CompaniaClasificacion {

	String clasificacion
	String descripcion

	static hasMany = [subclasificaciones: CompaniaSubclasificacion]

    static constraints = {
    	clasificacion nullable:false
    	descripcion blank:true, nullable:true
    }

    String toString(){
        return "${clasificacion}"
    }
}
