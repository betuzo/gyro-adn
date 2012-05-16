package com.gyro.adn.domain

class CampaniaUsuario {

	Usuario usuario
	Campania campania
	String nivelUsuario
	Date fechaRegistro
	boolean contactoEmail
	boolean contactoTelefono
	boolean contestoEncuenta
	boolean confirmaAsistencia

    static constraints = {
    	usuario nullable:false
    	campania nullable:false
    	nivelUsuario inList: ["Cold", "Warm", "Hot"]
    	fechaRegistro nullable:false
    }

    String toString(){
    	return "${usuario} ${nivelUsuario}"
  	}
}
