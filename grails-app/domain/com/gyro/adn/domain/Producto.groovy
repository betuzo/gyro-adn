package com.gyro.adn.domain

class Producto {

	String nombre
	String descripcion
	TipoProducto tipoProducto

	static belongsTo = [compania: Compania]

    static constraints = {
    	nombre blank:false
    	descripcion nullable:true, blank:true
    	tipoProducto nullable:false
    }

    String toString(){
        return "${nombre} - ${compania}"
    }
}
