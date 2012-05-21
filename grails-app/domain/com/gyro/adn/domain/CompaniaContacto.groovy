package com.gyro.adn.domain

class CompaniaContacto {

	static belongsTo = [compania: Compania]

	String nombre
	String apellidoPaterno
	String apellidoMaterno
	String email
	String direccion
	int codigoPostal
	Municipio municipio
	Date fechaRegistro

	static hasMany = [telefonos: TelefonoContacto]

    static constraints = {
    	nombre blank:false
    	apellidoPaterno blank:false
    	apellidoMaterno blank:true, nullable:true
    	email email:true, blank:false
    	direccion blank:false
    	codigoPostal blank:false
    	municipio nullable:false
    	fechaRegistro nullable:false
    }

    String toString(){
        return "${nombre} - ${apellidoPaterno}"
    }
}
