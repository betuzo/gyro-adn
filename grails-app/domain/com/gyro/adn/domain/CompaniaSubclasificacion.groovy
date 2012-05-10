package com.gyro.adn.domain

class CompaniaSubclasificacion {

	String subclasificacion
	String descripcion
    CompaniaClasificacion clasificacion

	static belongsTo = Compania

	static hasMany = [companias: Compania]

    static constraints = {
    	subclasificacion blank:false
    	descripcion blank:true, nullable:true
    }

    String toString(){
        return "${subclasificacion}"
    }
}
