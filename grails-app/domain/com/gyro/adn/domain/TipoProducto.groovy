package com.gyro.adn.domain

class TipoProducto {

	String clave
	String descripcion

    static hasMany = [productos: Producto]

    static constraints = {
    	clave blank:false
    	descripcion blank:true, nullable:true
    }

    String toString(){
        return "${clave}"
    }
}
