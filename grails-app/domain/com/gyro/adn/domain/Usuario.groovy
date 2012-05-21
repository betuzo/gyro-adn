package com.gyro.adn.domain

class Usuario {

	String nombre
	String apellidoPaterno
	String apellidoMaterno
	String email
	String direccion
	String codigoPostal
	Municipio municipio
    String puesto
    String rango
    String area
    String idioma

	Date fechaRegistro

	static hasMany = [telefonos: TelefonoUsuario, 
					  campanias: CampaniaUsuario, 
					  productosComprados: Producto]

    static transients = ['nombreCompleto']

    String getNombreCompleto(){
        return "${nombre} ${apellidoPaterno}"
    }

    static constraints = {
    	nombre blank:false
    	apellidoPaterno blank:false
    	apellidoMaterno blank:true, nullable:true
    	email email:true, blank:false
    	direccion blank:false
    	codigoPostal blank:false
    	municipio nullable:false
    	fechaRegistro nullable:false
        puesto nullable: true
        rango nullable: true
        area nullable: true
        idioma nullable: true
    }

    String toString(){
        return "${nombre} - ${apellidoPaterno} - ${email}"
    }
}
